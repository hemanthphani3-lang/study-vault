import 'dart:convert';
import 'package:drift/drift.dart';
import '../../../core/database/daos/search_dao.dart';
import '../../../core/services/database/app_database.dart';
import '../../../domain/search/models/search_filter.dart';
import '../../../domain/search/models/search_result_item.dart';
import '../../../domain/search/models/search_sort_option.dart';
import '../../models/author_model.dart';
import '../../models/book_model.dart';
import '../../models/category_model.dart';
import '../../models/download_model.dart';
import '../../models/favorite_model.dart';
import '../../models/network_metadata_model.dart';
import '../../models/note_model.dart';
import '../../models/reading_progress_model.dart';
import '../../models/research_paper_model.dart';
import '../../models/resource_model.dart';
import '../../models/search_history_model.dart';
import '../../models/settings_model.dart';
import '../../../shared/enums/resource_type.dart';


/// Clean interface for all local database queries, streams, transactions, and mutations.
abstract interface class ILocalDataSource {
  // Books
  Future<List<BookModel>> getBooks({int limit = 50, int offset = 0, String? categoryId});
  Future<BookModel?> getBookById(String id);
  Future<BookModel?> getBookByCid(String cid);
  Future<void> saveBook(BookModel book);
  Future<void> saveBooksBatch(List<BookModel> books);
  Future<void> softDeleteBook(String id);
  Stream<List<BookModel>> watchBooks({String? categoryId});

  // Research Papers
  Future<List<ResearchPaperModel>> getResearchPapers({int limit = 50, int offset = 0, String? categoryId});
  Future<ResearchPaperModel?> getPaperById(String id);
  Future<void> saveResearchPaper(ResearchPaperModel paper);
  Future<void> softDeletePaper(String id);
  Stream<List<ResearchPaperModel>> watchResearchPapers();

  // Unified Resources
  Future<List<ResourceModel>> getAllResources({int limit = 100, int offset = 0, String? query});
  Future<ResourceModel?> getResourceById(String id);
  Future<void> insertResource(ResourceModel resource);

  // Notes
  Future<List<NoteModel>> getNotes({String? resourceId});
  Future<void> saveNote(NoteModel note);
  Future<void> softDeleteNote(String id);
  Stream<List<NoteModel>> watchNotes();

  // Downloads
  Future<List<DownloadModel>> getDownloads({bool activeOnly = false});
  Future<DownloadModel?> getDownloadByResourceId(String resourceId);
  Future<void> saveDownload(DownloadModel download);
  Future<void> updateDownloadProgress(String resourceId, double progress, int bytesDownloaded, int speedBps);
  Stream<List<DownloadModel>> watchDownloads();

  // Favorites
  Future<List<FavoriteModel>> getFavorites();
  Future<bool> isFavorite(String resourceId);
  Future<void> addFavorite(FavoriteModel favorite);
  Future<void> removeFavorite(String resourceId);
  Stream<List<FavoriteModel>> watchFavorites();

  // Reading Progress
  Future<ReadingProgressModel?> getReadingProgress(String resourceId);
  Future<void> saveReadingProgress(ReadingProgressModel progress);
  Stream<List<ReadingProgressModel>> watchRecentReading();

  // Categories & Authors
  Future<List<CategoryModel>> getCategories();
  Future<void> saveCategory(CategoryModel category);
  Future<List<AuthorModel>> getAuthors({int limit = 50});
  Future<void> saveAuthor(AuthorModel author);

  // Search History & Recents
  Future<List<SearchHistoryModel>> getSearchHistory({int limit = 20});
  Future<void> addSearchHistory(SearchHistoryModel history);
  Future<void> clearSearchHistory();
  Future<List<String>> getRecentSearches({int limit = 10});
  Future<void> recordRecentSearch(String term);
  Future<void> removeRecentSearch(String term);

  // Settings
  Future<SettingsModel?> getSetting(String key);
  Future<void> saveSetting(SettingsModel setting);
  Future<Map<String, String>> getAllSettings();

  // Network & Node Metadata
  Future<NetworkMetadataModel?> getNetworkMetadata(String swarmId);
  Future<void> saveNetworkMetadata(NetworkMetadataModel metadata);

  // Maintenance & Purge
  Future<void> purgeSoftDeleted();
  Future<int> getEstimatedDatabaseSizeBytes();

  // Advanced Search & Ranking
  Future<List<SearchResultItem>> searchAdvanced(
    SearchFilter filter, {
    SearchSortOption sort = SearchSortOption.mostRelevant,
    int limit = 50,
    int offset = 0,
  });
  Future<List<String>> getSuggestions(String prefix, {int limit = 8});
  Future<void> recordSearchQuery(String query, {int resultCount = 0, Map<String, dynamic> filters = const <String, dynamic>{}});
}

/// Concrete SQLite Drift implementation of [ILocalDataSource].
class LocalDataSourceImpl implements ILocalDataSource {
  LocalDataSourceImpl(this._db) : _searchDao = SearchDao(_db);

  final AppDatabase _db;
  final SearchDao _searchDao;

  // --------------------------------------------------------------------------
  // Books Implementation
  // --------------------------------------------------------------------------

  @override
  Future<List<BookModel>> getBooks({int limit = 50, int offset = 0, String? categoryId}) async {
    final SimpleSelectStatement<$BooksTable, Book> query = _db.select(_db.books)
      ..where(($BooksTable tbl) => tbl.isDeleted.equals(false))
      ..limit(limit, offset: offset)
      ..orderBy(<OrderClauseGenerator<$BooksTable>>[
        ($BooksTable t) => OrderingTerm(expression: t.updatedAt, mode: OrderingMode.desc),
      ]);

    if (categoryId != null) {
      query.where(($BooksTable tbl) => tbl.categoryId.equals(categoryId));
    }

    final List<Book> rows = await query.get();
    return rows.map(_mapBookRowToModel).toList();
  }

  @override
  Future<BookModel?> getBookById(String id) async {
    final Book? row = await (_db.select(_db.books)
          ..where(($BooksTable tbl) => tbl.id.equals(id) & tbl.isDeleted.equals(false)))
        .getSingleOrNull();
    return row != null ? _mapBookRowToModel(row) : null;
  }

  @override
  Future<BookModel?> getBookByCid(String cid) async {
    final Book? row = await (_db.select(_db.books)
          ..where(($BooksTable tbl) => tbl.cid.equals(cid) & tbl.isDeleted.equals(false)))
        .getSingleOrNull();
    return row != null ? _mapBookRowToModel(row) : null;
  }

  @override
  Future<void> saveBook(BookModel book) async {
    await _db.into(_db.books).insertOnConflictUpdate(
          BooksCompanion(
            id: Value<String>(book.id),
            title: Value<String>(book.title),
            subtitle: Value<String?>.absentIfNull(book.subtitle),
            authorsJson: Value<String>(jsonEncode(book.authors)),
            publisher: Value<String?>.absentIfNull(book.publisher),
            publicationYear: Value<int?>.absentIfNull(book.publicationYear),
            isbn: Value<String?>.absentIfNull(book.isbn),
            doi: Value<String?>.absentIfNull(book.doi),
            language: Value<String>(book.language),
            pageCount: Value<int>(book.pageCount),
            format: Value<String>(book.format),
            sizeBytes: Value<int>(book.sizeBytes),
            coverPath: Value<String?>.absentIfNull(book.coverPath),
            cid: Value<String?>.absentIfNull(book.cid),
            contentHash: Value<String?>.absentIfNull(book.contentHash),
            verificationTier: Value<String>(book.verificationTier),
            categoryId: Value<String?>.absentIfNull(book.categoryId),
            metadataJson: Value<String>(jsonEncode(book.metadata)),
            isDownloaded: Value<bool>(book.isDownloaded),
            peerSeeders: Value<int>(book.peerSeeders),
            createdAt: Value<DateTime>(book.createdAt ?? DateTime.now()),
            updatedAt: Value<DateTime>(DateTime.now()),
            isDeleted: Value<bool>(book.isDeleted),
            syncStatus: Value<String>(book.syncStatus),
            remoteId: Value<String?>.absentIfNull(book.remoteId),
            version: Value<int>(book.version),
            isDirty: Value<bool>(book.isDirty),
            nodeId: Value<String?>.absentIfNull(book.nodeId),
          ),
        );
  }

  @override
  Future<void> saveBooksBatch(List<BookModel> books) async {
    await _db.batch((Batch batch) {
      for (final BookModel book in books) {
        batch.insert(
          _db.books,
          BooksCompanion(
            id: Value<String>(book.id),
            title: Value<String>(book.title),
            subtitle: Value<String?>.absentIfNull(book.subtitle),
            authorsJson: Value<String>(jsonEncode(book.authors)),
            publisher: Value<String?>.absentIfNull(book.publisher),
            publicationYear: Value<int?>.absentIfNull(book.publicationYear),
            isbn: Value<String?>.absentIfNull(book.isbn),
            doi: Value<String?>.absentIfNull(book.doi),
            language: Value<String>(book.language),
            pageCount: Value<int>(book.pageCount),
            format: Value<String>(book.format),
            sizeBytes: Value<int>(book.sizeBytes),
            coverPath: Value<String?>.absentIfNull(book.coverPath),
            cid: Value<String?>.absentIfNull(book.cid),
            contentHash: Value<String?>.absentIfNull(book.contentHash),
            verificationTier: Value<String>(book.verificationTier),
            categoryId: Value<String?>.absentIfNull(book.categoryId),
            metadataJson: Value<String>(jsonEncode(book.metadata)),
            isDownloaded: Value<bool>(book.isDownloaded),
            peerSeeders: Value<int>(book.peerSeeders),
            createdAt: Value<DateTime>(book.createdAt ?? DateTime.now()),
            updatedAt: Value<DateTime>(DateTime.now()),
            isDeleted: Value<bool>(book.isDeleted),
            syncStatus: Value<String>(book.syncStatus),
            remoteId: Value<String?>.absentIfNull(book.remoteId),
            version: Value<int>(book.version),
            isDirty: Value<bool>(book.isDirty),
            nodeId: Value<String?>.absentIfNull(book.nodeId),
          ),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  @override
  Future<void> softDeleteBook(String id) async {
    await (_db.update(_db.books)..where(($BooksTable tbl) => tbl.id.equals(id))).write(
      BooksCompanion(
        isDeleted: const Value<bool>(true),
        deletedAt: Value<DateTime>(DateTime.now()),
        isDirty: const Value<bool>(true),
        syncStatus: const Value<String>('pending'),
      ),
    );
  }

  @override
  Stream<List<BookModel>> watchBooks({String? categoryId}) {
    final SimpleSelectStatement<$BooksTable, Book> query = _db.select(_db.books)
      ..where(($BooksTable tbl) => tbl.isDeleted.equals(false))
      ..orderBy(<OrderClauseGenerator<$BooksTable>>[
        ($BooksTable t) => OrderingTerm(expression: t.updatedAt, mode: OrderingMode.desc),
      ]);

    if (categoryId != null) {
      query.where(($BooksTable tbl) => tbl.categoryId.equals(categoryId));
    }

    return query.watch().map((List<Book> rows) => rows.map(_mapBookRowToModel).toList());
  }

  // --------------------------------------------------------------------------
  // Research Papers Implementation
  // --------------------------------------------------------------------------

  @override
  Future<List<ResearchPaperModel>> getResearchPapers({int limit = 50, int offset = 0, String? categoryId}) async {
    final SimpleSelectStatement<$ResearchPapersTable, ResearchPaper> query = _db.select(_db.researchPapers)
      ..where(($ResearchPapersTable tbl) => tbl.isDeleted.equals(false))
      ..limit(limit, offset: offset)
      ..orderBy(<OrderClauseGenerator<$ResearchPapersTable>>[
        ($ResearchPapersTable t) => OrderingTerm(expression: t.updatedAt, mode: OrderingMode.desc),
      ]);

    if (categoryId != null) {
      query.where(($ResearchPapersTable tbl) => tbl.categoryId.equals(categoryId));
    }

    final List<ResearchPaper> rows = await query.get();
    return rows.map(_mapPaperRowToModel).toList();
  }

  @override
  Future<ResearchPaperModel?> getPaperById(String id) async {
    final ResearchPaper? row = await (_db.select(_db.researchPapers)
          ..where(($ResearchPapersTable tbl) => tbl.id.equals(id) & tbl.isDeleted.equals(false)))
        .getSingleOrNull();
    return row != null ? _mapPaperRowToModel(row) : null;
  }

  @override
  Future<void> saveResearchPaper(ResearchPaperModel paper) async {
    await _db.into(_db.researchPapers).insertOnConflictUpdate(
          ResearchPapersCompanion(
            id: Value<String>(paper.id),
            title: Value<String>(paper.title),
            abstractText: Value<String>(paper.abstractText),
            authorsJson: Value<String>(jsonEncode(paper.authors)),
            journal: Value<String?>.absentIfNull(paper.journal),
            conference: Value<String?>.absentIfNull(paper.conference),
            volume: Value<String?>.absentIfNull(paper.volume),
            issue: Value<String?>.absentIfNull(paper.issue),
            pages: Value<String?>.absentIfNull(paper.pages),
            doi: Value<String?>.absentIfNull(paper.doi),
            arxivId: Value<String?>.absentIfNull(paper.arxivId),
            pubmedId: Value<String?>.absentIfNull(paper.pubmedId),
            publicationYear: Value<int?>.absentIfNull(paper.publicationYear),
            isPeerReviewed: Value<bool>(paper.isPeerReviewed),
            citationsCount: Value<int>(paper.citationsCount),
            cid: Value<String?>.absentIfNull(paper.cid),
            contentHash: Value<String?>.absentIfNull(paper.contentHash),
            sizeBytes: Value<int>(paper.sizeBytes),
            format: Value<String>(paper.format),
            categoryId: Value<String?>.absentIfNull(paper.categoryId),
            verificationTier: Value<String>(paper.verificationTier),
            isDownloaded: Value<bool>(paper.isDownloaded),
            peerSeeders: Value<int>(paper.peerSeeders),
            createdAt: Value<DateTime>(paper.createdAt ?? DateTime.now()),
            updatedAt: Value<DateTime>(DateTime.now()),
            isDeleted: Value<bool>(paper.isDeleted),
            syncStatus: Value<String>(paper.syncStatus),
            remoteId: Value<String?>.absentIfNull(paper.remoteId),
            version: Value<int>(paper.version),
            isDirty: Value<bool>(paper.isDirty),
            nodeId: Value<String?>.absentIfNull(paper.nodeId),
          ),
        );
  }

  @override
  Future<void> softDeletePaper(String id) async {
    await (_db.update(_db.researchPapers)..where(($ResearchPapersTable tbl) => tbl.id.equals(id))).write(
      ResearchPapersCompanion(
        isDeleted: const Value<bool>(true),
        deletedAt: Value<DateTime>(DateTime.now()),
        isDirty: const Value<bool>(true),
      ),
    );
  }

  @override
  Stream<List<ResearchPaperModel>> watchResearchPapers() {
    return (_db.select(_db.researchPapers)
          ..where(($ResearchPapersTable tbl) => tbl.isDeleted.equals(false))
          ..orderBy(<OrderClauseGenerator<$ResearchPapersTable>>[
            ($ResearchPapersTable t) => OrderingTerm(expression: t.updatedAt, mode: OrderingMode.desc),
          ]))
        .watch()
        .map((List<ResearchPaper> rows) => rows.map(_mapPaperRowToModel).toList());
  }

  // --------------------------------------------------------------------------
  // Unified Resources
  // --------------------------------------------------------------------------

  @override
  Future<List<ResourceModel>> getAllResources({int limit = 100, int offset = 0, String? query}) async {
    final List<BookModel> books = await getBooks(limit: limit, offset: offset);
    final List<ResearchPaperModel> papers = await getResearchPapers(limit: limit, offset: offset);

    final List<ResourceModel> list = <ResourceModel>[
      ...books.map((BookModel b) => ResourceModel(
            id: b.id,
            title: b.title,
            subtitle: b.subtitle,
            authors: b.authors,
            publicationYear: b.publicationYear,
            format: b.format,
            sizeBytes: b.sizeBytes,
            coverPath: b.coverPath,
            cid: b.cid,
            contentHash: b.contentHash,
            doi: b.doi,
            categoryId: b.categoryId,
            peerSeeders: b.peerSeeders,
            isDownloaded: b.isDownloaded,
            createdAt: b.createdAt,
            updatedAt: b.updatedAt,
          )),
      ...papers.map((ResearchPaperModel p) => ResourceModel(
            id: p.id,
            title: p.title,
            authors: p.authors,
            publicationYear: p.publicationYear,
            format: p.format,
            sizeBytes: p.sizeBytes,
            cid: p.cid,
            contentHash: p.contentHash,
            doi: p.doi,
            categoryId: p.categoryId,
            peerSeeders: p.peerSeeders,
            isDownloaded: p.isDownloaded,
            createdAt: p.createdAt,
            updatedAt: p.updatedAt,
          )),
    ];

    if (query != null && query.trim().isNotEmpty) {
      final String term = query.toLowerCase();
      return list.where((ResourceModel r) => r.title.toLowerCase().contains(term)).toList();
    }

    return list;
  }

  @override
  Future<void> insertResource(ResourceModel resource) async {
    // Route to the correct underlying table based on resource type
    if (resource.type == ResourceType.book) {
      await saveBook(BookModel(
        id: resource.id,
        title: resource.title,
        subtitle: resource.subtitle,
        authors: resource.authors,
        publicationYear: resource.publicationYear,
        doi: resource.doi,
        format: resource.format,
        sizeBytes: resource.sizeBytes,
        cid: resource.cid,
        contentHash: resource.contentHash,
        categoryId: resource.categoryId,
        peerSeeders: resource.peerSeeders,
        verificationTier: resource.verificationTier.name,
      ));
    } else {
      await saveResearchPaper(ResearchPaperModel(
        id: resource.id,
        title: resource.title,
        authors: resource.authors,
        publicationYear: resource.publicationYear,
        doi: resource.doi,
        format: resource.format,
        sizeBytes: resource.sizeBytes,
        cid: resource.cid,
        contentHash: resource.contentHash,
        categoryId: resource.categoryId,
        peerSeeders: resource.peerSeeders,
        verificationTier: resource.verificationTier.name,
      ));
    }
  }

  @override
  Future<ResourceModel?> getResourceById(String id) async {
    final BookModel? book = await getBookById(id);
    if (book != null) {
      return ResourceModel(
        id: book.id,
        title: book.title,
        subtitle: book.subtitle,
        authors: book.authors,
        publicationYear: book.publicationYear,
        format: book.format,
        sizeBytes: book.sizeBytes,
        coverPath: book.coverPath,
        cid: book.cid,
        contentHash: book.contentHash,
        doi: book.doi,
        categoryId: book.categoryId,
        peerSeeders: book.peerSeeders,
        isDownloaded: book.isDownloaded,
      );
    }
    final ResearchPaperModel? paper = await getPaperById(id);
    if (paper != null) {
      return ResourceModel(
        id: paper.id,
        title: paper.title,
        authors: paper.authors,
        publicationYear: paper.publicationYear,
        format: paper.format,
        sizeBytes: paper.sizeBytes,
        cid: paper.cid,
        contentHash: paper.contentHash,
        doi: paper.doi,
        categoryId: paper.categoryId,
        peerSeeders: paper.peerSeeders,
        isDownloaded: paper.isDownloaded,
      );
    }
    return null;
  }

  // --------------------------------------------------------------------------
  // Notes
  // --------------------------------------------------------------------------

  @override
  Future<List<NoteModel>> getNotes({String? resourceId}) async {
    final SimpleSelectStatement<$NotesTable, Note> query = _db.select(_db.notes)
      ..where(($NotesTable tbl) => tbl.isDeleted.equals(false))
      ..orderBy(<OrderClauseGenerator<$NotesTable>>[
        ($NotesTable t) => OrderingTerm(expression: t.isPinned, mode: OrderingMode.desc),
        ($NotesTable t) => OrderingTerm(expression: t.updatedAt, mode: OrderingMode.desc),
      ]);

    if (resourceId != null) {
      query.where(($NotesTable tbl) => tbl.resourceId.equals(resourceId));
    }

    final List<Note> rows = await query.get();
    return rows.map(_mapNoteRowToModel).toList();
  }

  @override
  Future<void> saveNote(NoteModel note) async {
    await _db.into(_db.notes).insertOnConflictUpdate(
          NotesCompanion(
            id: Value<String>(note.id),
            title: Value<String>(note.title),
            content: Value<String>(note.content),
            resourceId: Value<String?>.absentIfNull(note.resourceId),
            resourceType: Value<String>(note.resourceType),
            colorHex: Value<String?>.absentIfNull(note.colorHex),
            tagsJson: Value<String>(jsonEncode(note.tags)),
            isPinned: Value<bool>(note.isPinned),
            readingPosition: Value<String?>.absentIfNull(note.readingPosition),
            createdAt: Value<DateTime>(note.createdAt ?? DateTime.now()),
            updatedAt: Value<DateTime>(DateTime.now()),
            isDeleted: Value<bool>(note.isDeleted),
            syncStatus: Value<String>(note.syncStatus),
            remoteId: Value<String?>.absentIfNull(note.remoteId),
            version: Value<int>(note.version),
            isDirty: Value<bool>(note.isDirty),
            nodeId: Value<String?>.absentIfNull(note.nodeId),
          ),
        );
  }

  @override
  Future<void> softDeleteNote(String id) async {
    await (_db.update(_db.notes)..where(($NotesTable tbl) => tbl.id.equals(id))).write(
      NotesCompanion(
        isDeleted: const Value<bool>(true),
        deletedAt: Value<DateTime>(DateTime.now()),
        isDirty: const Value<bool>(true),
      ),
    );
  }

  @override
  Stream<List<NoteModel>> watchNotes() {
    return (_db.select(_db.notes)
          ..where(($NotesTable tbl) => tbl.isDeleted.equals(false))
          ..orderBy(<OrderClauseGenerator<$NotesTable>>[
            ($NotesTable t) => OrderingTerm(expression: t.isPinned, mode: OrderingMode.desc),
            ($NotesTable t) => OrderingTerm(expression: t.updatedAt, mode: OrderingMode.desc),
          ]))
        .watch()
        .map((List<Note> rows) => rows.map(_mapNoteRowToModel).toList());
  }

  // --------------------------------------------------------------------------
  // Downloads
  // --------------------------------------------------------------------------

  @override
  Future<List<DownloadModel>> getDownloads({bool activeOnly = false}) async {
    final SimpleSelectStatement<$DownloadsTable, Download> query = _db.select(_db.downloads)
      ..where(($DownloadsTable tbl) => tbl.isDeleted.equals(false))
      ..orderBy(<OrderClauseGenerator<$DownloadsTable>>[
        ($DownloadsTable t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc),
      ]);

    if (activeOnly) {
      query.where(($DownloadsTable tbl) => tbl.downloadStatus.equals('downloading') | tbl.downloadStatus.equals('pending'));
    }

    final List<Download> rows = await query.get();
    return rows.map(_mapDownloadRowToModel).toList();
  }

  @override
  Future<DownloadModel?> getDownloadByResourceId(String resourceId) async {
    final Download? row = await (_db.select(_db.downloads)
          ..where(($DownloadsTable tbl) => tbl.resourceId.equals(resourceId) & tbl.isDeleted.equals(false)))
        .getSingleOrNull();
    return row != null ? _mapDownloadRowToModel(row) : null;
  }

  @override
  Future<void> saveDownload(DownloadModel download) async {
    await _db.into(_db.downloads).insertOnConflictUpdate(
          DownloadsCompanion(
            id: Value<String>(download.id),
            resourceId: Value<String>(download.resourceId),
            resourceType: Value<String>(download.resourceType),
            title: Value<String>(download.title),
            filePath: Value<String?>.absentIfNull(download.filePath),
            fileSizeBytes: Value<int>(download.fileSizeBytes),
            bytesDownloaded: Value<int>(download.bytesDownloaded),
            downloadStatus: Value<String>(download.downloadStatus),
            downloadSpeedBps: Value<int>(download.downloadSpeedBps),
            progress: Value<double>(download.progress),
            errorMessage: Value<String?>.absentIfNull(download.errorMessage),
            cid: Value<String?>.absentIfNull(download.cid),
            peerCount: Value<int>(download.peerCount),
            completedAt: Value<DateTime?>.absentIfNull(download.completedAt),
            createdAt: Value<DateTime>(download.createdAt ?? DateTime.now()),
            updatedAt: Value<DateTime>(DateTime.now()),
            isDeleted: Value<bool>(download.isDeleted),
            syncStatus: Value<String>(download.syncStatus),
            remoteId: Value<String?>.absentIfNull(download.remoteId),
            version: Value<int>(download.version),
            isDirty: Value<bool>(download.isDirty),
            nodeId: Value<String?>.absentIfNull(download.nodeId),
          ),
        );
  }

  @override
  Future<void> updateDownloadProgress(String resourceId, double progress, int bytesDownloaded, int speedBps) async {
    await (_db.update(_db.downloads)..where(($DownloadsTable tbl) => tbl.resourceId.equals(resourceId))).write(
      DownloadsCompanion(
        progress: Value<double>(progress),
        bytesDownloaded: Value<int>(bytesDownloaded),
        downloadSpeedBps: Value<int>(speedBps),
        downloadStatus: Value<String>(progress >= 1.0 ? 'completed' : 'downloading'),
        completedAt: progress >= 1.0 ? Value<DateTime>(DateTime.now()) : const Value<DateTime?>.absent(),
        updatedAt: Value<DateTime>(DateTime.now()),
      ),
    );
  }

  @override
  Stream<List<DownloadModel>> watchDownloads() {
    return (_db.select(_db.downloads)
          ..where(($DownloadsTable tbl) => tbl.isDeleted.equals(false))
          ..orderBy(<OrderClauseGenerator<$DownloadsTable>>[
            ($DownloadsTable t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc),
          ]))
        .watch()
        .map((List<Download> rows) => rows.map(_mapDownloadRowToModel).toList());
  }

  // --------------------------------------------------------------------------
  // Favorites
  // --------------------------------------------------------------------------

  @override
  Future<List<FavoriteModel>> getFavorites() async {
    final List<Favorite> rows = await (_db.select(_db.favorites)
          ..where(($FavoritesTable tbl) => tbl.isDeleted.equals(false))
          ..orderBy(<OrderClauseGenerator<$FavoritesTable>>[
            ($FavoritesTable t) => OrderingTerm(expression: t.addedAt, mode: OrderingMode.desc),
          ]))
        .get();
    return rows.map(_mapFavoriteRowToModel).toList();
  }

  @override
  Future<bool> isFavorite(String resourceId) async {
    final Favorite? row = await (_db.select(_db.favorites)
          ..where(($FavoritesTable tbl) => tbl.resourceId.equals(resourceId) & tbl.isDeleted.equals(false)))
        .getSingleOrNull();
    return row != null;
  }

  @override
  Future<void> addFavorite(FavoriteModel favorite) async {
    await _db.into(_db.favorites).insertOnConflictUpdate(
          FavoritesCompanion(
            id: Value<String>(favorite.id),
            resourceId: Value<String>(favorite.resourceId),
            resourceType: Value<String>(favorite.resourceType),
            title: Value<String>(favorite.title),
            authorsJson: Value<String>(jsonEncode(favorite.authors)),
            coverPath: Value<String?>.absentIfNull(favorite.coverPath),
            categoryId: Value<String?>.absentIfNull(favorite.categoryId),
            addedAt: Value<DateTime>(favorite.addedAt ?? DateTime.now()),
            createdAt: Value<DateTime>(favorite.createdAt ?? DateTime.now()),
            updatedAt: Value<DateTime>(DateTime.now()),
            isDeleted: Value<bool>(favorite.isDeleted),
            syncStatus: Value<String>(favorite.syncStatus),
            remoteId: Value<String?>.absentIfNull(favorite.remoteId),
            version: Value<int>(favorite.version),
            isDirty: Value<bool>(favorite.isDirty),
            nodeId: Value<String?>.absentIfNull(favorite.nodeId),
          ),
        );
  }

  @override
  Future<void> removeFavorite(String resourceId) async {
    await (_db.update(_db.favorites)..where(($FavoritesTable tbl) => tbl.resourceId.equals(resourceId))).write(
      FavoritesCompanion(
        isDeleted: const Value<bool>(true),
        deletedAt: Value<DateTime>(DateTime.now()),
        isDirty: const Value<bool>(true),
      ),
    );
  }

  @override
  Stream<List<FavoriteModel>> watchFavorites() {
    return (_db.select(_db.favorites)
          ..where(($FavoritesTable tbl) => tbl.isDeleted.equals(false))
          ..orderBy(<OrderClauseGenerator<$FavoritesTable>>[
            ($FavoritesTable t) => OrderingTerm(expression: t.addedAt, mode: OrderingMode.desc),
          ]))
        .watch()
        .map((List<Favorite> rows) => rows.map(_mapFavoriteRowToModel).toList());
  }

  // --------------------------------------------------------------------------
  // Reading Progress
  // --------------------------------------------------------------------------

  @override
  Future<ReadingProgressModel?> getReadingProgress(String resourceId) async {
    final ReadingProgressData? row = await (_db.select(_db.readingProgress)
          ..where(($ReadingProgressTable tbl) => tbl.resourceId.equals(resourceId) & tbl.isDeleted.equals(false)))
        .getSingleOrNull();
    return row != null ? _mapProgressRowToModel(row) : null;
  }

  @override
  Future<void> saveReadingProgress(ReadingProgressModel progress) async {
    await _db.into(_db.readingProgress).insertOnConflictUpdate(
          ReadingProgressCompanion(
            id: Value<String>(progress.id),
            resourceId: Value<String>(progress.resourceId),
            resourceType: Value<String>(progress.resourceType),
            title: Value<String>(progress.title),
            currentPage: Value<int>(progress.currentPage),
            totalPages: Value<int>(progress.totalPages),
            progress: Value<double>(progress.progress),
            lastReadPosition: Value<String?>.absentIfNull(progress.lastReadPosition),
            timeSpentSeconds: Value<int>(progress.timeSpentSeconds),
            lastReadAt: Value<DateTime>(progress.lastReadAt ?? DateTime.now()),
            createdAt: Value<DateTime>(progress.createdAt ?? DateTime.now()),
            updatedAt: Value<DateTime>(DateTime.now()),
            isDeleted: Value<bool>(progress.isDeleted),
            syncStatus: Value<String>(progress.syncStatus),
            remoteId: Value<String?>.absentIfNull(progress.remoteId),
            version: Value<int>(progress.version),
            isDirty: Value<bool>(progress.isDirty),
            nodeId: Value<String?>.absentIfNull(progress.nodeId),
          ),
        );
  }

  @override
  Stream<List<ReadingProgressModel>> watchRecentReading() {
    return (_db.select(_db.readingProgress)
          ..where(($ReadingProgressTable tbl) => tbl.isDeleted.equals(false))
          ..orderBy(<OrderClauseGenerator<$ReadingProgressTable>>[
            ($ReadingProgressTable t) => OrderingTerm(expression: t.lastReadAt, mode: OrderingMode.desc),
          ]))
        .watch()
        .map((List<ReadingProgressData> rows) => rows.map(_mapProgressRowToModel).toList());
  }

  // --------------------------------------------------------------------------
  // Categories & Authors
  // --------------------------------------------------------------------------

  @override
  Future<List<CategoryModel>> getCategories() async {
    final List<Category> rows = await (_db.select(_db.categories)
          ..where(($CategoriesTable tbl) => tbl.isDeleted.equals(false))
          ..orderBy(<OrderClauseGenerator<$CategoriesTable>>[
            ($CategoriesTable t) => OrderingTerm(expression: t.displayOrder, mode: OrderingMode.asc),
          ]))
        .get();
    return rows.map(_mapCategoryRowToModel).toList();
  }

  @override
  Future<void> saveCategory(CategoryModel category) async {
    await _db.into(_db.categories).insertOnConflictUpdate(
          CategoriesCompanion(
            id: Value<String>(category.id),
            slug: Value<String>(category.slug),
            name: Value<String>(category.name),
            description: Value<String?>.absentIfNull(category.description),
            iconName: Value<String>(category.iconName),
            accentColorHex: Value<String>(category.accentColorHex),
            parentCategoryId: Value<String?>.absentIfNull(category.parentCategoryId),
            itemCount: Value<int>(category.itemCount),
            displayOrder: Value<int>(category.displayOrder),
            createdAt: Value<DateTime>(category.createdAt ?? DateTime.now()),
            updatedAt: Value<DateTime>(DateTime.now()),
            isDeleted: Value<bool>(category.isDeleted),
            syncStatus: Value<String>(category.syncStatus),
            remoteId: Value<String?>.absentIfNull(category.remoteId),
            version: Value<int>(category.version),
            isDirty: Value<bool>(category.isDirty),
            nodeId: Value<String?>.absentIfNull(category.nodeId),
          ),
        );
  }

  @override
  Future<List<AuthorModel>> getAuthors({int limit = 50}) async {
    final List<Author> rows = await (_db.select(_db.authors)
          ..where(($AuthorsTable tbl) => tbl.isDeleted.equals(false))
          ..limit(limit)
          ..orderBy(<OrderClauseGenerator<$AuthorsTable>>[
            ($AuthorsTable t) => OrderingTerm(expression: t.publicationCount, mode: OrderingMode.desc),
          ]))
        .get();
    return rows.map(_mapAuthorRowToModel).toList();
  }

  @override
  Future<void> saveAuthor(AuthorModel author) async {
    await _db.into(_db.authors).insertOnConflictUpdate(
          AuthorsCompanion(
            id: Value<String>(author.id),
            name: Value<String>(author.name),
            orcid: Value<String?>.absentIfNull(author.orcid),
            institution: Value<String?>.absentIfNull(author.institution),
            bio: Value<String?>.absentIfNull(author.bio),
            avatarUrl: Value<String?>.absentIfNull(author.avatarUrl),
            publicationCount: Value<int>(author.publicationCount),
            hIndex: Value<int>(author.hIndex),
            createdAt: Value<DateTime>(author.createdAt ?? DateTime.now()),
            updatedAt: Value<DateTime>(DateTime.now()),
            isDeleted: Value<bool>(author.isDeleted),
            syncStatus: Value<String>(author.syncStatus),
            remoteId: Value<String?>.absentIfNull(author.remoteId),
            version: Value<int>(author.version),
            isDirty: Value<bool>(author.isDirty),
            nodeId: Value<String?>.absentIfNull(author.nodeId),
          ),
        );
  }

  // --------------------------------------------------------------------------
  // Search History & Recents
  // --------------------------------------------------------------------------

  @override
  Future<List<SearchHistoryModel>> getSearchHistory({int limit = 20}) async {
    final List<SearchHistoryData> rows = await (_db.select(_db.searchHistory)
          ..where(($SearchHistoryTable tbl) => tbl.isDeleted.equals(false))
          ..limit(limit)
          ..orderBy(<OrderClauseGenerator<$SearchHistoryTable>>[
            ($SearchHistoryTable t) => OrderingTerm(expression: t.searchedAt, mode: OrderingMode.desc),
          ]))
        .get();
    return rows.map(_mapHistoryRowToModel).toList();
  }

  @override
  Future<void> addSearchHistory(SearchHistoryModel history) async {
    await _db.into(_db.searchHistory).insertOnConflictUpdate(
          SearchHistoryCompanion(
            id: Value<String>(history.id),
            query: Value<String>(history.query),
            resultCount: Value<int>(history.resultCount),
            filtersJson: Value<String>(jsonEncode(history.filters)),
            searchedAt: Value<DateTime>(history.searchedAt ?? DateTime.now()),
            createdAt: Value<DateTime>(history.createdAt ?? DateTime.now()),
            updatedAt: Value<DateTime>(DateTime.now()),
            isDeleted: Value<bool>(history.isDeleted),
            syncStatus: Value<String>(history.syncStatus),
            remoteId: Value<String?>.absentIfNull(history.remoteId),
            version: Value<int>(history.version),
            isDirty: Value<bool>(history.isDirty),
            nodeId: Value<String?>.absentIfNull(history.nodeId),
          ),
        );
  }

  @override
  Future<void> clearSearchHistory() async {
    await (_db.update(_db.searchHistory)).write(
      SearchHistoryCompanion(
        isDeleted: const Value<bool>(true),
        deletedAt: Value<DateTime>(DateTime.now()),
      ),
    );
  }

  @override
  Future<List<String>> getRecentSearches({int limit = 10}) async {
    final List<RecentSearche> rows = await (_db.select(_db.recentSearches)
          ..where(($RecentSearchesTable tbl) => tbl.isDeleted.equals(false))
          ..limit(limit)
          ..orderBy(<OrderClauseGenerator<$RecentSearchesTable>>[
            ($RecentSearchesTable t) => OrderingTerm(expression: t.lastQueriedAt, mode: OrderingMode.desc),
          ]))
        .get();
    return rows.map((RecentSearche r) => r.term).toList();
  }

  @override
  Future<void> recordRecentSearch(String term) async {
    final String cleanTerm = term.trim();
    if (cleanTerm.isEmpty) return;

    final RecentSearche? existing = await (_db.select(_db.recentSearches)
          ..where(($RecentSearchesTable tbl) => tbl.term.equals(cleanTerm) & tbl.isDeleted.equals(false)))
        .getSingleOrNull();

    if (existing != null) {
      await (_db.update(_db.recentSearches)..where(($RecentSearchesTable tbl) => tbl.id.equals(existing.id))).write(
        RecentSearchesCompanion(
          hitCount: Value<int>(existing.hitCount + 1),
          lastQueriedAt: Value<DateTime>(DateTime.now()),
          updatedAt: Value<DateTime>(DateTime.now()),
        ),
      );
    } else {
      await _db.into(_db.recentSearches).insert(
            RecentSearchesCompanion(
              id: Value<String>('search_${DateTime.now().millisecondsSinceEpoch}'),
              term: Value<String>(cleanTerm),
              hitCount: const Value<int>(1),
              lastQueriedAt: Value<DateTime>(DateTime.now()),
              createdAt: Value<DateTime>(DateTime.now()),
              updatedAt: Value<DateTime>(DateTime.now()),
            ),
          );
    }
  }

  @override
  Future<void> removeRecentSearch(String term) async {
    await (_db.update(_db.recentSearches)..where(($RecentSearchesTable tbl) => tbl.term.equals(term))).write(
      RecentSearchesCompanion(
        isDeleted: const Value<bool>(true),
        deletedAt: Value<DateTime>(DateTime.now()),
      ),
    );
  }

  // --------------------------------------------------------------------------
  // Settings
  // --------------------------------------------------------------------------

  @override
  Future<SettingsModel?> getSetting(String key) async {
    final Setting? row = await (_db.select(_db.settings)
          ..where(($SettingsTable tbl) => tbl.key.equals(key) & tbl.isDeleted.equals(false)))
        .getSingleOrNull();
    return row != null ? _mapSettingRowToModel(row) : null;
  }

  @override
  Future<void> saveSetting(SettingsModel setting) async {
    await _db.into(_db.settings).insertOnConflictUpdate(
          SettingsCompanion(
            id: Value<String>(setting.id),
            key: Value<String>(setting.key),
            value: Value<String>(setting.value),
            category: Value<String>(setting.category),
            isEncrypted: Value<bool>(setting.isEncrypted),
            createdAt: Value<DateTime>(setting.createdAt ?? DateTime.now()),
            updatedAt: Value<DateTime>(DateTime.now()),
            isDeleted: Value<bool>(setting.isDeleted),
            syncStatus: Value<String>(setting.syncStatus),
            remoteId: Value<String?>.absentIfNull(setting.remoteId),
            version: Value<int>(setting.version),
            isDirty: Value<bool>(setting.isDirty),
            nodeId: Value<String?>.absentIfNull(setting.nodeId),
          ),
        );
  }

  @override
  Future<Map<String, String>> getAllSettings() async {
    final List<Setting> rows = await (_db.select(_db.settings)..where(($SettingsTable tbl) => tbl.isDeleted.equals(false))).get();
    return <String, String>{for (final Setting r in rows) r.key: r.value};
  }

  // --------------------------------------------------------------------------
  // Network Metadata
  // --------------------------------------------------------------------------

  @override
  Future<NetworkMetadataModel?> getNetworkMetadata(String swarmId) async {
    final NetworkMetadataData? row = await (_db.select(_db.networkMetadata)
          ..where(($NetworkMetadataTable tbl) => tbl.swarmId.equals(swarmId) & tbl.isDeleted.equals(false)))
        .getSingleOrNull();
    return row != null ? _mapNetworkRowToModel(row) : null;
  }

  @override
  Future<void> saveNetworkMetadata(NetworkMetadataModel metadata) async {
    await _db.into(_db.networkMetadata).insertOnConflictUpdate(
          NetworkMetadataCompanion(
            id: Value<String>(metadata.id),
            swarmId: Value<String>(metadata.swarmId),
            peerCount: Value<int>(metadata.peerCount),
            averageLatencyMs: Value<int>(metadata.averageLatencyMs),
            downloadSpeedBps: Value<int>(metadata.downloadSpeedBps),
            uploadSpeedBps: Value<int>(metadata.uploadSpeedBps),
            dhtReputationScore: Value<double>(metadata.dhtReputationScore),
            totalBytesShared: Value<int>(metadata.totalBytesShared),
            totalBytesReceived: Value<int>(metadata.totalBytesReceived),
            lastHealthCheckAt: Value<DateTime>(metadata.lastHealthCheckAt ?? DateTime.now()),
            createdAt: Value<DateTime>(metadata.createdAt ?? DateTime.now()),
            updatedAt: Value<DateTime>(DateTime.now()),
            isDeleted: Value<bool>(metadata.isDeleted),
            syncStatus: Value<String>(metadata.syncStatus),
            remoteId: Value<String?>.absentIfNull(metadata.remoteId),
            version: Value<int>(metadata.version),
            isDirty: Value<bool>(metadata.isDirty),
            nodeId: Value<String?>.absentIfNull(metadata.nodeId),
          ),
        );
  }

  // --------------------------------------------------------------------------
  // Maintenance & Quota
  // --------------------------------------------------------------------------

  @override
  Future<void> purgeSoftDeleted() async {
    await (_db.delete(_db.books)..where(($BooksTable tbl) => tbl.isDeleted.equals(true))).go();
    await (_db.delete(_db.researchPapers)..where(($ResearchPapersTable tbl) => tbl.isDeleted.equals(true))).go();
    await (_db.delete(_db.notes)..where(($NotesTable tbl) => tbl.isDeleted.equals(true))).go();
    await (_db.delete(_db.downloads)..where(($DownloadsTable tbl) => tbl.isDeleted.equals(true))).go();
    await (_db.delete(_db.favorites)..where(($FavoritesTable tbl) => tbl.isDeleted.equals(true))).go();
    await (_db.delete(_db.searchHistory)..where(($SearchHistoryTable tbl) => tbl.isDeleted.equals(true))).go();
    await (_db.delete(_db.recentSearches)..where(($RecentSearchesTable tbl) => tbl.isDeleted.equals(true))).go();
  }

  @override
  Future<int> getEstimatedDatabaseSizeBytes() async {
    final List<QueryRow> res = await _db.customSelect('PRAGMA page_count;').get();
    final List<QueryRow> sizeRes = await _db.customSelect('PRAGMA page_size;').get();
    if (res.isNotEmpty && sizeRes.isNotEmpty) {
      final int pageCount = res.first.read<int>('page_count');
      final int pageSize = sizeRes.first.read<int>('page_size');
      return pageCount * pageSize;
    }
    return 0;
  }

  // --------------------------------------------------------------------------
  // Row to Model Mappers
  // --------------------------------------------------------------------------

  BookModel _mapBookRowToModel(Book row) {
    List<String> authors = <String>[];
    try {
      final dynamic decoded = jsonDecode(row.authorsJson);
      if (decoded is List) {
        authors = decoded.map((dynamic e) => e.toString()).toList();
      }
    } catch (_) {}

    Map<String, dynamic> metadata = <String, dynamic>{};
    try {
      final dynamic decoded = jsonDecode(row.metadataJson);
      if (decoded is Map<String, dynamic>) {
        metadata = decoded;
      }
    } catch (_) {}

    return BookModel(
      id: row.id,
      title: row.title,
      subtitle: row.subtitle,
      authors: authors,
      publisher: row.publisher,
      publicationYear: row.publicationYear,
      isbn: row.isbn,
      doi: row.doi,
      language: row.language,
      pageCount: row.pageCount,
      format: row.format,
      sizeBytes: row.sizeBytes,
      coverPath: row.coverPath,
      cid: row.cid,
      contentHash: row.contentHash,
      verificationTier: row.verificationTier,
      categoryId: row.categoryId,
      metadata: metadata,
      isDownloaded: row.isDownloaded,
      peerSeeders: row.peerSeeders,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      isDeleted: row.isDeleted,
      deletedAt: row.deletedAt,
      syncStatus: row.syncStatus,
      lastSyncedAt: row.lastSyncedAt,
      remoteId: row.remoteId,
      version: row.version,
      isDirty: row.isDirty,
      nodeId: row.nodeId,
    );
  }

  ResearchPaperModel _mapPaperRowToModel(ResearchPaper row) {
    List<String> authors = <String>[];
    try {
      final dynamic decoded = jsonDecode(row.authorsJson);
      if (decoded is List) {
        authors = decoded.map((dynamic e) => e.toString()).toList();
      }
    } catch (_) {}

    return ResearchPaperModel(
      id: row.id,
      title: row.title,
      abstractText: row.abstractText,
      authors: authors,
      journal: row.journal,
      conference: row.conference,
      volume: row.volume,
      issue: row.issue,
      pages: row.pages,
      doi: row.doi,
      arxivId: row.arxivId,
      pubmedId: row.pubmedId,
      publicationYear: row.publicationYear,
      isPeerReviewed: row.isPeerReviewed,
      citationsCount: row.citationsCount,
      cid: row.cid,
      contentHash: row.contentHash,
      sizeBytes: row.sizeBytes,
      format: row.format,
      categoryId: row.categoryId,
      verificationTier: row.verificationTier,
      isDownloaded: row.isDownloaded,
      peerSeeders: row.peerSeeders,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      isDeleted: row.isDeleted,
      deletedAt: row.deletedAt,
      syncStatus: row.syncStatus,
      lastSyncedAt: row.lastSyncedAt,
      remoteId: row.remoteId,
      version: row.version,
      isDirty: row.isDirty,
      nodeId: row.nodeId,
    );
  }

  NoteModel _mapNoteRowToModel(Note row) {
    List<String> tags = <String>[];
    try {
      final dynamic decoded = jsonDecode(row.tagsJson);
      if (decoded is List) {
        tags = decoded.map((dynamic e) => e.toString()).toList();
      }
    } catch (_) {}

    return NoteModel(
      id: row.id,
      title: row.title,
      content: row.content,
      resourceId: row.resourceId,
      resourceType: row.resourceType,
      colorHex: row.colorHex,
      tags: tags,
      isPinned: row.isPinned,
      readingPosition: row.readingPosition,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      isDeleted: row.isDeleted,
      deletedAt: row.deletedAt,
      syncStatus: row.syncStatus,
      lastSyncedAt: row.lastSyncedAt,
      remoteId: row.remoteId,
      version: row.version,
      isDirty: row.isDirty,
      nodeId: row.nodeId,
    );
  }

  DownloadModel _mapDownloadRowToModel(Download row) {
    return DownloadModel(
      id: row.id,
      resourceId: row.resourceId,
      resourceType: row.resourceType,
      title: row.title,
      filePath: row.filePath,
      fileSizeBytes: row.fileSizeBytes,
      bytesDownloaded: row.bytesDownloaded,
      downloadStatus: row.downloadStatus,
      downloadSpeedBps: row.downloadSpeedBps,
      progress: row.progress,
      errorMessage: row.errorMessage,
      cid: row.cid,
      peerCount: row.peerCount,
      completedAt: row.completedAt,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      isDeleted: row.isDeleted,
      deletedAt: row.deletedAt,
      syncStatus: row.syncStatus,
      lastSyncedAt: row.lastSyncedAt,
      remoteId: row.remoteId,
      version: row.version,
      isDirty: row.isDirty,
      nodeId: row.nodeId,
    );
  }

  FavoriteModel _mapFavoriteRowToModel(Favorite row) {
    List<String> authors = <String>[];
    try {
      final dynamic decoded = jsonDecode(row.authorsJson);
      if (decoded is List) {
        authors = decoded.map((dynamic e) => e.toString()).toList();
      }
    } catch (_) {}

    return FavoriteModel(
      id: row.id,
      resourceId: row.resourceId,
      resourceType: row.resourceType,
      title: row.title,
      authors: authors,
      coverPath: row.coverPath,
      categoryId: row.categoryId,
      addedAt: row.addedAt,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      isDeleted: row.isDeleted,
      deletedAt: row.deletedAt,
      syncStatus: row.syncStatus,
      lastSyncedAt: row.lastSyncedAt,
      remoteId: row.remoteId,
      version: row.version,
      isDirty: row.isDirty,
      nodeId: row.nodeId,
    );
  }

  ReadingProgressModel _mapProgressRowToModel(ReadingProgressData row) {
    return ReadingProgressModel(
      id: row.id,
      resourceId: row.resourceId,
      resourceType: row.resourceType,
      title: row.title,
      currentPage: row.currentPage,
      totalPages: row.totalPages,
      progress: row.progress,
      lastReadPosition: row.lastReadPosition,
      timeSpentSeconds: row.timeSpentSeconds,
      lastReadAt: row.lastReadAt,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      isDeleted: row.isDeleted,
      deletedAt: row.deletedAt,
      syncStatus: row.syncStatus,
      lastSyncedAt: row.lastSyncedAt,
      remoteId: row.remoteId,
      version: row.version,
      isDirty: row.isDirty,
      nodeId: row.nodeId,
    );
  }

  CategoryModel _mapCategoryRowToModel(Category row) {
    return CategoryModel(
      id: row.id,
      slug: row.slug,
      name: row.name,
      description: row.description,
      iconName: row.iconName,
      accentColorHex: row.accentColorHex,
      parentCategoryId: row.parentCategoryId,
      itemCount: row.itemCount,
      displayOrder: row.displayOrder,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      isDeleted: row.isDeleted,
      deletedAt: row.deletedAt,
      syncStatus: row.syncStatus,
      lastSyncedAt: row.lastSyncedAt,
      remoteId: row.remoteId,
      version: row.version,
      isDirty: row.isDirty,
      nodeId: row.nodeId,
    );
  }

  AuthorModel _mapAuthorRowToModel(Author row) {
    return AuthorModel(
      id: row.id,
      name: row.name,
      orcid: row.orcid,
      institution: row.institution,
      bio: row.bio,
      avatarUrl: row.avatarUrl,
      publicationCount: row.publicationCount,
      hIndex: row.hIndex,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      isDeleted: row.isDeleted,
      deletedAt: row.deletedAt,
      syncStatus: row.syncStatus,
      lastSyncedAt: row.lastSyncedAt,
      remoteId: row.remoteId,
      version: row.version,
      isDirty: row.isDirty,
      nodeId: row.nodeId,
    );
  }

  SearchHistoryModel _mapHistoryRowToModel(SearchHistoryData row) {
    Map<String, dynamic> filters = <String, dynamic>{};
    try {
      final dynamic decoded = jsonDecode(row.filtersJson);
      if (decoded is Map<String, dynamic>) {
        filters = decoded;
      }
    } catch (_) {}

    return SearchHistoryModel(
      id: row.id,
      query: row.query,
      resultCount: row.resultCount,
      filters: filters,
      searchedAt: row.searchedAt,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      isDeleted: row.isDeleted,
      deletedAt: row.deletedAt,
      syncStatus: row.syncStatus,
      lastSyncedAt: row.lastSyncedAt,
      remoteId: row.remoteId,
      version: row.version,
      isDirty: row.isDirty,
      nodeId: row.nodeId,
    );
  }

  SettingsModel _mapSettingRowToModel(Setting row) {
    return SettingsModel(
      id: row.id,
      key: row.key,
      value: row.value,
      category: row.category,
      isEncrypted: row.isEncrypted,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      isDeleted: row.isDeleted,
      deletedAt: row.deletedAt,
      syncStatus: row.syncStatus,
      lastSyncedAt: row.lastSyncedAt,
      remoteId: row.remoteId,
      version: row.version,
      isDirty: row.isDirty,
      nodeId: row.nodeId,
    );
  }

  NetworkMetadataModel _mapNetworkRowToModel(NetworkMetadataData row) {
    return NetworkMetadataModel(
      id: row.id,
      swarmId: row.swarmId,
      peerCount: row.peerCount,
      averageLatencyMs: row.averageLatencyMs,
      downloadSpeedBps: row.downloadSpeedBps,
      uploadSpeedBps: row.uploadSpeedBps,
      dhtReputationScore: row.dhtReputationScore,
      totalBytesShared: row.totalBytesShared,
      totalBytesReceived: row.totalBytesReceived,
      lastHealthCheckAt: row.lastHealthCheckAt,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      isDeleted: row.isDeleted,
      deletedAt: row.deletedAt,
      syncStatus: row.syncStatus,
      lastSyncedAt: row.lastSyncedAt,
      remoteId: row.remoteId,
      version: row.version,
      isDirty: row.isDirty,
      nodeId: row.nodeId,
    );
  }

  // --------------------------------------------------------------------------
  // Advanced Search & Suggestions (via SearchDao)
  // --------------------------------------------------------------------------

  @override
  Future<List<SearchResultItem>> searchAdvanced(
    SearchFilter filter, {
    SearchSortOption sort = SearchSortOption.mostRelevant,
    int limit = 50,
    int offset = 0,
  }) {
    return _searchDao.search(filter, sort: sort, limit: limit, offset: offset);
  }

  @override
  Future<List<String>> getSuggestions(String prefix, {int limit = 8}) {
    return _searchDao.getSuggestions(prefix, limit: limit);
  }

  @override
  Future<void> recordSearchQuery(String query, {int resultCount = 0, Map<String, dynamic> filters = const <String, dynamic>{}}) {
    return _searchDao.recordSearchHistory(query, resultCount: resultCount, filters: filters);
  }
}

