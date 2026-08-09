// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $BooksTable extends Books with TableInfo<$BooksTable, Book> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BooksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  static const VerificationMeta _lastSyncedAtMeta =
      const VerificationMeta('lastSyncedAt');
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
      'last_synced_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _isDirtyMeta =
      const VerificationMeta('isDirty');
  @override
  late final GeneratedColumn<bool> isDirty = GeneratedColumn<bool>(
      'is_dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_dirty" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _nodeIdMeta = const VerificationMeta('nodeId');
  @override
  late final GeneratedColumn<String> nodeId = GeneratedColumn<String>(
      'node_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 500),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _subtitleMeta =
      const VerificationMeta('subtitle');
  @override
  late final GeneratedColumn<String> subtitle = GeneratedColumn<String>(
      'subtitle', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _authorsJsonMeta =
      const VerificationMeta('authorsJson');
  @override
  late final GeneratedColumn<String> authorsJson = GeneratedColumn<String>(
      'authors_json', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _publisherMeta =
      const VerificationMeta('publisher');
  @override
  late final GeneratedColumn<String> publisher = GeneratedColumn<String>(
      'publisher', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _publicationYearMeta =
      const VerificationMeta('publicationYear');
  @override
  late final GeneratedColumn<int> publicationYear = GeneratedColumn<int>(
      'publication_year', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _isbnMeta = const VerificationMeta('isbn');
  @override
  late final GeneratedColumn<String> isbn = GeneratedColumn<String>(
      'isbn', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _doiMeta = const VerificationMeta('doi');
  @override
  late final GeneratedColumn<String> doi = GeneratedColumn<String>(
      'doi', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _languageMeta =
      const VerificationMeta('language');
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'language', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('en'));
  static const VerificationMeta _pageCountMeta =
      const VerificationMeta('pageCount');
  @override
  late final GeneratedColumn<int> pageCount = GeneratedColumn<int>(
      'page_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _formatMeta = const VerificationMeta('format');
  @override
  late final GeneratedColumn<String> format = GeneratedColumn<String>(
      'format', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pdf'));
  static const VerificationMeta _sizeBytesMeta =
      const VerificationMeta('sizeBytes');
  @override
  late final GeneratedColumn<int> sizeBytes = GeneratedColumn<int>(
      'size_bytes', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _coverPathMeta =
      const VerificationMeta('coverPath');
  @override
  late final GeneratedColumn<String> coverPath = GeneratedColumn<String>(
      'cover_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _cidMeta = const VerificationMeta('cid');
  @override
  late final GeneratedColumn<String> cid = GeneratedColumn<String>(
      'cid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _contentHashMeta =
      const VerificationMeta('contentHash');
  @override
  late final GeneratedColumn<String> contentHash = GeneratedColumn<String>(
      'content_hash', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _verificationTierMeta =
      const VerificationMeta('verificationTier');
  @override
  late final GeneratedColumn<String> verificationTier = GeneratedColumn<String>(
      'verification_tier', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('verified'));
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
      'category_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _metadataJsonMeta =
      const VerificationMeta('metadataJson');
  @override
  late final GeneratedColumn<String> metadataJson = GeneratedColumn<String>(
      'metadata_json', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('{}'));
  static const VerificationMeta _isDownloadedMeta =
      const VerificationMeta('isDownloaded');
  @override
  late final GeneratedColumn<bool> isDownloaded = GeneratedColumn<bool>(
      'is_downloaded', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_downloaded" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _peerSeedersMeta =
      const VerificationMeta('peerSeeders');
  @override
  late final GeneratedColumn<int> peerSeeders = GeneratedColumn<int>(
      'peer_seeders', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        isDeleted,
        deletedAt,
        syncStatus,
        lastSyncedAt,
        remoteId,
        version,
        isDirty,
        nodeId,
        title,
        subtitle,
        authorsJson,
        publisher,
        publicationYear,
        isbn,
        doi,
        language,
        pageCount,
        format,
        sizeBytes,
        coverPath,
        cid,
        contentHash,
        verificationTier,
        categoryId,
        metadataJson,
        isDownloaded,
        peerSeeders
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'books';
  @override
  VerificationContext validateIntegrity(Insertable<Book> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
          _lastSyncedAtMeta,
          lastSyncedAt.isAcceptableOrUnknown(
              data['last_synced_at']!, _lastSyncedAtMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('is_dirty')) {
      context.handle(_isDirtyMeta,
          isDirty.isAcceptableOrUnknown(data['is_dirty']!, _isDirtyMeta));
    }
    if (data.containsKey('node_id')) {
      context.handle(_nodeIdMeta,
          nodeId.isAcceptableOrUnknown(data['node_id']!, _nodeIdMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('subtitle')) {
      context.handle(_subtitleMeta,
          subtitle.isAcceptableOrUnknown(data['subtitle']!, _subtitleMeta));
    }
    if (data.containsKey('authors_json')) {
      context.handle(
          _authorsJsonMeta,
          authorsJson.isAcceptableOrUnknown(
              data['authors_json']!, _authorsJsonMeta));
    }
    if (data.containsKey('publisher')) {
      context.handle(_publisherMeta,
          publisher.isAcceptableOrUnknown(data['publisher']!, _publisherMeta));
    }
    if (data.containsKey('publication_year')) {
      context.handle(
          _publicationYearMeta,
          publicationYear.isAcceptableOrUnknown(
              data['publication_year']!, _publicationYearMeta));
    }
    if (data.containsKey('isbn')) {
      context.handle(
          _isbnMeta, isbn.isAcceptableOrUnknown(data['isbn']!, _isbnMeta));
    }
    if (data.containsKey('doi')) {
      context.handle(
          _doiMeta, doi.isAcceptableOrUnknown(data['doi']!, _doiMeta));
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    }
    if (data.containsKey('page_count')) {
      context.handle(_pageCountMeta,
          pageCount.isAcceptableOrUnknown(data['page_count']!, _pageCountMeta));
    }
    if (data.containsKey('format')) {
      context.handle(_formatMeta,
          format.isAcceptableOrUnknown(data['format']!, _formatMeta));
    }
    if (data.containsKey('size_bytes')) {
      context.handle(_sizeBytesMeta,
          sizeBytes.isAcceptableOrUnknown(data['size_bytes']!, _sizeBytesMeta));
    }
    if (data.containsKey('cover_path')) {
      context.handle(_coverPathMeta,
          coverPath.isAcceptableOrUnknown(data['cover_path']!, _coverPathMeta));
    }
    if (data.containsKey('cid')) {
      context.handle(
          _cidMeta, cid.isAcceptableOrUnknown(data['cid']!, _cidMeta));
    }
    if (data.containsKey('content_hash')) {
      context.handle(
          _contentHashMeta,
          contentHash.isAcceptableOrUnknown(
              data['content_hash']!, _contentHashMeta));
    }
    if (data.containsKey('verification_tier')) {
      context.handle(
          _verificationTierMeta,
          verificationTier.isAcceptableOrUnknown(
              data['verification_tier']!, _verificationTierMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    }
    if (data.containsKey('metadata_json')) {
      context.handle(
          _metadataJsonMeta,
          metadataJson.isAcceptableOrUnknown(
              data['metadata_json']!, _metadataJsonMeta));
    }
    if (data.containsKey('is_downloaded')) {
      context.handle(
          _isDownloadedMeta,
          isDownloaded.isAcceptableOrUnknown(
              data['is_downloaded']!, _isDownloadedMeta));
    }
    if (data.containsKey('peer_seeders')) {
      context.handle(
          _peerSeedersMeta,
          peerSeeders.isAcceptableOrUnknown(
              data['peer_seeders']!, _peerSeedersMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Book map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Book(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_synced_at']),
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      isDirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_dirty'])!,
      nodeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}node_id']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      subtitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subtitle']),
      authorsJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}authors_json'])!,
      publisher: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}publisher']),
      publicationYear: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}publication_year']),
      isbn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}isbn']),
      doi: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}doi']),
      language: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language'])!,
      pageCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}page_count'])!,
      format: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}format'])!,
      sizeBytes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}size_bytes'])!,
      coverPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cover_path']),
      cid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cid']),
      contentHash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content_hash']),
      verificationTier: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}verification_tier'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_id']),
      metadataJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}metadata_json'])!,
      isDownloaded: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_downloaded'])!,
      peerSeeders: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}peer_seeders'])!,
    );
  }

  @override
  $BooksTable createAlias(String alias) {
    return $BooksTable(attachedDatabase, alias);
  }
}

class Book extends DataClass implements Insertable<Book> {
  /// Unique Primary Key identifier (UUID string or unique content hash).
  final String id;

  /// Creation timestamp.
  final DateTime createdAt;

  /// Last modification timestamp.
  final DateTime updatedAt;

  /// Soft delete flag to prevent permanent data loss and facilitate sync deletions.
  final bool isDeleted;

  /// Timestamp when the record was soft-deleted.
  final DateTime? deletedAt;

  /// Current synchronization status ('synced', 'pending', 'conflict', 'local_only').
  final String syncStatus;

  /// Timestamp when the record was last synchronized with a remote or peer node.
  final DateTime? lastSyncedAt;

  /// Remote or global canonical identifier (e.g., global URI or CID).
  final String? remoteId;

  /// Monotonic version counter for conflict resolution.
  final int version;

  /// Indicates if the record has local uncommitted changes waiting for sync.
  final bool isDirty;

  /// Peer or node ID that originally created or last modified this record.
  final String? nodeId;

  /// Book title.
  final String title;

  /// Subtitle or edition note.
  final String? subtitle;

  /// JSON-encoded array of author names.
  final String authorsJson;

  /// Publisher or academic press name.
  final String? publisher;

  /// Year of publication.
  final int? publicationYear;

  /// International Standard Book Number (ISBN-10 or ISBN-13).
  final String? isbn;

  /// Digital Object Identifier.
  final String? doi;

  /// Language code (e.g., 'en', 'es', 'de').
  final String language;

  /// Total page count.
  final int pageCount;

  /// File format ('pdf', 'epub', 'markdown', 'djvu').
  final String format;

  /// File size in bytes.
  final int sizeBytes;

  /// Local path or remote asset URI for cover art.
  final String? coverPath;

  /// InterPlanetary File System (IPFS) Content Identifier (CID v1).
  final String? cid;

  /// Cryptographic SHA-256 hash of the content payload.
  final String? contentHash;

  /// Verification tier ('verified', 'peerReviewed', 'community', 'unverified').
  final String verificationTier;

  /// Category slug or identifier linking to [Categories].
  final String? categoryId;

  /// Arbitrary JSON metadata for extensible academic indexing.
  final String metadataJson;

  /// Indicates if the full payload has been stored locally in the vault.
  final bool isDownloaded;

  /// Active peer seeders count observed in knowledge network.
  final int peerSeeders;
  const Book(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.isDeleted,
      this.deletedAt,
      required this.syncStatus,
      this.lastSyncedAt,
      this.remoteId,
      required this.version,
      required this.isDirty,
      this.nodeId,
      required this.title,
      this.subtitle,
      required this.authorsJson,
      this.publisher,
      this.publicationYear,
      this.isbn,
      this.doi,
      required this.language,
      required this.pageCount,
      required this.format,
      required this.sizeBytes,
      this.coverPath,
      this.cid,
      this.contentHash,
      required this.verificationTier,
      this.categoryId,
      required this.metadataJson,
      required this.isDownloaded,
      required this.peerSeeders});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || lastSyncedAt != null) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    }
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['version'] = Variable<int>(version);
    map['is_dirty'] = Variable<bool>(isDirty);
    if (!nullToAbsent || nodeId != null) {
      map['node_id'] = Variable<String>(nodeId);
    }
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || subtitle != null) {
      map['subtitle'] = Variable<String>(subtitle);
    }
    map['authors_json'] = Variable<String>(authorsJson);
    if (!nullToAbsent || publisher != null) {
      map['publisher'] = Variable<String>(publisher);
    }
    if (!nullToAbsent || publicationYear != null) {
      map['publication_year'] = Variable<int>(publicationYear);
    }
    if (!nullToAbsent || isbn != null) {
      map['isbn'] = Variable<String>(isbn);
    }
    if (!nullToAbsent || doi != null) {
      map['doi'] = Variable<String>(doi);
    }
    map['language'] = Variable<String>(language);
    map['page_count'] = Variable<int>(pageCount);
    map['format'] = Variable<String>(format);
    map['size_bytes'] = Variable<int>(sizeBytes);
    if (!nullToAbsent || coverPath != null) {
      map['cover_path'] = Variable<String>(coverPath);
    }
    if (!nullToAbsent || cid != null) {
      map['cid'] = Variable<String>(cid);
    }
    if (!nullToAbsent || contentHash != null) {
      map['content_hash'] = Variable<String>(contentHash);
    }
    map['verification_tier'] = Variable<String>(verificationTier);
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<String>(categoryId);
    }
    map['metadata_json'] = Variable<String>(metadataJson);
    map['is_downloaded'] = Variable<bool>(isDownloaded);
    map['peer_seeders'] = Variable<int>(peerSeeders);
    return map;
  }

  BooksCompanion toCompanion(bool nullToAbsent) {
    return BooksCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      lastSyncedAt: lastSyncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncedAt),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      version: Value(version),
      isDirty: Value(isDirty),
      nodeId:
          nodeId == null && nullToAbsent ? const Value.absent() : Value(nodeId),
      title: Value(title),
      subtitle: subtitle == null && nullToAbsent
          ? const Value.absent()
          : Value(subtitle),
      authorsJson: Value(authorsJson),
      publisher: publisher == null && nullToAbsent
          ? const Value.absent()
          : Value(publisher),
      publicationYear: publicationYear == null && nullToAbsent
          ? const Value.absent()
          : Value(publicationYear),
      isbn: isbn == null && nullToAbsent ? const Value.absent() : Value(isbn),
      doi: doi == null && nullToAbsent ? const Value.absent() : Value(doi),
      language: Value(language),
      pageCount: Value(pageCount),
      format: Value(format),
      sizeBytes: Value(sizeBytes),
      coverPath: coverPath == null && nullToAbsent
          ? const Value.absent()
          : Value(coverPath),
      cid: cid == null && nullToAbsent ? const Value.absent() : Value(cid),
      contentHash: contentHash == null && nullToAbsent
          ? const Value.absent()
          : Value(contentHash),
      verificationTier: Value(verificationTier),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      metadataJson: Value(metadataJson),
      isDownloaded: Value(isDownloaded),
      peerSeeders: Value(peerSeeders),
    );
  }

  factory Book.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Book(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      lastSyncedAt: serializer.fromJson<DateTime?>(json['lastSyncedAt']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      version: serializer.fromJson<int>(json['version']),
      isDirty: serializer.fromJson<bool>(json['isDirty']),
      nodeId: serializer.fromJson<String?>(json['nodeId']),
      title: serializer.fromJson<String>(json['title']),
      subtitle: serializer.fromJson<String?>(json['subtitle']),
      authorsJson: serializer.fromJson<String>(json['authorsJson']),
      publisher: serializer.fromJson<String?>(json['publisher']),
      publicationYear: serializer.fromJson<int?>(json['publicationYear']),
      isbn: serializer.fromJson<String?>(json['isbn']),
      doi: serializer.fromJson<String?>(json['doi']),
      language: serializer.fromJson<String>(json['language']),
      pageCount: serializer.fromJson<int>(json['pageCount']),
      format: serializer.fromJson<String>(json['format']),
      sizeBytes: serializer.fromJson<int>(json['sizeBytes']),
      coverPath: serializer.fromJson<String?>(json['coverPath']),
      cid: serializer.fromJson<String?>(json['cid']),
      contentHash: serializer.fromJson<String?>(json['contentHash']),
      verificationTier: serializer.fromJson<String>(json['verificationTier']),
      categoryId: serializer.fromJson<String?>(json['categoryId']),
      metadataJson: serializer.fromJson<String>(json['metadataJson']),
      isDownloaded: serializer.fromJson<bool>(json['isDownloaded']),
      peerSeeders: serializer.fromJson<int>(json['peerSeeders']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'lastSyncedAt': serializer.toJson<DateTime?>(lastSyncedAt),
      'remoteId': serializer.toJson<String?>(remoteId),
      'version': serializer.toJson<int>(version),
      'isDirty': serializer.toJson<bool>(isDirty),
      'nodeId': serializer.toJson<String?>(nodeId),
      'title': serializer.toJson<String>(title),
      'subtitle': serializer.toJson<String?>(subtitle),
      'authorsJson': serializer.toJson<String>(authorsJson),
      'publisher': serializer.toJson<String?>(publisher),
      'publicationYear': serializer.toJson<int?>(publicationYear),
      'isbn': serializer.toJson<String?>(isbn),
      'doi': serializer.toJson<String?>(doi),
      'language': serializer.toJson<String>(language),
      'pageCount': serializer.toJson<int>(pageCount),
      'format': serializer.toJson<String>(format),
      'sizeBytes': serializer.toJson<int>(sizeBytes),
      'coverPath': serializer.toJson<String?>(coverPath),
      'cid': serializer.toJson<String?>(cid),
      'contentHash': serializer.toJson<String?>(contentHash),
      'verificationTier': serializer.toJson<String>(verificationTier),
      'categoryId': serializer.toJson<String?>(categoryId),
      'metadataJson': serializer.toJson<String>(metadataJson),
      'isDownloaded': serializer.toJson<bool>(isDownloaded),
      'peerSeeders': serializer.toJson<int>(peerSeeders),
    };
  }

  Book copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? isDeleted,
          Value<DateTime?> deletedAt = const Value.absent(),
          String? syncStatus,
          Value<DateTime?> lastSyncedAt = const Value.absent(),
          Value<String?> remoteId = const Value.absent(),
          int? version,
          bool? isDirty,
          Value<String?> nodeId = const Value.absent(),
          String? title,
          Value<String?> subtitle = const Value.absent(),
          String? authorsJson,
          Value<String?> publisher = const Value.absent(),
          Value<int?> publicationYear = const Value.absent(),
          Value<String?> isbn = const Value.absent(),
          Value<String?> doi = const Value.absent(),
          String? language,
          int? pageCount,
          String? format,
          int? sizeBytes,
          Value<String?> coverPath = const Value.absent(),
          Value<String?> cid = const Value.absent(),
          Value<String?> contentHash = const Value.absent(),
          String? verificationTier,
          Value<String?> categoryId = const Value.absent(),
          String? metadataJson,
          bool? isDownloaded,
          int? peerSeeders}) =>
      Book(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isDeleted: isDeleted ?? this.isDeleted,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        syncStatus: syncStatus ?? this.syncStatus,
        lastSyncedAt:
            lastSyncedAt.present ? lastSyncedAt.value : this.lastSyncedAt,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        version: version ?? this.version,
        isDirty: isDirty ?? this.isDirty,
        nodeId: nodeId.present ? nodeId.value : this.nodeId,
        title: title ?? this.title,
        subtitle: subtitle.present ? subtitle.value : this.subtitle,
        authorsJson: authorsJson ?? this.authorsJson,
        publisher: publisher.present ? publisher.value : this.publisher,
        publicationYear: publicationYear.present
            ? publicationYear.value
            : this.publicationYear,
        isbn: isbn.present ? isbn.value : this.isbn,
        doi: doi.present ? doi.value : this.doi,
        language: language ?? this.language,
        pageCount: pageCount ?? this.pageCount,
        format: format ?? this.format,
        sizeBytes: sizeBytes ?? this.sizeBytes,
        coverPath: coverPath.present ? coverPath.value : this.coverPath,
        cid: cid.present ? cid.value : this.cid,
        contentHash: contentHash.present ? contentHash.value : this.contentHash,
        verificationTier: verificationTier ?? this.verificationTier,
        categoryId: categoryId.present ? categoryId.value : this.categoryId,
        metadataJson: metadataJson ?? this.metadataJson,
        isDownloaded: isDownloaded ?? this.isDownloaded,
        peerSeeders: peerSeeders ?? this.peerSeeders,
      );
  Book copyWithCompanion(BooksCompanion data) {
    return Book(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      version: data.version.present ? data.version.value : this.version,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      nodeId: data.nodeId.present ? data.nodeId.value : this.nodeId,
      title: data.title.present ? data.title.value : this.title,
      subtitle: data.subtitle.present ? data.subtitle.value : this.subtitle,
      authorsJson:
          data.authorsJson.present ? data.authorsJson.value : this.authorsJson,
      publisher: data.publisher.present ? data.publisher.value : this.publisher,
      publicationYear: data.publicationYear.present
          ? data.publicationYear.value
          : this.publicationYear,
      isbn: data.isbn.present ? data.isbn.value : this.isbn,
      doi: data.doi.present ? data.doi.value : this.doi,
      language: data.language.present ? data.language.value : this.language,
      pageCount: data.pageCount.present ? data.pageCount.value : this.pageCount,
      format: data.format.present ? data.format.value : this.format,
      sizeBytes: data.sizeBytes.present ? data.sizeBytes.value : this.sizeBytes,
      coverPath: data.coverPath.present ? data.coverPath.value : this.coverPath,
      cid: data.cid.present ? data.cid.value : this.cid,
      contentHash:
          data.contentHash.present ? data.contentHash.value : this.contentHash,
      verificationTier: data.verificationTier.present
          ? data.verificationTier.value
          : this.verificationTier,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      metadataJson: data.metadataJson.present
          ? data.metadataJson.value
          : this.metadataJson,
      isDownloaded: data.isDownloaded.present
          ? data.isDownloaded.value
          : this.isDownloaded,
      peerSeeders:
          data.peerSeeders.present ? data.peerSeeders.value : this.peerSeeders,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Book(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('version: $version, ')
          ..write('isDirty: $isDirty, ')
          ..write('nodeId: $nodeId, ')
          ..write('title: $title, ')
          ..write('subtitle: $subtitle, ')
          ..write('authorsJson: $authorsJson, ')
          ..write('publisher: $publisher, ')
          ..write('publicationYear: $publicationYear, ')
          ..write('isbn: $isbn, ')
          ..write('doi: $doi, ')
          ..write('language: $language, ')
          ..write('pageCount: $pageCount, ')
          ..write('format: $format, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('coverPath: $coverPath, ')
          ..write('cid: $cid, ')
          ..write('contentHash: $contentHash, ')
          ..write('verificationTier: $verificationTier, ')
          ..write('categoryId: $categoryId, ')
          ..write('metadataJson: $metadataJson, ')
          ..write('isDownloaded: $isDownloaded, ')
          ..write('peerSeeders: $peerSeeders')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        createdAt,
        updatedAt,
        isDeleted,
        deletedAt,
        syncStatus,
        lastSyncedAt,
        remoteId,
        version,
        isDirty,
        nodeId,
        title,
        subtitle,
        authorsJson,
        publisher,
        publicationYear,
        isbn,
        doi,
        language,
        pageCount,
        format,
        sizeBytes,
        coverPath,
        cid,
        contentHash,
        verificationTier,
        categoryId,
        metadataJson,
        isDownloaded,
        peerSeeders
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Book &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.lastSyncedAt == this.lastSyncedAt &&
          other.remoteId == this.remoteId &&
          other.version == this.version &&
          other.isDirty == this.isDirty &&
          other.nodeId == this.nodeId &&
          other.title == this.title &&
          other.subtitle == this.subtitle &&
          other.authorsJson == this.authorsJson &&
          other.publisher == this.publisher &&
          other.publicationYear == this.publicationYear &&
          other.isbn == this.isbn &&
          other.doi == this.doi &&
          other.language == this.language &&
          other.pageCount == this.pageCount &&
          other.format == this.format &&
          other.sizeBytes == this.sizeBytes &&
          other.coverPath == this.coverPath &&
          other.cid == this.cid &&
          other.contentHash == this.contentHash &&
          other.verificationTier == this.verificationTier &&
          other.categoryId == this.categoryId &&
          other.metadataJson == this.metadataJson &&
          other.isDownloaded == this.isDownloaded &&
          other.peerSeeders == this.peerSeeders);
}

class BooksCompanion extends UpdateCompanion<Book> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<DateTime?> lastSyncedAt;
  final Value<String?> remoteId;
  final Value<int> version;
  final Value<bool> isDirty;
  final Value<String?> nodeId;
  final Value<String> title;
  final Value<String?> subtitle;
  final Value<String> authorsJson;
  final Value<String?> publisher;
  final Value<int?> publicationYear;
  final Value<String?> isbn;
  final Value<String?> doi;
  final Value<String> language;
  final Value<int> pageCount;
  final Value<String> format;
  final Value<int> sizeBytes;
  final Value<String?> coverPath;
  final Value<String?> cid;
  final Value<String?> contentHash;
  final Value<String> verificationTier;
  final Value<String?> categoryId;
  final Value<String> metadataJson;
  final Value<bool> isDownloaded;
  final Value<int> peerSeeders;
  final Value<int> rowid;
  const BooksCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.version = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.nodeId = const Value.absent(),
    this.title = const Value.absent(),
    this.subtitle = const Value.absent(),
    this.authorsJson = const Value.absent(),
    this.publisher = const Value.absent(),
    this.publicationYear = const Value.absent(),
    this.isbn = const Value.absent(),
    this.doi = const Value.absent(),
    this.language = const Value.absent(),
    this.pageCount = const Value.absent(),
    this.format = const Value.absent(),
    this.sizeBytes = const Value.absent(),
    this.coverPath = const Value.absent(),
    this.cid = const Value.absent(),
    this.contentHash = const Value.absent(),
    this.verificationTier = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.metadataJson = const Value.absent(),
    this.isDownloaded = const Value.absent(),
    this.peerSeeders = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BooksCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.version = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.nodeId = const Value.absent(),
    required String title,
    this.subtitle = const Value.absent(),
    this.authorsJson = const Value.absent(),
    this.publisher = const Value.absent(),
    this.publicationYear = const Value.absent(),
    this.isbn = const Value.absent(),
    this.doi = const Value.absent(),
    this.language = const Value.absent(),
    this.pageCount = const Value.absent(),
    this.format = const Value.absent(),
    this.sizeBytes = const Value.absent(),
    this.coverPath = const Value.absent(),
    this.cid = const Value.absent(),
    this.contentHash = const Value.absent(),
    this.verificationTier = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.metadataJson = const Value.absent(),
    this.isDownloaded = const Value.absent(),
    this.peerSeeders = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title);
  static Insertable<Book> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<DateTime>? lastSyncedAt,
    Expression<String>? remoteId,
    Expression<int>? version,
    Expression<bool>? isDirty,
    Expression<String>? nodeId,
    Expression<String>? title,
    Expression<String>? subtitle,
    Expression<String>? authorsJson,
    Expression<String>? publisher,
    Expression<int>? publicationYear,
    Expression<String>? isbn,
    Expression<String>? doi,
    Expression<String>? language,
    Expression<int>? pageCount,
    Expression<String>? format,
    Expression<int>? sizeBytes,
    Expression<String>? coverPath,
    Expression<String>? cid,
    Expression<String>? contentHash,
    Expression<String>? verificationTier,
    Expression<String>? categoryId,
    Expression<String>? metadataJson,
    Expression<bool>? isDownloaded,
    Expression<int>? peerSeeders,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (remoteId != null) 'remote_id': remoteId,
      if (version != null) 'version': version,
      if (isDirty != null) 'is_dirty': isDirty,
      if (nodeId != null) 'node_id': nodeId,
      if (title != null) 'title': title,
      if (subtitle != null) 'subtitle': subtitle,
      if (authorsJson != null) 'authors_json': authorsJson,
      if (publisher != null) 'publisher': publisher,
      if (publicationYear != null) 'publication_year': publicationYear,
      if (isbn != null) 'isbn': isbn,
      if (doi != null) 'doi': doi,
      if (language != null) 'language': language,
      if (pageCount != null) 'page_count': pageCount,
      if (format != null) 'format': format,
      if (sizeBytes != null) 'size_bytes': sizeBytes,
      if (coverPath != null) 'cover_path': coverPath,
      if (cid != null) 'cid': cid,
      if (contentHash != null) 'content_hash': contentHash,
      if (verificationTier != null) 'verification_tier': verificationTier,
      if (categoryId != null) 'category_id': categoryId,
      if (metadataJson != null) 'metadata_json': metadataJson,
      if (isDownloaded != null) 'is_downloaded': isDownloaded,
      if (peerSeeders != null) 'peer_seeders': peerSeeders,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BooksCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? isDeleted,
      Value<DateTime?>? deletedAt,
      Value<String>? syncStatus,
      Value<DateTime?>? lastSyncedAt,
      Value<String?>? remoteId,
      Value<int>? version,
      Value<bool>? isDirty,
      Value<String?>? nodeId,
      Value<String>? title,
      Value<String?>? subtitle,
      Value<String>? authorsJson,
      Value<String?>? publisher,
      Value<int?>? publicationYear,
      Value<String?>? isbn,
      Value<String?>? doi,
      Value<String>? language,
      Value<int>? pageCount,
      Value<String>? format,
      Value<int>? sizeBytes,
      Value<String?>? coverPath,
      Value<String?>? cid,
      Value<String?>? contentHash,
      Value<String>? verificationTier,
      Value<String?>? categoryId,
      Value<String>? metadataJson,
      Value<bool>? isDownloaded,
      Value<int>? peerSeeders,
      Value<int>? rowid}) {
    return BooksCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      remoteId: remoteId ?? this.remoteId,
      version: version ?? this.version,
      isDirty: isDirty ?? this.isDirty,
      nodeId: nodeId ?? this.nodeId,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      authorsJson: authorsJson ?? this.authorsJson,
      publisher: publisher ?? this.publisher,
      publicationYear: publicationYear ?? this.publicationYear,
      isbn: isbn ?? this.isbn,
      doi: doi ?? this.doi,
      language: language ?? this.language,
      pageCount: pageCount ?? this.pageCount,
      format: format ?? this.format,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      coverPath: coverPath ?? this.coverPath,
      cid: cid ?? this.cid,
      contentHash: contentHash ?? this.contentHash,
      verificationTier: verificationTier ?? this.verificationTier,
      categoryId: categoryId ?? this.categoryId,
      metadataJson: metadataJson ?? this.metadataJson,
      isDownloaded: isDownloaded ?? this.isDownloaded,
      peerSeeders: peerSeeders ?? this.peerSeeders,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isDirty.present) {
      map['is_dirty'] = Variable<bool>(isDirty.value);
    }
    if (nodeId.present) {
      map['node_id'] = Variable<String>(nodeId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (subtitle.present) {
      map['subtitle'] = Variable<String>(subtitle.value);
    }
    if (authorsJson.present) {
      map['authors_json'] = Variable<String>(authorsJson.value);
    }
    if (publisher.present) {
      map['publisher'] = Variable<String>(publisher.value);
    }
    if (publicationYear.present) {
      map['publication_year'] = Variable<int>(publicationYear.value);
    }
    if (isbn.present) {
      map['isbn'] = Variable<String>(isbn.value);
    }
    if (doi.present) {
      map['doi'] = Variable<String>(doi.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (pageCount.present) {
      map['page_count'] = Variable<int>(pageCount.value);
    }
    if (format.present) {
      map['format'] = Variable<String>(format.value);
    }
    if (sizeBytes.present) {
      map['size_bytes'] = Variable<int>(sizeBytes.value);
    }
    if (coverPath.present) {
      map['cover_path'] = Variable<String>(coverPath.value);
    }
    if (cid.present) {
      map['cid'] = Variable<String>(cid.value);
    }
    if (contentHash.present) {
      map['content_hash'] = Variable<String>(contentHash.value);
    }
    if (verificationTier.present) {
      map['verification_tier'] = Variable<String>(verificationTier.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (metadataJson.present) {
      map['metadata_json'] = Variable<String>(metadataJson.value);
    }
    if (isDownloaded.present) {
      map['is_downloaded'] = Variable<bool>(isDownloaded.value);
    }
    if (peerSeeders.present) {
      map['peer_seeders'] = Variable<int>(peerSeeders.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BooksCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('version: $version, ')
          ..write('isDirty: $isDirty, ')
          ..write('nodeId: $nodeId, ')
          ..write('title: $title, ')
          ..write('subtitle: $subtitle, ')
          ..write('authorsJson: $authorsJson, ')
          ..write('publisher: $publisher, ')
          ..write('publicationYear: $publicationYear, ')
          ..write('isbn: $isbn, ')
          ..write('doi: $doi, ')
          ..write('language: $language, ')
          ..write('pageCount: $pageCount, ')
          ..write('format: $format, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('coverPath: $coverPath, ')
          ..write('cid: $cid, ')
          ..write('contentHash: $contentHash, ')
          ..write('verificationTier: $verificationTier, ')
          ..write('categoryId: $categoryId, ')
          ..write('metadataJson: $metadataJson, ')
          ..write('isDownloaded: $isDownloaded, ')
          ..write('peerSeeders: $peerSeeders, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NotesTable extends Notes with TableInfo<$NotesTable, Note> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  static const VerificationMeta _lastSyncedAtMeta =
      const VerificationMeta('lastSyncedAt');
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
      'last_synced_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _isDirtyMeta =
      const VerificationMeta('isDirty');
  @override
  late final GeneratedColumn<bool> isDirty = GeneratedColumn<bool>(
      'is_dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_dirty" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _nodeIdMeta = const VerificationMeta('nodeId');
  @override
  late final GeneratedColumn<String> nodeId = GeneratedColumn<String>(
      'node_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 250),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _resourceIdMeta =
      const VerificationMeta('resourceId');
  @override
  late final GeneratedColumn<String> resourceId = GeneratedColumn<String>(
      'resource_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _resourceTypeMeta =
      const VerificationMeta('resourceType');
  @override
  late final GeneratedColumn<String> resourceType = GeneratedColumn<String>(
      'resource_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('general'));
  static const VerificationMeta _colorHexMeta =
      const VerificationMeta('colorHex');
  @override
  late final GeneratedColumn<String> colorHex = GeneratedColumn<String>(
      'color_hex', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _tagsJsonMeta =
      const VerificationMeta('tagsJson');
  @override
  late final GeneratedColumn<String> tagsJson = GeneratedColumn<String>(
      'tags_json', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _isPinnedMeta =
      const VerificationMeta('isPinned');
  @override
  late final GeneratedColumn<bool> isPinned = GeneratedColumn<bool>(
      'is_pinned', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_pinned" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _readingPositionMeta =
      const VerificationMeta('readingPosition');
  @override
  late final GeneratedColumn<String> readingPosition = GeneratedColumn<String>(
      'reading_position', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        isDeleted,
        deletedAt,
        syncStatus,
        lastSyncedAt,
        remoteId,
        version,
        isDirty,
        nodeId,
        title,
        content,
        resourceId,
        resourceType,
        colorHex,
        tagsJson,
        isPinned,
        readingPosition
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notes';
  @override
  VerificationContext validateIntegrity(Insertable<Note> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
          _lastSyncedAtMeta,
          lastSyncedAt.isAcceptableOrUnknown(
              data['last_synced_at']!, _lastSyncedAtMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('is_dirty')) {
      context.handle(_isDirtyMeta,
          isDirty.isAcceptableOrUnknown(data['is_dirty']!, _isDirtyMeta));
    }
    if (data.containsKey('node_id')) {
      context.handle(_nodeIdMeta,
          nodeId.isAcceptableOrUnknown(data['node_id']!, _nodeIdMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('resource_id')) {
      context.handle(
          _resourceIdMeta,
          resourceId.isAcceptableOrUnknown(
              data['resource_id']!, _resourceIdMeta));
    }
    if (data.containsKey('resource_type')) {
      context.handle(
          _resourceTypeMeta,
          resourceType.isAcceptableOrUnknown(
              data['resource_type']!, _resourceTypeMeta));
    }
    if (data.containsKey('color_hex')) {
      context.handle(_colorHexMeta,
          colorHex.isAcceptableOrUnknown(data['color_hex']!, _colorHexMeta));
    }
    if (data.containsKey('tags_json')) {
      context.handle(_tagsJsonMeta,
          tagsJson.isAcceptableOrUnknown(data['tags_json']!, _tagsJsonMeta));
    }
    if (data.containsKey('is_pinned')) {
      context.handle(_isPinnedMeta,
          isPinned.isAcceptableOrUnknown(data['is_pinned']!, _isPinnedMeta));
    }
    if (data.containsKey('reading_position')) {
      context.handle(
          _readingPositionMeta,
          readingPosition.isAcceptableOrUnknown(
              data['reading_position']!, _readingPositionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Note map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Note(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_synced_at']),
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      isDirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_dirty'])!,
      nodeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}node_id']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      resourceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resource_id']),
      resourceType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resource_type'])!,
      colorHex: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color_hex']),
      tagsJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags_json'])!,
      isPinned: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_pinned'])!,
      readingPosition: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}reading_position']),
    );
  }

  @override
  $NotesTable createAlias(String alias) {
    return $NotesTable(attachedDatabase, alias);
  }
}

class Note extends DataClass implements Insertable<Note> {
  /// Unique Primary Key identifier (UUID string or unique content hash).
  final String id;

  /// Creation timestamp.
  final DateTime createdAt;

  /// Last modification timestamp.
  final DateTime updatedAt;

  /// Soft delete flag to prevent permanent data loss and facilitate sync deletions.
  final bool isDeleted;

  /// Timestamp when the record was soft-deleted.
  final DateTime? deletedAt;

  /// Current synchronization status ('synced', 'pending', 'conflict', 'local_only').
  final String syncStatus;

  /// Timestamp when the record was last synchronized with a remote or peer node.
  final DateTime? lastSyncedAt;

  /// Remote or global canonical identifier (e.g., global URI or CID).
  final String? remoteId;

  /// Monotonic version counter for conflict resolution.
  final int version;

  /// Indicates if the record has local uncommitted changes waiting for sync.
  final bool isDirty;

  /// Peer or node ID that originally created or last modified this record.
  final String? nodeId;

  /// Note title.
  final String title;

  /// Markdown-formatted body content.
  final String content;

  /// Optional parent academic resource identifier (Book, Paper, etc.).
  final String? resourceId;

  /// Type of the associated resource ('book', 'paper', 'dataset', 'general').
  final String resourceType;

  /// Accent color hex for UI badges and card tints (e.g. '#63F2E8').
  final String? colorHex;

  /// JSON array of string tags (e.g. `["zk-proofs", "cryptography"]`).
  final String tagsJson;

  /// Whether the note is pinned to top of the notes view.
  final bool isPinned;

  /// Reading position anchor or page number where annotation was created.
  final String? readingPosition;
  const Note(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.isDeleted,
      this.deletedAt,
      required this.syncStatus,
      this.lastSyncedAt,
      this.remoteId,
      required this.version,
      required this.isDirty,
      this.nodeId,
      required this.title,
      required this.content,
      this.resourceId,
      required this.resourceType,
      this.colorHex,
      required this.tagsJson,
      required this.isPinned,
      this.readingPosition});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || lastSyncedAt != null) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    }
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['version'] = Variable<int>(version);
    map['is_dirty'] = Variable<bool>(isDirty);
    if (!nullToAbsent || nodeId != null) {
      map['node_id'] = Variable<String>(nodeId);
    }
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    if (!nullToAbsent || resourceId != null) {
      map['resource_id'] = Variable<String>(resourceId);
    }
    map['resource_type'] = Variable<String>(resourceType);
    if (!nullToAbsent || colorHex != null) {
      map['color_hex'] = Variable<String>(colorHex);
    }
    map['tags_json'] = Variable<String>(tagsJson);
    map['is_pinned'] = Variable<bool>(isPinned);
    if (!nullToAbsent || readingPosition != null) {
      map['reading_position'] = Variable<String>(readingPosition);
    }
    return map;
  }

  NotesCompanion toCompanion(bool nullToAbsent) {
    return NotesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      lastSyncedAt: lastSyncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncedAt),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      version: Value(version),
      isDirty: Value(isDirty),
      nodeId:
          nodeId == null && nullToAbsent ? const Value.absent() : Value(nodeId),
      title: Value(title),
      content: Value(content),
      resourceId: resourceId == null && nullToAbsent
          ? const Value.absent()
          : Value(resourceId),
      resourceType: Value(resourceType),
      colorHex: colorHex == null && nullToAbsent
          ? const Value.absent()
          : Value(colorHex),
      tagsJson: Value(tagsJson),
      isPinned: Value(isPinned),
      readingPosition: readingPosition == null && nullToAbsent
          ? const Value.absent()
          : Value(readingPosition),
    );
  }

  factory Note.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Note(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      lastSyncedAt: serializer.fromJson<DateTime?>(json['lastSyncedAt']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      version: serializer.fromJson<int>(json['version']),
      isDirty: serializer.fromJson<bool>(json['isDirty']),
      nodeId: serializer.fromJson<String?>(json['nodeId']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      resourceId: serializer.fromJson<String?>(json['resourceId']),
      resourceType: serializer.fromJson<String>(json['resourceType']),
      colorHex: serializer.fromJson<String?>(json['colorHex']),
      tagsJson: serializer.fromJson<String>(json['tagsJson']),
      isPinned: serializer.fromJson<bool>(json['isPinned']),
      readingPosition: serializer.fromJson<String?>(json['readingPosition']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'lastSyncedAt': serializer.toJson<DateTime?>(lastSyncedAt),
      'remoteId': serializer.toJson<String?>(remoteId),
      'version': serializer.toJson<int>(version),
      'isDirty': serializer.toJson<bool>(isDirty),
      'nodeId': serializer.toJson<String?>(nodeId),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'resourceId': serializer.toJson<String?>(resourceId),
      'resourceType': serializer.toJson<String>(resourceType),
      'colorHex': serializer.toJson<String?>(colorHex),
      'tagsJson': serializer.toJson<String>(tagsJson),
      'isPinned': serializer.toJson<bool>(isPinned),
      'readingPosition': serializer.toJson<String?>(readingPosition),
    };
  }

  Note copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? isDeleted,
          Value<DateTime?> deletedAt = const Value.absent(),
          String? syncStatus,
          Value<DateTime?> lastSyncedAt = const Value.absent(),
          Value<String?> remoteId = const Value.absent(),
          int? version,
          bool? isDirty,
          Value<String?> nodeId = const Value.absent(),
          String? title,
          String? content,
          Value<String?> resourceId = const Value.absent(),
          String? resourceType,
          Value<String?> colorHex = const Value.absent(),
          String? tagsJson,
          bool? isPinned,
          Value<String?> readingPosition = const Value.absent()}) =>
      Note(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isDeleted: isDeleted ?? this.isDeleted,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        syncStatus: syncStatus ?? this.syncStatus,
        lastSyncedAt:
            lastSyncedAt.present ? lastSyncedAt.value : this.lastSyncedAt,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        version: version ?? this.version,
        isDirty: isDirty ?? this.isDirty,
        nodeId: nodeId.present ? nodeId.value : this.nodeId,
        title: title ?? this.title,
        content: content ?? this.content,
        resourceId: resourceId.present ? resourceId.value : this.resourceId,
        resourceType: resourceType ?? this.resourceType,
        colorHex: colorHex.present ? colorHex.value : this.colorHex,
        tagsJson: tagsJson ?? this.tagsJson,
        isPinned: isPinned ?? this.isPinned,
        readingPosition: readingPosition.present
            ? readingPosition.value
            : this.readingPosition,
      );
  Note copyWithCompanion(NotesCompanion data) {
    return Note(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      version: data.version.present ? data.version.value : this.version,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      nodeId: data.nodeId.present ? data.nodeId.value : this.nodeId,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      resourceId:
          data.resourceId.present ? data.resourceId.value : this.resourceId,
      resourceType: data.resourceType.present
          ? data.resourceType.value
          : this.resourceType,
      colorHex: data.colorHex.present ? data.colorHex.value : this.colorHex,
      tagsJson: data.tagsJson.present ? data.tagsJson.value : this.tagsJson,
      isPinned: data.isPinned.present ? data.isPinned.value : this.isPinned,
      readingPosition: data.readingPosition.present
          ? data.readingPosition.value
          : this.readingPosition,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Note(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('version: $version, ')
          ..write('isDirty: $isDirty, ')
          ..write('nodeId: $nodeId, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('resourceId: $resourceId, ')
          ..write('resourceType: $resourceType, ')
          ..write('colorHex: $colorHex, ')
          ..write('tagsJson: $tagsJson, ')
          ..write('isPinned: $isPinned, ')
          ..write('readingPosition: $readingPosition')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      createdAt,
      updatedAt,
      isDeleted,
      deletedAt,
      syncStatus,
      lastSyncedAt,
      remoteId,
      version,
      isDirty,
      nodeId,
      title,
      content,
      resourceId,
      resourceType,
      colorHex,
      tagsJson,
      isPinned,
      readingPosition);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Note &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.lastSyncedAt == this.lastSyncedAt &&
          other.remoteId == this.remoteId &&
          other.version == this.version &&
          other.isDirty == this.isDirty &&
          other.nodeId == this.nodeId &&
          other.title == this.title &&
          other.content == this.content &&
          other.resourceId == this.resourceId &&
          other.resourceType == this.resourceType &&
          other.colorHex == this.colorHex &&
          other.tagsJson == this.tagsJson &&
          other.isPinned == this.isPinned &&
          other.readingPosition == this.readingPosition);
}

class NotesCompanion extends UpdateCompanion<Note> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<DateTime?> lastSyncedAt;
  final Value<String?> remoteId;
  final Value<int> version;
  final Value<bool> isDirty;
  final Value<String?> nodeId;
  final Value<String> title;
  final Value<String> content;
  final Value<String?> resourceId;
  final Value<String> resourceType;
  final Value<String?> colorHex;
  final Value<String> tagsJson;
  final Value<bool> isPinned;
  final Value<String?> readingPosition;
  final Value<int> rowid;
  const NotesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.version = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.nodeId = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.resourceId = const Value.absent(),
    this.resourceType = const Value.absent(),
    this.colorHex = const Value.absent(),
    this.tagsJson = const Value.absent(),
    this.isPinned = const Value.absent(),
    this.readingPosition = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NotesCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.version = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.nodeId = const Value.absent(),
    required String title,
    required String content,
    this.resourceId = const Value.absent(),
    this.resourceType = const Value.absent(),
    this.colorHex = const Value.absent(),
    this.tagsJson = const Value.absent(),
    this.isPinned = const Value.absent(),
    this.readingPosition = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        content = Value(content);
  static Insertable<Note> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<DateTime>? lastSyncedAt,
    Expression<String>? remoteId,
    Expression<int>? version,
    Expression<bool>? isDirty,
    Expression<String>? nodeId,
    Expression<String>? title,
    Expression<String>? content,
    Expression<String>? resourceId,
    Expression<String>? resourceType,
    Expression<String>? colorHex,
    Expression<String>? tagsJson,
    Expression<bool>? isPinned,
    Expression<String>? readingPosition,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (remoteId != null) 'remote_id': remoteId,
      if (version != null) 'version': version,
      if (isDirty != null) 'is_dirty': isDirty,
      if (nodeId != null) 'node_id': nodeId,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (resourceId != null) 'resource_id': resourceId,
      if (resourceType != null) 'resource_type': resourceType,
      if (colorHex != null) 'color_hex': colorHex,
      if (tagsJson != null) 'tags_json': tagsJson,
      if (isPinned != null) 'is_pinned': isPinned,
      if (readingPosition != null) 'reading_position': readingPosition,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NotesCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? isDeleted,
      Value<DateTime?>? deletedAt,
      Value<String>? syncStatus,
      Value<DateTime?>? lastSyncedAt,
      Value<String?>? remoteId,
      Value<int>? version,
      Value<bool>? isDirty,
      Value<String?>? nodeId,
      Value<String>? title,
      Value<String>? content,
      Value<String?>? resourceId,
      Value<String>? resourceType,
      Value<String?>? colorHex,
      Value<String>? tagsJson,
      Value<bool>? isPinned,
      Value<String?>? readingPosition,
      Value<int>? rowid}) {
    return NotesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      remoteId: remoteId ?? this.remoteId,
      version: version ?? this.version,
      isDirty: isDirty ?? this.isDirty,
      nodeId: nodeId ?? this.nodeId,
      title: title ?? this.title,
      content: content ?? this.content,
      resourceId: resourceId ?? this.resourceId,
      resourceType: resourceType ?? this.resourceType,
      colorHex: colorHex ?? this.colorHex,
      tagsJson: tagsJson ?? this.tagsJson,
      isPinned: isPinned ?? this.isPinned,
      readingPosition: readingPosition ?? this.readingPosition,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isDirty.present) {
      map['is_dirty'] = Variable<bool>(isDirty.value);
    }
    if (nodeId.present) {
      map['node_id'] = Variable<String>(nodeId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (resourceId.present) {
      map['resource_id'] = Variable<String>(resourceId.value);
    }
    if (resourceType.present) {
      map['resource_type'] = Variable<String>(resourceType.value);
    }
    if (colorHex.present) {
      map['color_hex'] = Variable<String>(colorHex.value);
    }
    if (tagsJson.present) {
      map['tags_json'] = Variable<String>(tagsJson.value);
    }
    if (isPinned.present) {
      map['is_pinned'] = Variable<bool>(isPinned.value);
    }
    if (readingPosition.present) {
      map['reading_position'] = Variable<String>(readingPosition.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('version: $version, ')
          ..write('isDirty: $isDirty, ')
          ..write('nodeId: $nodeId, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('resourceId: $resourceId, ')
          ..write('resourceType: $resourceType, ')
          ..write('colorHex: $colorHex, ')
          ..write('tagsJson: $tagsJson, ')
          ..write('isPinned: $isPinned, ')
          ..write('readingPosition: $readingPosition, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ResearchPapersTable extends ResearchPapers
    with TableInfo<$ResearchPapersTable, ResearchPaper> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ResearchPapersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  static const VerificationMeta _lastSyncedAtMeta =
      const VerificationMeta('lastSyncedAt');
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
      'last_synced_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _isDirtyMeta =
      const VerificationMeta('isDirty');
  @override
  late final GeneratedColumn<bool> isDirty = GeneratedColumn<bool>(
      'is_dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_dirty" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _nodeIdMeta = const VerificationMeta('nodeId');
  @override
  late final GeneratedColumn<String> nodeId = GeneratedColumn<String>(
      'node_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 600),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _abstractTextMeta =
      const VerificationMeta('abstractText');
  @override
  late final GeneratedColumn<String> abstractText = GeneratedColumn<String>(
      'abstract_text', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _authorsJsonMeta =
      const VerificationMeta('authorsJson');
  @override
  late final GeneratedColumn<String> authorsJson = GeneratedColumn<String>(
      'authors_json', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _journalMeta =
      const VerificationMeta('journal');
  @override
  late final GeneratedColumn<String> journal = GeneratedColumn<String>(
      'journal', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _conferenceMeta =
      const VerificationMeta('conference');
  @override
  late final GeneratedColumn<String> conference = GeneratedColumn<String>(
      'conference', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _volumeMeta = const VerificationMeta('volume');
  @override
  late final GeneratedColumn<String> volume = GeneratedColumn<String>(
      'volume', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _issueMeta = const VerificationMeta('issue');
  @override
  late final GeneratedColumn<String> issue = GeneratedColumn<String>(
      'issue', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _pagesMeta = const VerificationMeta('pages');
  @override
  late final GeneratedColumn<String> pages = GeneratedColumn<String>(
      'pages', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _doiMeta = const VerificationMeta('doi');
  @override
  late final GeneratedColumn<String> doi = GeneratedColumn<String>(
      'doi', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _arxivIdMeta =
      const VerificationMeta('arxivId');
  @override
  late final GeneratedColumn<String> arxivId = GeneratedColumn<String>(
      'arxiv_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _pubmedIdMeta =
      const VerificationMeta('pubmedId');
  @override
  late final GeneratedColumn<String> pubmedId = GeneratedColumn<String>(
      'pubmed_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _publicationYearMeta =
      const VerificationMeta('publicationYear');
  @override
  late final GeneratedColumn<int> publicationYear = GeneratedColumn<int>(
      'publication_year', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _isPeerReviewedMeta =
      const VerificationMeta('isPeerReviewed');
  @override
  late final GeneratedColumn<bool> isPeerReviewed = GeneratedColumn<bool>(
      'is_peer_reviewed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_peer_reviewed" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _citationsCountMeta =
      const VerificationMeta('citationsCount');
  @override
  late final GeneratedColumn<int> citationsCount = GeneratedColumn<int>(
      'citations_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _cidMeta = const VerificationMeta('cid');
  @override
  late final GeneratedColumn<String> cid = GeneratedColumn<String>(
      'cid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _contentHashMeta =
      const VerificationMeta('contentHash');
  @override
  late final GeneratedColumn<String> contentHash = GeneratedColumn<String>(
      'content_hash', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sizeBytesMeta =
      const VerificationMeta('sizeBytes');
  @override
  late final GeneratedColumn<int> sizeBytes = GeneratedColumn<int>(
      'size_bytes', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _formatMeta = const VerificationMeta('format');
  @override
  late final GeneratedColumn<String> format = GeneratedColumn<String>(
      'format', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pdf'));
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
      'category_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _verificationTierMeta =
      const VerificationMeta('verificationTier');
  @override
  late final GeneratedColumn<String> verificationTier = GeneratedColumn<String>(
      'verification_tier', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('peerReviewed'));
  static const VerificationMeta _isDownloadedMeta =
      const VerificationMeta('isDownloaded');
  @override
  late final GeneratedColumn<bool> isDownloaded = GeneratedColumn<bool>(
      'is_downloaded', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_downloaded" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _peerSeedersMeta =
      const VerificationMeta('peerSeeders');
  @override
  late final GeneratedColumn<int> peerSeeders = GeneratedColumn<int>(
      'peer_seeders', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        isDeleted,
        deletedAt,
        syncStatus,
        lastSyncedAt,
        remoteId,
        version,
        isDirty,
        nodeId,
        title,
        abstractText,
        authorsJson,
        journal,
        conference,
        volume,
        issue,
        pages,
        doi,
        arxivId,
        pubmedId,
        publicationYear,
        isPeerReviewed,
        citationsCount,
        cid,
        contentHash,
        sizeBytes,
        format,
        categoryId,
        verificationTier,
        isDownloaded,
        peerSeeders
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'research_papers';
  @override
  VerificationContext validateIntegrity(Insertable<ResearchPaper> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
          _lastSyncedAtMeta,
          lastSyncedAt.isAcceptableOrUnknown(
              data['last_synced_at']!, _lastSyncedAtMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('is_dirty')) {
      context.handle(_isDirtyMeta,
          isDirty.isAcceptableOrUnknown(data['is_dirty']!, _isDirtyMeta));
    }
    if (data.containsKey('node_id')) {
      context.handle(_nodeIdMeta,
          nodeId.isAcceptableOrUnknown(data['node_id']!, _nodeIdMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('abstract_text')) {
      context.handle(
          _abstractTextMeta,
          abstractText.isAcceptableOrUnknown(
              data['abstract_text']!, _abstractTextMeta));
    }
    if (data.containsKey('authors_json')) {
      context.handle(
          _authorsJsonMeta,
          authorsJson.isAcceptableOrUnknown(
              data['authors_json']!, _authorsJsonMeta));
    }
    if (data.containsKey('journal')) {
      context.handle(_journalMeta,
          journal.isAcceptableOrUnknown(data['journal']!, _journalMeta));
    }
    if (data.containsKey('conference')) {
      context.handle(
          _conferenceMeta,
          conference.isAcceptableOrUnknown(
              data['conference']!, _conferenceMeta));
    }
    if (data.containsKey('volume')) {
      context.handle(_volumeMeta,
          volume.isAcceptableOrUnknown(data['volume']!, _volumeMeta));
    }
    if (data.containsKey('issue')) {
      context.handle(
          _issueMeta, issue.isAcceptableOrUnknown(data['issue']!, _issueMeta));
    }
    if (data.containsKey('pages')) {
      context.handle(
          _pagesMeta, pages.isAcceptableOrUnknown(data['pages']!, _pagesMeta));
    }
    if (data.containsKey('doi')) {
      context.handle(
          _doiMeta, doi.isAcceptableOrUnknown(data['doi']!, _doiMeta));
    }
    if (data.containsKey('arxiv_id')) {
      context.handle(_arxivIdMeta,
          arxivId.isAcceptableOrUnknown(data['arxiv_id']!, _arxivIdMeta));
    }
    if (data.containsKey('pubmed_id')) {
      context.handle(_pubmedIdMeta,
          pubmedId.isAcceptableOrUnknown(data['pubmed_id']!, _pubmedIdMeta));
    }
    if (data.containsKey('publication_year')) {
      context.handle(
          _publicationYearMeta,
          publicationYear.isAcceptableOrUnknown(
              data['publication_year']!, _publicationYearMeta));
    }
    if (data.containsKey('is_peer_reviewed')) {
      context.handle(
          _isPeerReviewedMeta,
          isPeerReviewed.isAcceptableOrUnknown(
              data['is_peer_reviewed']!, _isPeerReviewedMeta));
    }
    if (data.containsKey('citations_count')) {
      context.handle(
          _citationsCountMeta,
          citationsCount.isAcceptableOrUnknown(
              data['citations_count']!, _citationsCountMeta));
    }
    if (data.containsKey('cid')) {
      context.handle(
          _cidMeta, cid.isAcceptableOrUnknown(data['cid']!, _cidMeta));
    }
    if (data.containsKey('content_hash')) {
      context.handle(
          _contentHashMeta,
          contentHash.isAcceptableOrUnknown(
              data['content_hash']!, _contentHashMeta));
    }
    if (data.containsKey('size_bytes')) {
      context.handle(_sizeBytesMeta,
          sizeBytes.isAcceptableOrUnknown(data['size_bytes']!, _sizeBytesMeta));
    }
    if (data.containsKey('format')) {
      context.handle(_formatMeta,
          format.isAcceptableOrUnknown(data['format']!, _formatMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    }
    if (data.containsKey('verification_tier')) {
      context.handle(
          _verificationTierMeta,
          verificationTier.isAcceptableOrUnknown(
              data['verification_tier']!, _verificationTierMeta));
    }
    if (data.containsKey('is_downloaded')) {
      context.handle(
          _isDownloadedMeta,
          isDownloaded.isAcceptableOrUnknown(
              data['is_downloaded']!, _isDownloadedMeta));
    }
    if (data.containsKey('peer_seeders')) {
      context.handle(
          _peerSeedersMeta,
          peerSeeders.isAcceptableOrUnknown(
              data['peer_seeders']!, _peerSeedersMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ResearchPaper map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ResearchPaper(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_synced_at']),
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      isDirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_dirty'])!,
      nodeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}node_id']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      abstractText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}abstract_text'])!,
      authorsJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}authors_json'])!,
      journal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}journal']),
      conference: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}conference']),
      volume: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}volume']),
      issue: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}issue']),
      pages: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pages']),
      doi: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}doi']),
      arxivId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}arxiv_id']),
      pubmedId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pubmed_id']),
      publicationYear: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}publication_year']),
      isPeerReviewed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_peer_reviewed'])!,
      citationsCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}citations_count'])!,
      cid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cid']),
      contentHash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content_hash']),
      sizeBytes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}size_bytes'])!,
      format: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}format'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_id']),
      verificationTier: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}verification_tier'])!,
      isDownloaded: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_downloaded'])!,
      peerSeeders: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}peer_seeders'])!,
    );
  }

  @override
  $ResearchPapersTable createAlias(String alias) {
    return $ResearchPapersTable(attachedDatabase, alias);
  }
}

class ResearchPaper extends DataClass implements Insertable<ResearchPaper> {
  /// Unique Primary Key identifier (UUID string or unique content hash).
  final String id;

  /// Creation timestamp.
  final DateTime createdAt;

  /// Last modification timestamp.
  final DateTime updatedAt;

  /// Soft delete flag to prevent permanent data loss and facilitate sync deletions.
  final bool isDeleted;

  /// Timestamp when the record was soft-deleted.
  final DateTime? deletedAt;

  /// Current synchronization status ('synced', 'pending', 'conflict', 'local_only').
  final String syncStatus;

  /// Timestamp when the record was last synchronized with a remote or peer node.
  final DateTime? lastSyncedAt;

  /// Remote or global canonical identifier (e.g., global URI or CID).
  final String? remoteId;

  /// Monotonic version counter for conflict resolution.
  final int version;

  /// Indicates if the record has local uncommitted changes waiting for sync.
  final bool isDirty;

  /// Peer or node ID that originally created or last modified this record.
  final String? nodeId;

  /// Paper title.
  final String title;

  /// Formatted academic abstract.
  final String abstractText;

  /// JSON array of authors with affiliations.
  final String authorsJson;

  /// Publishing journal name.
  final String? journal;

  /// Conference name or proceedings banner.
  final String? conference;

  /// Volume number.
  final String? volume;

  /// Issue number.
  final String? issue;

  /// Pagination range (e.g., '142-168').
  final String? pages;

  /// Digital Object Identifier.
  final String? doi;

  /// arXiv preprint identifier.
  final String? arxivId;

  /// PubMed Accession ID (PMID).
  final String? pubmedId;

  /// Year of publication.
  final int? publicationYear;

  /// Flag indicating verified peer review status.
  final bool isPeerReviewed;

  /// Citations count.
  final int citationsCount;

  /// IPFS Content Identifier (CID v1).
  final String? cid;

  /// SHA-256 hash.
  final String? contentHash;

  /// File size in bytes.
  final int sizeBytes;

  /// File format ('pdf', 'latex', 'markdown').
  final String format;

  /// Category slug or identifier.
  final String? categoryId;

  /// Verification tier ('verified', 'peerReviewed', 'community', 'unverified').
  final String verificationTier;

  /// Indicates if stored in local vault.
  final bool isDownloaded;

  /// Active peer seeders count.
  final int peerSeeders;
  const ResearchPaper(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.isDeleted,
      this.deletedAt,
      required this.syncStatus,
      this.lastSyncedAt,
      this.remoteId,
      required this.version,
      required this.isDirty,
      this.nodeId,
      required this.title,
      required this.abstractText,
      required this.authorsJson,
      this.journal,
      this.conference,
      this.volume,
      this.issue,
      this.pages,
      this.doi,
      this.arxivId,
      this.pubmedId,
      this.publicationYear,
      required this.isPeerReviewed,
      required this.citationsCount,
      this.cid,
      this.contentHash,
      required this.sizeBytes,
      required this.format,
      this.categoryId,
      required this.verificationTier,
      required this.isDownloaded,
      required this.peerSeeders});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || lastSyncedAt != null) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    }
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['version'] = Variable<int>(version);
    map['is_dirty'] = Variable<bool>(isDirty);
    if (!nullToAbsent || nodeId != null) {
      map['node_id'] = Variable<String>(nodeId);
    }
    map['title'] = Variable<String>(title);
    map['abstract_text'] = Variable<String>(abstractText);
    map['authors_json'] = Variable<String>(authorsJson);
    if (!nullToAbsent || journal != null) {
      map['journal'] = Variable<String>(journal);
    }
    if (!nullToAbsent || conference != null) {
      map['conference'] = Variable<String>(conference);
    }
    if (!nullToAbsent || volume != null) {
      map['volume'] = Variable<String>(volume);
    }
    if (!nullToAbsent || issue != null) {
      map['issue'] = Variable<String>(issue);
    }
    if (!nullToAbsent || pages != null) {
      map['pages'] = Variable<String>(pages);
    }
    if (!nullToAbsent || doi != null) {
      map['doi'] = Variable<String>(doi);
    }
    if (!nullToAbsent || arxivId != null) {
      map['arxiv_id'] = Variable<String>(arxivId);
    }
    if (!nullToAbsent || pubmedId != null) {
      map['pubmed_id'] = Variable<String>(pubmedId);
    }
    if (!nullToAbsent || publicationYear != null) {
      map['publication_year'] = Variable<int>(publicationYear);
    }
    map['is_peer_reviewed'] = Variable<bool>(isPeerReviewed);
    map['citations_count'] = Variable<int>(citationsCount);
    if (!nullToAbsent || cid != null) {
      map['cid'] = Variable<String>(cid);
    }
    if (!nullToAbsent || contentHash != null) {
      map['content_hash'] = Variable<String>(contentHash);
    }
    map['size_bytes'] = Variable<int>(sizeBytes);
    map['format'] = Variable<String>(format);
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<String>(categoryId);
    }
    map['verification_tier'] = Variable<String>(verificationTier);
    map['is_downloaded'] = Variable<bool>(isDownloaded);
    map['peer_seeders'] = Variable<int>(peerSeeders);
    return map;
  }

  ResearchPapersCompanion toCompanion(bool nullToAbsent) {
    return ResearchPapersCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      lastSyncedAt: lastSyncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncedAt),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      version: Value(version),
      isDirty: Value(isDirty),
      nodeId:
          nodeId == null && nullToAbsent ? const Value.absent() : Value(nodeId),
      title: Value(title),
      abstractText: Value(abstractText),
      authorsJson: Value(authorsJson),
      journal: journal == null && nullToAbsent
          ? const Value.absent()
          : Value(journal),
      conference: conference == null && nullToAbsent
          ? const Value.absent()
          : Value(conference),
      volume:
          volume == null && nullToAbsent ? const Value.absent() : Value(volume),
      issue:
          issue == null && nullToAbsent ? const Value.absent() : Value(issue),
      pages:
          pages == null && nullToAbsent ? const Value.absent() : Value(pages),
      doi: doi == null && nullToAbsent ? const Value.absent() : Value(doi),
      arxivId: arxivId == null && nullToAbsent
          ? const Value.absent()
          : Value(arxivId),
      pubmedId: pubmedId == null && nullToAbsent
          ? const Value.absent()
          : Value(pubmedId),
      publicationYear: publicationYear == null && nullToAbsent
          ? const Value.absent()
          : Value(publicationYear),
      isPeerReviewed: Value(isPeerReviewed),
      citationsCount: Value(citationsCount),
      cid: cid == null && nullToAbsent ? const Value.absent() : Value(cid),
      contentHash: contentHash == null && nullToAbsent
          ? const Value.absent()
          : Value(contentHash),
      sizeBytes: Value(sizeBytes),
      format: Value(format),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      verificationTier: Value(verificationTier),
      isDownloaded: Value(isDownloaded),
      peerSeeders: Value(peerSeeders),
    );
  }

  factory ResearchPaper.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ResearchPaper(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      lastSyncedAt: serializer.fromJson<DateTime?>(json['lastSyncedAt']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      version: serializer.fromJson<int>(json['version']),
      isDirty: serializer.fromJson<bool>(json['isDirty']),
      nodeId: serializer.fromJson<String?>(json['nodeId']),
      title: serializer.fromJson<String>(json['title']),
      abstractText: serializer.fromJson<String>(json['abstractText']),
      authorsJson: serializer.fromJson<String>(json['authorsJson']),
      journal: serializer.fromJson<String?>(json['journal']),
      conference: serializer.fromJson<String?>(json['conference']),
      volume: serializer.fromJson<String?>(json['volume']),
      issue: serializer.fromJson<String?>(json['issue']),
      pages: serializer.fromJson<String?>(json['pages']),
      doi: serializer.fromJson<String?>(json['doi']),
      arxivId: serializer.fromJson<String?>(json['arxivId']),
      pubmedId: serializer.fromJson<String?>(json['pubmedId']),
      publicationYear: serializer.fromJson<int?>(json['publicationYear']),
      isPeerReviewed: serializer.fromJson<bool>(json['isPeerReviewed']),
      citationsCount: serializer.fromJson<int>(json['citationsCount']),
      cid: serializer.fromJson<String?>(json['cid']),
      contentHash: serializer.fromJson<String?>(json['contentHash']),
      sizeBytes: serializer.fromJson<int>(json['sizeBytes']),
      format: serializer.fromJson<String>(json['format']),
      categoryId: serializer.fromJson<String?>(json['categoryId']),
      verificationTier: serializer.fromJson<String>(json['verificationTier']),
      isDownloaded: serializer.fromJson<bool>(json['isDownloaded']),
      peerSeeders: serializer.fromJson<int>(json['peerSeeders']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'lastSyncedAt': serializer.toJson<DateTime?>(lastSyncedAt),
      'remoteId': serializer.toJson<String?>(remoteId),
      'version': serializer.toJson<int>(version),
      'isDirty': serializer.toJson<bool>(isDirty),
      'nodeId': serializer.toJson<String?>(nodeId),
      'title': serializer.toJson<String>(title),
      'abstractText': serializer.toJson<String>(abstractText),
      'authorsJson': serializer.toJson<String>(authorsJson),
      'journal': serializer.toJson<String?>(journal),
      'conference': serializer.toJson<String?>(conference),
      'volume': serializer.toJson<String?>(volume),
      'issue': serializer.toJson<String?>(issue),
      'pages': serializer.toJson<String?>(pages),
      'doi': serializer.toJson<String?>(doi),
      'arxivId': serializer.toJson<String?>(arxivId),
      'pubmedId': serializer.toJson<String?>(pubmedId),
      'publicationYear': serializer.toJson<int?>(publicationYear),
      'isPeerReviewed': serializer.toJson<bool>(isPeerReviewed),
      'citationsCount': serializer.toJson<int>(citationsCount),
      'cid': serializer.toJson<String?>(cid),
      'contentHash': serializer.toJson<String?>(contentHash),
      'sizeBytes': serializer.toJson<int>(sizeBytes),
      'format': serializer.toJson<String>(format),
      'categoryId': serializer.toJson<String?>(categoryId),
      'verificationTier': serializer.toJson<String>(verificationTier),
      'isDownloaded': serializer.toJson<bool>(isDownloaded),
      'peerSeeders': serializer.toJson<int>(peerSeeders),
    };
  }

  ResearchPaper copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? isDeleted,
          Value<DateTime?> deletedAt = const Value.absent(),
          String? syncStatus,
          Value<DateTime?> lastSyncedAt = const Value.absent(),
          Value<String?> remoteId = const Value.absent(),
          int? version,
          bool? isDirty,
          Value<String?> nodeId = const Value.absent(),
          String? title,
          String? abstractText,
          String? authorsJson,
          Value<String?> journal = const Value.absent(),
          Value<String?> conference = const Value.absent(),
          Value<String?> volume = const Value.absent(),
          Value<String?> issue = const Value.absent(),
          Value<String?> pages = const Value.absent(),
          Value<String?> doi = const Value.absent(),
          Value<String?> arxivId = const Value.absent(),
          Value<String?> pubmedId = const Value.absent(),
          Value<int?> publicationYear = const Value.absent(),
          bool? isPeerReviewed,
          int? citationsCount,
          Value<String?> cid = const Value.absent(),
          Value<String?> contentHash = const Value.absent(),
          int? sizeBytes,
          String? format,
          Value<String?> categoryId = const Value.absent(),
          String? verificationTier,
          bool? isDownloaded,
          int? peerSeeders}) =>
      ResearchPaper(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isDeleted: isDeleted ?? this.isDeleted,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        syncStatus: syncStatus ?? this.syncStatus,
        lastSyncedAt:
            lastSyncedAt.present ? lastSyncedAt.value : this.lastSyncedAt,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        version: version ?? this.version,
        isDirty: isDirty ?? this.isDirty,
        nodeId: nodeId.present ? nodeId.value : this.nodeId,
        title: title ?? this.title,
        abstractText: abstractText ?? this.abstractText,
        authorsJson: authorsJson ?? this.authorsJson,
        journal: journal.present ? journal.value : this.journal,
        conference: conference.present ? conference.value : this.conference,
        volume: volume.present ? volume.value : this.volume,
        issue: issue.present ? issue.value : this.issue,
        pages: pages.present ? pages.value : this.pages,
        doi: doi.present ? doi.value : this.doi,
        arxivId: arxivId.present ? arxivId.value : this.arxivId,
        pubmedId: pubmedId.present ? pubmedId.value : this.pubmedId,
        publicationYear: publicationYear.present
            ? publicationYear.value
            : this.publicationYear,
        isPeerReviewed: isPeerReviewed ?? this.isPeerReviewed,
        citationsCount: citationsCount ?? this.citationsCount,
        cid: cid.present ? cid.value : this.cid,
        contentHash: contentHash.present ? contentHash.value : this.contentHash,
        sizeBytes: sizeBytes ?? this.sizeBytes,
        format: format ?? this.format,
        categoryId: categoryId.present ? categoryId.value : this.categoryId,
        verificationTier: verificationTier ?? this.verificationTier,
        isDownloaded: isDownloaded ?? this.isDownloaded,
        peerSeeders: peerSeeders ?? this.peerSeeders,
      );
  ResearchPaper copyWithCompanion(ResearchPapersCompanion data) {
    return ResearchPaper(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      version: data.version.present ? data.version.value : this.version,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      nodeId: data.nodeId.present ? data.nodeId.value : this.nodeId,
      title: data.title.present ? data.title.value : this.title,
      abstractText: data.abstractText.present
          ? data.abstractText.value
          : this.abstractText,
      authorsJson:
          data.authorsJson.present ? data.authorsJson.value : this.authorsJson,
      journal: data.journal.present ? data.journal.value : this.journal,
      conference:
          data.conference.present ? data.conference.value : this.conference,
      volume: data.volume.present ? data.volume.value : this.volume,
      issue: data.issue.present ? data.issue.value : this.issue,
      pages: data.pages.present ? data.pages.value : this.pages,
      doi: data.doi.present ? data.doi.value : this.doi,
      arxivId: data.arxivId.present ? data.arxivId.value : this.arxivId,
      pubmedId: data.pubmedId.present ? data.pubmedId.value : this.pubmedId,
      publicationYear: data.publicationYear.present
          ? data.publicationYear.value
          : this.publicationYear,
      isPeerReviewed: data.isPeerReviewed.present
          ? data.isPeerReviewed.value
          : this.isPeerReviewed,
      citationsCount: data.citationsCount.present
          ? data.citationsCount.value
          : this.citationsCount,
      cid: data.cid.present ? data.cid.value : this.cid,
      contentHash:
          data.contentHash.present ? data.contentHash.value : this.contentHash,
      sizeBytes: data.sizeBytes.present ? data.sizeBytes.value : this.sizeBytes,
      format: data.format.present ? data.format.value : this.format,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      verificationTier: data.verificationTier.present
          ? data.verificationTier.value
          : this.verificationTier,
      isDownloaded: data.isDownloaded.present
          ? data.isDownloaded.value
          : this.isDownloaded,
      peerSeeders:
          data.peerSeeders.present ? data.peerSeeders.value : this.peerSeeders,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ResearchPaper(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('version: $version, ')
          ..write('isDirty: $isDirty, ')
          ..write('nodeId: $nodeId, ')
          ..write('title: $title, ')
          ..write('abstractText: $abstractText, ')
          ..write('authorsJson: $authorsJson, ')
          ..write('journal: $journal, ')
          ..write('conference: $conference, ')
          ..write('volume: $volume, ')
          ..write('issue: $issue, ')
          ..write('pages: $pages, ')
          ..write('doi: $doi, ')
          ..write('arxivId: $arxivId, ')
          ..write('pubmedId: $pubmedId, ')
          ..write('publicationYear: $publicationYear, ')
          ..write('isPeerReviewed: $isPeerReviewed, ')
          ..write('citationsCount: $citationsCount, ')
          ..write('cid: $cid, ')
          ..write('contentHash: $contentHash, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('format: $format, ')
          ..write('categoryId: $categoryId, ')
          ..write('verificationTier: $verificationTier, ')
          ..write('isDownloaded: $isDownloaded, ')
          ..write('peerSeeders: $peerSeeders')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        createdAt,
        updatedAt,
        isDeleted,
        deletedAt,
        syncStatus,
        lastSyncedAt,
        remoteId,
        version,
        isDirty,
        nodeId,
        title,
        abstractText,
        authorsJson,
        journal,
        conference,
        volume,
        issue,
        pages,
        doi,
        arxivId,
        pubmedId,
        publicationYear,
        isPeerReviewed,
        citationsCount,
        cid,
        contentHash,
        sizeBytes,
        format,
        categoryId,
        verificationTier,
        isDownloaded,
        peerSeeders
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ResearchPaper &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.lastSyncedAt == this.lastSyncedAt &&
          other.remoteId == this.remoteId &&
          other.version == this.version &&
          other.isDirty == this.isDirty &&
          other.nodeId == this.nodeId &&
          other.title == this.title &&
          other.abstractText == this.abstractText &&
          other.authorsJson == this.authorsJson &&
          other.journal == this.journal &&
          other.conference == this.conference &&
          other.volume == this.volume &&
          other.issue == this.issue &&
          other.pages == this.pages &&
          other.doi == this.doi &&
          other.arxivId == this.arxivId &&
          other.pubmedId == this.pubmedId &&
          other.publicationYear == this.publicationYear &&
          other.isPeerReviewed == this.isPeerReviewed &&
          other.citationsCount == this.citationsCount &&
          other.cid == this.cid &&
          other.contentHash == this.contentHash &&
          other.sizeBytes == this.sizeBytes &&
          other.format == this.format &&
          other.categoryId == this.categoryId &&
          other.verificationTier == this.verificationTier &&
          other.isDownloaded == this.isDownloaded &&
          other.peerSeeders == this.peerSeeders);
}

class ResearchPapersCompanion extends UpdateCompanion<ResearchPaper> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<DateTime?> lastSyncedAt;
  final Value<String?> remoteId;
  final Value<int> version;
  final Value<bool> isDirty;
  final Value<String?> nodeId;
  final Value<String> title;
  final Value<String> abstractText;
  final Value<String> authorsJson;
  final Value<String?> journal;
  final Value<String?> conference;
  final Value<String?> volume;
  final Value<String?> issue;
  final Value<String?> pages;
  final Value<String?> doi;
  final Value<String?> arxivId;
  final Value<String?> pubmedId;
  final Value<int?> publicationYear;
  final Value<bool> isPeerReviewed;
  final Value<int> citationsCount;
  final Value<String?> cid;
  final Value<String?> contentHash;
  final Value<int> sizeBytes;
  final Value<String> format;
  final Value<String?> categoryId;
  final Value<String> verificationTier;
  final Value<bool> isDownloaded;
  final Value<int> peerSeeders;
  final Value<int> rowid;
  const ResearchPapersCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.version = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.nodeId = const Value.absent(),
    this.title = const Value.absent(),
    this.abstractText = const Value.absent(),
    this.authorsJson = const Value.absent(),
    this.journal = const Value.absent(),
    this.conference = const Value.absent(),
    this.volume = const Value.absent(),
    this.issue = const Value.absent(),
    this.pages = const Value.absent(),
    this.doi = const Value.absent(),
    this.arxivId = const Value.absent(),
    this.pubmedId = const Value.absent(),
    this.publicationYear = const Value.absent(),
    this.isPeerReviewed = const Value.absent(),
    this.citationsCount = const Value.absent(),
    this.cid = const Value.absent(),
    this.contentHash = const Value.absent(),
    this.sizeBytes = const Value.absent(),
    this.format = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.verificationTier = const Value.absent(),
    this.isDownloaded = const Value.absent(),
    this.peerSeeders = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ResearchPapersCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.version = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.nodeId = const Value.absent(),
    required String title,
    this.abstractText = const Value.absent(),
    this.authorsJson = const Value.absent(),
    this.journal = const Value.absent(),
    this.conference = const Value.absent(),
    this.volume = const Value.absent(),
    this.issue = const Value.absent(),
    this.pages = const Value.absent(),
    this.doi = const Value.absent(),
    this.arxivId = const Value.absent(),
    this.pubmedId = const Value.absent(),
    this.publicationYear = const Value.absent(),
    this.isPeerReviewed = const Value.absent(),
    this.citationsCount = const Value.absent(),
    this.cid = const Value.absent(),
    this.contentHash = const Value.absent(),
    this.sizeBytes = const Value.absent(),
    this.format = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.verificationTier = const Value.absent(),
    this.isDownloaded = const Value.absent(),
    this.peerSeeders = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title);
  static Insertable<ResearchPaper> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<DateTime>? lastSyncedAt,
    Expression<String>? remoteId,
    Expression<int>? version,
    Expression<bool>? isDirty,
    Expression<String>? nodeId,
    Expression<String>? title,
    Expression<String>? abstractText,
    Expression<String>? authorsJson,
    Expression<String>? journal,
    Expression<String>? conference,
    Expression<String>? volume,
    Expression<String>? issue,
    Expression<String>? pages,
    Expression<String>? doi,
    Expression<String>? arxivId,
    Expression<String>? pubmedId,
    Expression<int>? publicationYear,
    Expression<bool>? isPeerReviewed,
    Expression<int>? citationsCount,
    Expression<String>? cid,
    Expression<String>? contentHash,
    Expression<int>? sizeBytes,
    Expression<String>? format,
    Expression<String>? categoryId,
    Expression<String>? verificationTier,
    Expression<bool>? isDownloaded,
    Expression<int>? peerSeeders,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (remoteId != null) 'remote_id': remoteId,
      if (version != null) 'version': version,
      if (isDirty != null) 'is_dirty': isDirty,
      if (nodeId != null) 'node_id': nodeId,
      if (title != null) 'title': title,
      if (abstractText != null) 'abstract_text': abstractText,
      if (authorsJson != null) 'authors_json': authorsJson,
      if (journal != null) 'journal': journal,
      if (conference != null) 'conference': conference,
      if (volume != null) 'volume': volume,
      if (issue != null) 'issue': issue,
      if (pages != null) 'pages': pages,
      if (doi != null) 'doi': doi,
      if (arxivId != null) 'arxiv_id': arxivId,
      if (pubmedId != null) 'pubmed_id': pubmedId,
      if (publicationYear != null) 'publication_year': publicationYear,
      if (isPeerReviewed != null) 'is_peer_reviewed': isPeerReviewed,
      if (citationsCount != null) 'citations_count': citationsCount,
      if (cid != null) 'cid': cid,
      if (contentHash != null) 'content_hash': contentHash,
      if (sizeBytes != null) 'size_bytes': sizeBytes,
      if (format != null) 'format': format,
      if (categoryId != null) 'category_id': categoryId,
      if (verificationTier != null) 'verification_tier': verificationTier,
      if (isDownloaded != null) 'is_downloaded': isDownloaded,
      if (peerSeeders != null) 'peer_seeders': peerSeeders,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ResearchPapersCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? isDeleted,
      Value<DateTime?>? deletedAt,
      Value<String>? syncStatus,
      Value<DateTime?>? lastSyncedAt,
      Value<String?>? remoteId,
      Value<int>? version,
      Value<bool>? isDirty,
      Value<String?>? nodeId,
      Value<String>? title,
      Value<String>? abstractText,
      Value<String>? authorsJson,
      Value<String?>? journal,
      Value<String?>? conference,
      Value<String?>? volume,
      Value<String?>? issue,
      Value<String?>? pages,
      Value<String?>? doi,
      Value<String?>? arxivId,
      Value<String?>? pubmedId,
      Value<int?>? publicationYear,
      Value<bool>? isPeerReviewed,
      Value<int>? citationsCount,
      Value<String?>? cid,
      Value<String?>? contentHash,
      Value<int>? sizeBytes,
      Value<String>? format,
      Value<String?>? categoryId,
      Value<String>? verificationTier,
      Value<bool>? isDownloaded,
      Value<int>? peerSeeders,
      Value<int>? rowid}) {
    return ResearchPapersCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      remoteId: remoteId ?? this.remoteId,
      version: version ?? this.version,
      isDirty: isDirty ?? this.isDirty,
      nodeId: nodeId ?? this.nodeId,
      title: title ?? this.title,
      abstractText: abstractText ?? this.abstractText,
      authorsJson: authorsJson ?? this.authorsJson,
      journal: journal ?? this.journal,
      conference: conference ?? this.conference,
      volume: volume ?? this.volume,
      issue: issue ?? this.issue,
      pages: pages ?? this.pages,
      doi: doi ?? this.doi,
      arxivId: arxivId ?? this.arxivId,
      pubmedId: pubmedId ?? this.pubmedId,
      publicationYear: publicationYear ?? this.publicationYear,
      isPeerReviewed: isPeerReviewed ?? this.isPeerReviewed,
      citationsCount: citationsCount ?? this.citationsCount,
      cid: cid ?? this.cid,
      contentHash: contentHash ?? this.contentHash,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      format: format ?? this.format,
      categoryId: categoryId ?? this.categoryId,
      verificationTier: verificationTier ?? this.verificationTier,
      isDownloaded: isDownloaded ?? this.isDownloaded,
      peerSeeders: peerSeeders ?? this.peerSeeders,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isDirty.present) {
      map['is_dirty'] = Variable<bool>(isDirty.value);
    }
    if (nodeId.present) {
      map['node_id'] = Variable<String>(nodeId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (abstractText.present) {
      map['abstract_text'] = Variable<String>(abstractText.value);
    }
    if (authorsJson.present) {
      map['authors_json'] = Variable<String>(authorsJson.value);
    }
    if (journal.present) {
      map['journal'] = Variable<String>(journal.value);
    }
    if (conference.present) {
      map['conference'] = Variable<String>(conference.value);
    }
    if (volume.present) {
      map['volume'] = Variable<String>(volume.value);
    }
    if (issue.present) {
      map['issue'] = Variable<String>(issue.value);
    }
    if (pages.present) {
      map['pages'] = Variable<String>(pages.value);
    }
    if (doi.present) {
      map['doi'] = Variable<String>(doi.value);
    }
    if (arxivId.present) {
      map['arxiv_id'] = Variable<String>(arxivId.value);
    }
    if (pubmedId.present) {
      map['pubmed_id'] = Variable<String>(pubmedId.value);
    }
    if (publicationYear.present) {
      map['publication_year'] = Variable<int>(publicationYear.value);
    }
    if (isPeerReviewed.present) {
      map['is_peer_reviewed'] = Variable<bool>(isPeerReviewed.value);
    }
    if (citationsCount.present) {
      map['citations_count'] = Variable<int>(citationsCount.value);
    }
    if (cid.present) {
      map['cid'] = Variable<String>(cid.value);
    }
    if (contentHash.present) {
      map['content_hash'] = Variable<String>(contentHash.value);
    }
    if (sizeBytes.present) {
      map['size_bytes'] = Variable<int>(sizeBytes.value);
    }
    if (format.present) {
      map['format'] = Variable<String>(format.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (verificationTier.present) {
      map['verification_tier'] = Variable<String>(verificationTier.value);
    }
    if (isDownloaded.present) {
      map['is_downloaded'] = Variable<bool>(isDownloaded.value);
    }
    if (peerSeeders.present) {
      map['peer_seeders'] = Variable<int>(peerSeeders.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ResearchPapersCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('version: $version, ')
          ..write('isDirty: $isDirty, ')
          ..write('nodeId: $nodeId, ')
          ..write('title: $title, ')
          ..write('abstractText: $abstractText, ')
          ..write('authorsJson: $authorsJson, ')
          ..write('journal: $journal, ')
          ..write('conference: $conference, ')
          ..write('volume: $volume, ')
          ..write('issue: $issue, ')
          ..write('pages: $pages, ')
          ..write('doi: $doi, ')
          ..write('arxivId: $arxivId, ')
          ..write('pubmedId: $pubmedId, ')
          ..write('publicationYear: $publicationYear, ')
          ..write('isPeerReviewed: $isPeerReviewed, ')
          ..write('citationsCount: $citationsCount, ')
          ..write('cid: $cid, ')
          ..write('contentHash: $contentHash, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('format: $format, ')
          ..write('categoryId: $categoryId, ')
          ..write('verificationTier: $verificationTier, ')
          ..write('isDownloaded: $isDownloaded, ')
          ..write('peerSeeders: $peerSeeders, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DownloadsTable extends Downloads
    with TableInfo<$DownloadsTable, Download> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DownloadsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  static const VerificationMeta _lastSyncedAtMeta =
      const VerificationMeta('lastSyncedAt');
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
      'last_synced_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _isDirtyMeta =
      const VerificationMeta('isDirty');
  @override
  late final GeneratedColumn<bool> isDirty = GeneratedColumn<bool>(
      'is_dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_dirty" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _nodeIdMeta = const VerificationMeta('nodeId');
  @override
  late final GeneratedColumn<String> nodeId = GeneratedColumn<String>(
      'node_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _resourceIdMeta =
      const VerificationMeta('resourceId');
  @override
  late final GeneratedColumn<String> resourceId = GeneratedColumn<String>(
      'resource_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _resourceTypeMeta =
      const VerificationMeta('resourceType');
  @override
  late final GeneratedColumn<String> resourceType = GeneratedColumn<String>(
      'resource_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('book'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 500),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _filePathMeta =
      const VerificationMeta('filePath');
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
      'file_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fileSizeBytesMeta =
      const VerificationMeta('fileSizeBytes');
  @override
  late final GeneratedColumn<int> fileSizeBytes = GeneratedColumn<int>(
      'file_size_bytes', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _bytesDownloadedMeta =
      const VerificationMeta('bytesDownloaded');
  @override
  late final GeneratedColumn<int> bytesDownloaded = GeneratedColumn<int>(
      'bytes_downloaded', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _downloadStatusMeta =
      const VerificationMeta('downloadStatus');
  @override
  late final GeneratedColumn<String> downloadStatus = GeneratedColumn<String>(
      'download_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pending'));
  static const VerificationMeta _downloadSpeedBpsMeta =
      const VerificationMeta('downloadSpeedBps');
  @override
  late final GeneratedColumn<int> downloadSpeedBps = GeneratedColumn<int>(
      'download_speed_bps', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _progressMeta =
      const VerificationMeta('progress');
  @override
  late final GeneratedColumn<double> progress = GeneratedColumn<double>(
      'progress', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _errorMessageMeta =
      const VerificationMeta('errorMessage');
  @override
  late final GeneratedColumn<String> errorMessage = GeneratedColumn<String>(
      'error_message', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _cidMeta = const VerificationMeta('cid');
  @override
  late final GeneratedColumn<String> cid = GeneratedColumn<String>(
      'cid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _peerCountMeta =
      const VerificationMeta('peerCount');
  @override
  late final GeneratedColumn<int> peerCount = GeneratedColumn<int>(
      'peer_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _completedAtMeta =
      const VerificationMeta('completedAt');
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
      'completed_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        isDeleted,
        deletedAt,
        syncStatus,
        lastSyncedAt,
        remoteId,
        version,
        isDirty,
        nodeId,
        resourceId,
        resourceType,
        title,
        filePath,
        fileSizeBytes,
        bytesDownloaded,
        downloadStatus,
        downloadSpeedBps,
        progress,
        errorMessage,
        cid,
        peerCount,
        completedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'downloads';
  @override
  VerificationContext validateIntegrity(Insertable<Download> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
          _lastSyncedAtMeta,
          lastSyncedAt.isAcceptableOrUnknown(
              data['last_synced_at']!, _lastSyncedAtMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('is_dirty')) {
      context.handle(_isDirtyMeta,
          isDirty.isAcceptableOrUnknown(data['is_dirty']!, _isDirtyMeta));
    }
    if (data.containsKey('node_id')) {
      context.handle(_nodeIdMeta,
          nodeId.isAcceptableOrUnknown(data['node_id']!, _nodeIdMeta));
    }
    if (data.containsKey('resource_id')) {
      context.handle(
          _resourceIdMeta,
          resourceId.isAcceptableOrUnknown(
              data['resource_id']!, _resourceIdMeta));
    } else if (isInserting) {
      context.missing(_resourceIdMeta);
    }
    if (data.containsKey('resource_type')) {
      context.handle(
          _resourceTypeMeta,
          resourceType.isAcceptableOrUnknown(
              data['resource_type']!, _resourceTypeMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(_filePathMeta,
          filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta));
    }
    if (data.containsKey('file_size_bytes')) {
      context.handle(
          _fileSizeBytesMeta,
          fileSizeBytes.isAcceptableOrUnknown(
              data['file_size_bytes']!, _fileSizeBytesMeta));
    }
    if (data.containsKey('bytes_downloaded')) {
      context.handle(
          _bytesDownloadedMeta,
          bytesDownloaded.isAcceptableOrUnknown(
              data['bytes_downloaded']!, _bytesDownloadedMeta));
    }
    if (data.containsKey('download_status')) {
      context.handle(
          _downloadStatusMeta,
          downloadStatus.isAcceptableOrUnknown(
              data['download_status']!, _downloadStatusMeta));
    }
    if (data.containsKey('download_speed_bps')) {
      context.handle(
          _downloadSpeedBpsMeta,
          downloadSpeedBps.isAcceptableOrUnknown(
              data['download_speed_bps']!, _downloadSpeedBpsMeta));
    }
    if (data.containsKey('progress')) {
      context.handle(_progressMeta,
          progress.isAcceptableOrUnknown(data['progress']!, _progressMeta));
    }
    if (data.containsKey('error_message')) {
      context.handle(
          _errorMessageMeta,
          errorMessage.isAcceptableOrUnknown(
              data['error_message']!, _errorMessageMeta));
    }
    if (data.containsKey('cid')) {
      context.handle(
          _cidMeta, cid.isAcceptableOrUnknown(data['cid']!, _cidMeta));
    }
    if (data.containsKey('peer_count')) {
      context.handle(_peerCountMeta,
          peerCount.isAcceptableOrUnknown(data['peer_count']!, _peerCountMeta));
    }
    if (data.containsKey('completed_at')) {
      context.handle(
          _completedAtMeta,
          completedAt.isAcceptableOrUnknown(
              data['completed_at']!, _completedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Download map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Download(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_synced_at']),
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      isDirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_dirty'])!,
      nodeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}node_id']),
      resourceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resource_id'])!,
      resourceType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resource_type'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      filePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_path']),
      fileSizeBytes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}file_size_bytes'])!,
      bytesDownloaded: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bytes_downloaded'])!,
      downloadStatus: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}download_status'])!,
      downloadSpeedBps: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}download_speed_bps'])!,
      progress: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}progress'])!,
      errorMessage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}error_message']),
      cid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cid']),
      peerCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}peer_count'])!,
      completedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}completed_at']),
    );
  }

  @override
  $DownloadsTable createAlias(String alias) {
    return $DownloadsTable(attachedDatabase, alias);
  }
}

class Download extends DataClass implements Insertable<Download> {
  /// Unique Primary Key identifier (UUID string or unique content hash).
  final String id;

  /// Creation timestamp.
  final DateTime createdAt;

  /// Last modification timestamp.
  final DateTime updatedAt;

  /// Soft delete flag to prevent permanent data loss and facilitate sync deletions.
  final bool isDeleted;

  /// Timestamp when the record was soft-deleted.
  final DateTime? deletedAt;

  /// Current synchronization status ('synced', 'pending', 'conflict', 'local_only').
  final String syncStatus;

  /// Timestamp when the record was last synchronized with a remote or peer node.
  final DateTime? lastSyncedAt;

  /// Remote or global canonical identifier (e.g., global URI or CID).
  final String? remoteId;

  /// Monotonic version counter for conflict resolution.
  final int version;

  /// Indicates if the record has local uncommitted changes waiting for sync.
  final bool isDirty;

  /// Peer or node ID that originally created or last modified this record.
  final String? nodeId;

  /// Target resource identifier.
  final String resourceId;

  /// Resource type discriminator ('book', 'paper', 'dataset', 'note').
  final String resourceType;

  /// Human-readable title of the downloading artifact.
  final String title;

  /// Local relative or absolute destination file path on disk.
  final String? filePath;

  /// Total target file size in bytes.
  final int fileSizeBytes;

  /// Bytes currently downloaded and verified.
  final int bytesDownloaded;

  /// Download lifecycle status ('pending', 'downloading', 'paused', 'completed', 'failed').
  final String downloadStatus;

  /// Real-time throughput in bytes per second.
  final int downloadSpeedBps;

  /// Linear progress fraction (0.0 to 1.0).
  final double progress;

  /// Error message in case of transfer or cryptographic integrity failure.
  final String? errorMessage;

  /// Content identifier for P2P chunk resolution.
  final String? cid;

  /// Connected seeder peer count during download.
  final int peerCount;

  /// Timestamp when download and SHA-256 verification finished.
  final DateTime? completedAt;
  const Download(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.isDeleted,
      this.deletedAt,
      required this.syncStatus,
      this.lastSyncedAt,
      this.remoteId,
      required this.version,
      required this.isDirty,
      this.nodeId,
      required this.resourceId,
      required this.resourceType,
      required this.title,
      this.filePath,
      required this.fileSizeBytes,
      required this.bytesDownloaded,
      required this.downloadStatus,
      required this.downloadSpeedBps,
      required this.progress,
      this.errorMessage,
      this.cid,
      required this.peerCount,
      this.completedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || lastSyncedAt != null) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    }
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['version'] = Variable<int>(version);
    map['is_dirty'] = Variable<bool>(isDirty);
    if (!nullToAbsent || nodeId != null) {
      map['node_id'] = Variable<String>(nodeId);
    }
    map['resource_id'] = Variable<String>(resourceId);
    map['resource_type'] = Variable<String>(resourceType);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || filePath != null) {
      map['file_path'] = Variable<String>(filePath);
    }
    map['file_size_bytes'] = Variable<int>(fileSizeBytes);
    map['bytes_downloaded'] = Variable<int>(bytesDownloaded);
    map['download_status'] = Variable<String>(downloadStatus);
    map['download_speed_bps'] = Variable<int>(downloadSpeedBps);
    map['progress'] = Variable<double>(progress);
    if (!nullToAbsent || errorMessage != null) {
      map['error_message'] = Variable<String>(errorMessage);
    }
    if (!nullToAbsent || cid != null) {
      map['cid'] = Variable<String>(cid);
    }
    map['peer_count'] = Variable<int>(peerCount);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    return map;
  }

  DownloadsCompanion toCompanion(bool nullToAbsent) {
    return DownloadsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      lastSyncedAt: lastSyncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncedAt),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      version: Value(version),
      isDirty: Value(isDirty),
      nodeId:
          nodeId == null && nullToAbsent ? const Value.absent() : Value(nodeId),
      resourceId: Value(resourceId),
      resourceType: Value(resourceType),
      title: Value(title),
      filePath: filePath == null && nullToAbsent
          ? const Value.absent()
          : Value(filePath),
      fileSizeBytes: Value(fileSizeBytes),
      bytesDownloaded: Value(bytesDownloaded),
      downloadStatus: Value(downloadStatus),
      downloadSpeedBps: Value(downloadSpeedBps),
      progress: Value(progress),
      errorMessage: errorMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(errorMessage),
      cid: cid == null && nullToAbsent ? const Value.absent() : Value(cid),
      peerCount: Value(peerCount),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
    );
  }

  factory Download.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Download(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      lastSyncedAt: serializer.fromJson<DateTime?>(json['lastSyncedAt']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      version: serializer.fromJson<int>(json['version']),
      isDirty: serializer.fromJson<bool>(json['isDirty']),
      nodeId: serializer.fromJson<String?>(json['nodeId']),
      resourceId: serializer.fromJson<String>(json['resourceId']),
      resourceType: serializer.fromJson<String>(json['resourceType']),
      title: serializer.fromJson<String>(json['title']),
      filePath: serializer.fromJson<String?>(json['filePath']),
      fileSizeBytes: serializer.fromJson<int>(json['fileSizeBytes']),
      bytesDownloaded: serializer.fromJson<int>(json['bytesDownloaded']),
      downloadStatus: serializer.fromJson<String>(json['downloadStatus']),
      downloadSpeedBps: serializer.fromJson<int>(json['downloadSpeedBps']),
      progress: serializer.fromJson<double>(json['progress']),
      errorMessage: serializer.fromJson<String?>(json['errorMessage']),
      cid: serializer.fromJson<String?>(json['cid']),
      peerCount: serializer.fromJson<int>(json['peerCount']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'lastSyncedAt': serializer.toJson<DateTime?>(lastSyncedAt),
      'remoteId': serializer.toJson<String?>(remoteId),
      'version': serializer.toJson<int>(version),
      'isDirty': serializer.toJson<bool>(isDirty),
      'nodeId': serializer.toJson<String?>(nodeId),
      'resourceId': serializer.toJson<String>(resourceId),
      'resourceType': serializer.toJson<String>(resourceType),
      'title': serializer.toJson<String>(title),
      'filePath': serializer.toJson<String?>(filePath),
      'fileSizeBytes': serializer.toJson<int>(fileSizeBytes),
      'bytesDownloaded': serializer.toJson<int>(bytesDownloaded),
      'downloadStatus': serializer.toJson<String>(downloadStatus),
      'downloadSpeedBps': serializer.toJson<int>(downloadSpeedBps),
      'progress': serializer.toJson<double>(progress),
      'errorMessage': serializer.toJson<String?>(errorMessage),
      'cid': serializer.toJson<String?>(cid),
      'peerCount': serializer.toJson<int>(peerCount),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
    };
  }

  Download copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? isDeleted,
          Value<DateTime?> deletedAt = const Value.absent(),
          String? syncStatus,
          Value<DateTime?> lastSyncedAt = const Value.absent(),
          Value<String?> remoteId = const Value.absent(),
          int? version,
          bool? isDirty,
          Value<String?> nodeId = const Value.absent(),
          String? resourceId,
          String? resourceType,
          String? title,
          Value<String?> filePath = const Value.absent(),
          int? fileSizeBytes,
          int? bytesDownloaded,
          String? downloadStatus,
          int? downloadSpeedBps,
          double? progress,
          Value<String?> errorMessage = const Value.absent(),
          Value<String?> cid = const Value.absent(),
          int? peerCount,
          Value<DateTime?> completedAt = const Value.absent()}) =>
      Download(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isDeleted: isDeleted ?? this.isDeleted,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        syncStatus: syncStatus ?? this.syncStatus,
        lastSyncedAt:
            lastSyncedAt.present ? lastSyncedAt.value : this.lastSyncedAt,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        version: version ?? this.version,
        isDirty: isDirty ?? this.isDirty,
        nodeId: nodeId.present ? nodeId.value : this.nodeId,
        resourceId: resourceId ?? this.resourceId,
        resourceType: resourceType ?? this.resourceType,
        title: title ?? this.title,
        filePath: filePath.present ? filePath.value : this.filePath,
        fileSizeBytes: fileSizeBytes ?? this.fileSizeBytes,
        bytesDownloaded: bytesDownloaded ?? this.bytesDownloaded,
        downloadStatus: downloadStatus ?? this.downloadStatus,
        downloadSpeedBps: downloadSpeedBps ?? this.downloadSpeedBps,
        progress: progress ?? this.progress,
        errorMessage:
            errorMessage.present ? errorMessage.value : this.errorMessage,
        cid: cid.present ? cid.value : this.cid,
        peerCount: peerCount ?? this.peerCount,
        completedAt: completedAt.present ? completedAt.value : this.completedAt,
      );
  Download copyWithCompanion(DownloadsCompanion data) {
    return Download(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      version: data.version.present ? data.version.value : this.version,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      nodeId: data.nodeId.present ? data.nodeId.value : this.nodeId,
      resourceId:
          data.resourceId.present ? data.resourceId.value : this.resourceId,
      resourceType: data.resourceType.present
          ? data.resourceType.value
          : this.resourceType,
      title: data.title.present ? data.title.value : this.title,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      fileSizeBytes: data.fileSizeBytes.present
          ? data.fileSizeBytes.value
          : this.fileSizeBytes,
      bytesDownloaded: data.bytesDownloaded.present
          ? data.bytesDownloaded.value
          : this.bytesDownloaded,
      downloadStatus: data.downloadStatus.present
          ? data.downloadStatus.value
          : this.downloadStatus,
      downloadSpeedBps: data.downloadSpeedBps.present
          ? data.downloadSpeedBps.value
          : this.downloadSpeedBps,
      progress: data.progress.present ? data.progress.value : this.progress,
      errorMessage: data.errorMessage.present
          ? data.errorMessage.value
          : this.errorMessage,
      cid: data.cid.present ? data.cid.value : this.cid,
      peerCount: data.peerCount.present ? data.peerCount.value : this.peerCount,
      completedAt:
          data.completedAt.present ? data.completedAt.value : this.completedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Download(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('version: $version, ')
          ..write('isDirty: $isDirty, ')
          ..write('nodeId: $nodeId, ')
          ..write('resourceId: $resourceId, ')
          ..write('resourceType: $resourceType, ')
          ..write('title: $title, ')
          ..write('filePath: $filePath, ')
          ..write('fileSizeBytes: $fileSizeBytes, ')
          ..write('bytesDownloaded: $bytesDownloaded, ')
          ..write('downloadStatus: $downloadStatus, ')
          ..write('downloadSpeedBps: $downloadSpeedBps, ')
          ..write('progress: $progress, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('cid: $cid, ')
          ..write('peerCount: $peerCount, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        createdAt,
        updatedAt,
        isDeleted,
        deletedAt,
        syncStatus,
        lastSyncedAt,
        remoteId,
        version,
        isDirty,
        nodeId,
        resourceId,
        resourceType,
        title,
        filePath,
        fileSizeBytes,
        bytesDownloaded,
        downloadStatus,
        downloadSpeedBps,
        progress,
        errorMessage,
        cid,
        peerCount,
        completedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Download &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.lastSyncedAt == this.lastSyncedAt &&
          other.remoteId == this.remoteId &&
          other.version == this.version &&
          other.isDirty == this.isDirty &&
          other.nodeId == this.nodeId &&
          other.resourceId == this.resourceId &&
          other.resourceType == this.resourceType &&
          other.title == this.title &&
          other.filePath == this.filePath &&
          other.fileSizeBytes == this.fileSizeBytes &&
          other.bytesDownloaded == this.bytesDownloaded &&
          other.downloadStatus == this.downloadStatus &&
          other.downloadSpeedBps == this.downloadSpeedBps &&
          other.progress == this.progress &&
          other.errorMessage == this.errorMessage &&
          other.cid == this.cid &&
          other.peerCount == this.peerCount &&
          other.completedAt == this.completedAt);
}

class DownloadsCompanion extends UpdateCompanion<Download> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<DateTime?> lastSyncedAt;
  final Value<String?> remoteId;
  final Value<int> version;
  final Value<bool> isDirty;
  final Value<String?> nodeId;
  final Value<String> resourceId;
  final Value<String> resourceType;
  final Value<String> title;
  final Value<String?> filePath;
  final Value<int> fileSizeBytes;
  final Value<int> bytesDownloaded;
  final Value<String> downloadStatus;
  final Value<int> downloadSpeedBps;
  final Value<double> progress;
  final Value<String?> errorMessage;
  final Value<String?> cid;
  final Value<int> peerCount;
  final Value<DateTime?> completedAt;
  final Value<int> rowid;
  const DownloadsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.version = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.nodeId = const Value.absent(),
    this.resourceId = const Value.absent(),
    this.resourceType = const Value.absent(),
    this.title = const Value.absent(),
    this.filePath = const Value.absent(),
    this.fileSizeBytes = const Value.absent(),
    this.bytesDownloaded = const Value.absent(),
    this.downloadStatus = const Value.absent(),
    this.downloadSpeedBps = const Value.absent(),
    this.progress = const Value.absent(),
    this.errorMessage = const Value.absent(),
    this.cid = const Value.absent(),
    this.peerCount = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DownloadsCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.version = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.nodeId = const Value.absent(),
    required String resourceId,
    this.resourceType = const Value.absent(),
    required String title,
    this.filePath = const Value.absent(),
    this.fileSizeBytes = const Value.absent(),
    this.bytesDownloaded = const Value.absent(),
    this.downloadStatus = const Value.absent(),
    this.downloadSpeedBps = const Value.absent(),
    this.progress = const Value.absent(),
    this.errorMessage = const Value.absent(),
    this.cid = const Value.absent(),
    this.peerCount = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        resourceId = Value(resourceId),
        title = Value(title);
  static Insertable<Download> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<DateTime>? lastSyncedAt,
    Expression<String>? remoteId,
    Expression<int>? version,
    Expression<bool>? isDirty,
    Expression<String>? nodeId,
    Expression<String>? resourceId,
    Expression<String>? resourceType,
    Expression<String>? title,
    Expression<String>? filePath,
    Expression<int>? fileSizeBytes,
    Expression<int>? bytesDownloaded,
    Expression<String>? downloadStatus,
    Expression<int>? downloadSpeedBps,
    Expression<double>? progress,
    Expression<String>? errorMessage,
    Expression<String>? cid,
    Expression<int>? peerCount,
    Expression<DateTime>? completedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (remoteId != null) 'remote_id': remoteId,
      if (version != null) 'version': version,
      if (isDirty != null) 'is_dirty': isDirty,
      if (nodeId != null) 'node_id': nodeId,
      if (resourceId != null) 'resource_id': resourceId,
      if (resourceType != null) 'resource_type': resourceType,
      if (title != null) 'title': title,
      if (filePath != null) 'file_path': filePath,
      if (fileSizeBytes != null) 'file_size_bytes': fileSizeBytes,
      if (bytesDownloaded != null) 'bytes_downloaded': bytesDownloaded,
      if (downloadStatus != null) 'download_status': downloadStatus,
      if (downloadSpeedBps != null) 'download_speed_bps': downloadSpeedBps,
      if (progress != null) 'progress': progress,
      if (errorMessage != null) 'error_message': errorMessage,
      if (cid != null) 'cid': cid,
      if (peerCount != null) 'peer_count': peerCount,
      if (completedAt != null) 'completed_at': completedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DownloadsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? isDeleted,
      Value<DateTime?>? deletedAt,
      Value<String>? syncStatus,
      Value<DateTime?>? lastSyncedAt,
      Value<String?>? remoteId,
      Value<int>? version,
      Value<bool>? isDirty,
      Value<String?>? nodeId,
      Value<String>? resourceId,
      Value<String>? resourceType,
      Value<String>? title,
      Value<String?>? filePath,
      Value<int>? fileSizeBytes,
      Value<int>? bytesDownloaded,
      Value<String>? downloadStatus,
      Value<int>? downloadSpeedBps,
      Value<double>? progress,
      Value<String?>? errorMessage,
      Value<String?>? cid,
      Value<int>? peerCount,
      Value<DateTime?>? completedAt,
      Value<int>? rowid}) {
    return DownloadsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      remoteId: remoteId ?? this.remoteId,
      version: version ?? this.version,
      isDirty: isDirty ?? this.isDirty,
      nodeId: nodeId ?? this.nodeId,
      resourceId: resourceId ?? this.resourceId,
      resourceType: resourceType ?? this.resourceType,
      title: title ?? this.title,
      filePath: filePath ?? this.filePath,
      fileSizeBytes: fileSizeBytes ?? this.fileSizeBytes,
      bytesDownloaded: bytesDownloaded ?? this.bytesDownloaded,
      downloadStatus: downloadStatus ?? this.downloadStatus,
      downloadSpeedBps: downloadSpeedBps ?? this.downloadSpeedBps,
      progress: progress ?? this.progress,
      errorMessage: errorMessage ?? this.errorMessage,
      cid: cid ?? this.cid,
      peerCount: peerCount ?? this.peerCount,
      completedAt: completedAt ?? this.completedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isDirty.present) {
      map['is_dirty'] = Variable<bool>(isDirty.value);
    }
    if (nodeId.present) {
      map['node_id'] = Variable<String>(nodeId.value);
    }
    if (resourceId.present) {
      map['resource_id'] = Variable<String>(resourceId.value);
    }
    if (resourceType.present) {
      map['resource_type'] = Variable<String>(resourceType.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (fileSizeBytes.present) {
      map['file_size_bytes'] = Variable<int>(fileSizeBytes.value);
    }
    if (bytesDownloaded.present) {
      map['bytes_downloaded'] = Variable<int>(bytesDownloaded.value);
    }
    if (downloadStatus.present) {
      map['download_status'] = Variable<String>(downloadStatus.value);
    }
    if (downloadSpeedBps.present) {
      map['download_speed_bps'] = Variable<int>(downloadSpeedBps.value);
    }
    if (progress.present) {
      map['progress'] = Variable<double>(progress.value);
    }
    if (errorMessage.present) {
      map['error_message'] = Variable<String>(errorMessage.value);
    }
    if (cid.present) {
      map['cid'] = Variable<String>(cid.value);
    }
    if (peerCount.present) {
      map['peer_count'] = Variable<int>(peerCount.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DownloadsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('version: $version, ')
          ..write('isDirty: $isDirty, ')
          ..write('nodeId: $nodeId, ')
          ..write('resourceId: $resourceId, ')
          ..write('resourceType: $resourceType, ')
          ..write('title: $title, ')
          ..write('filePath: $filePath, ')
          ..write('fileSizeBytes: $fileSizeBytes, ')
          ..write('bytesDownloaded: $bytesDownloaded, ')
          ..write('downloadStatus: $downloadStatus, ')
          ..write('downloadSpeedBps: $downloadSpeedBps, ')
          ..write('progress: $progress, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('cid: $cid, ')
          ..write('peerCount: $peerCount, ')
          ..write('completedAt: $completedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FavoritesTable extends Favorites
    with TableInfo<$FavoritesTable, Favorite> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  static const VerificationMeta _lastSyncedAtMeta =
      const VerificationMeta('lastSyncedAt');
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
      'last_synced_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _isDirtyMeta =
      const VerificationMeta('isDirty');
  @override
  late final GeneratedColumn<bool> isDirty = GeneratedColumn<bool>(
      'is_dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_dirty" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _nodeIdMeta = const VerificationMeta('nodeId');
  @override
  late final GeneratedColumn<String> nodeId = GeneratedColumn<String>(
      'node_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _resourceIdMeta =
      const VerificationMeta('resourceId');
  @override
  late final GeneratedColumn<String> resourceId = GeneratedColumn<String>(
      'resource_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _resourceTypeMeta =
      const VerificationMeta('resourceType');
  @override
  late final GeneratedColumn<String> resourceType = GeneratedColumn<String>(
      'resource_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('book'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 500),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _authorsJsonMeta =
      const VerificationMeta('authorsJson');
  @override
  late final GeneratedColumn<String> authorsJson = GeneratedColumn<String>(
      'authors_json', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _coverPathMeta =
      const VerificationMeta('coverPath');
  @override
  late final GeneratedColumn<String> coverPath = GeneratedColumn<String>(
      'cover_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
      'category_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _addedAtMeta =
      const VerificationMeta('addedAt');
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
      'added_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        isDeleted,
        deletedAt,
        syncStatus,
        lastSyncedAt,
        remoteId,
        version,
        isDirty,
        nodeId,
        resourceId,
        resourceType,
        title,
        authorsJson,
        coverPath,
        categoryId,
        addedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorites';
  @override
  VerificationContext validateIntegrity(Insertable<Favorite> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
          _lastSyncedAtMeta,
          lastSyncedAt.isAcceptableOrUnknown(
              data['last_synced_at']!, _lastSyncedAtMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('is_dirty')) {
      context.handle(_isDirtyMeta,
          isDirty.isAcceptableOrUnknown(data['is_dirty']!, _isDirtyMeta));
    }
    if (data.containsKey('node_id')) {
      context.handle(_nodeIdMeta,
          nodeId.isAcceptableOrUnknown(data['node_id']!, _nodeIdMeta));
    }
    if (data.containsKey('resource_id')) {
      context.handle(
          _resourceIdMeta,
          resourceId.isAcceptableOrUnknown(
              data['resource_id']!, _resourceIdMeta));
    } else if (isInserting) {
      context.missing(_resourceIdMeta);
    }
    if (data.containsKey('resource_type')) {
      context.handle(
          _resourceTypeMeta,
          resourceType.isAcceptableOrUnknown(
              data['resource_type']!, _resourceTypeMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('authors_json')) {
      context.handle(
          _authorsJsonMeta,
          authorsJson.isAcceptableOrUnknown(
              data['authors_json']!, _authorsJsonMeta));
    }
    if (data.containsKey('cover_path')) {
      context.handle(_coverPathMeta,
          coverPath.isAcceptableOrUnknown(data['cover_path']!, _coverPathMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    }
    if (data.containsKey('added_at')) {
      context.handle(_addedAtMeta,
          addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Favorite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Favorite(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_synced_at']),
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      isDirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_dirty'])!,
      nodeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}node_id']),
      resourceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resource_id'])!,
      resourceType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resource_type'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      authorsJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}authors_json'])!,
      coverPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cover_path']),
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_id']),
      addedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}added_at'])!,
    );
  }

  @override
  $FavoritesTable createAlias(String alias) {
    return $FavoritesTable(attachedDatabase, alias);
  }
}

class Favorite extends DataClass implements Insertable<Favorite> {
  /// Unique Primary Key identifier (UUID string or unique content hash).
  final String id;

  /// Creation timestamp.
  final DateTime createdAt;

  /// Last modification timestamp.
  final DateTime updatedAt;

  /// Soft delete flag to prevent permanent data loss and facilitate sync deletions.
  final bool isDeleted;

  /// Timestamp when the record was soft-deleted.
  final DateTime? deletedAt;

  /// Current synchronization status ('synced', 'pending', 'conflict', 'local_only').
  final String syncStatus;

  /// Timestamp when the record was last synchronized with a remote or peer node.
  final DateTime? lastSyncedAt;

  /// Remote or global canonical identifier (e.g., global URI or CID).
  final String? remoteId;

  /// Monotonic version counter for conflict resolution.
  final int version;

  /// Indicates if the record has local uncommitted changes waiting for sync.
  final bool isDirty;

  /// Peer or node ID that originally created or last modified this record.
  final String? nodeId;

  /// Target resource identifier.
  final String resourceId;

  /// Resource type discriminator ('book', 'paper', 'dataset', 'note').
  final String resourceType;

  /// Resource title.
  final String title;

  /// JSON array of authors.
  final String authorsJson;

  /// Cover artwork path or URL.
  final String? coverPath;

  /// Category slug.
  final String? categoryId;

  /// Timestamp when added to user favorites.
  final DateTime addedAt;
  const Favorite(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.isDeleted,
      this.deletedAt,
      required this.syncStatus,
      this.lastSyncedAt,
      this.remoteId,
      required this.version,
      required this.isDirty,
      this.nodeId,
      required this.resourceId,
      required this.resourceType,
      required this.title,
      required this.authorsJson,
      this.coverPath,
      this.categoryId,
      required this.addedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || lastSyncedAt != null) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    }
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['version'] = Variable<int>(version);
    map['is_dirty'] = Variable<bool>(isDirty);
    if (!nullToAbsent || nodeId != null) {
      map['node_id'] = Variable<String>(nodeId);
    }
    map['resource_id'] = Variable<String>(resourceId);
    map['resource_type'] = Variable<String>(resourceType);
    map['title'] = Variable<String>(title);
    map['authors_json'] = Variable<String>(authorsJson);
    if (!nullToAbsent || coverPath != null) {
      map['cover_path'] = Variable<String>(coverPath);
    }
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<String>(categoryId);
    }
    map['added_at'] = Variable<DateTime>(addedAt);
    return map;
  }

  FavoritesCompanion toCompanion(bool nullToAbsent) {
    return FavoritesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      lastSyncedAt: lastSyncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncedAt),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      version: Value(version),
      isDirty: Value(isDirty),
      nodeId:
          nodeId == null && nullToAbsent ? const Value.absent() : Value(nodeId),
      resourceId: Value(resourceId),
      resourceType: Value(resourceType),
      title: Value(title),
      authorsJson: Value(authorsJson),
      coverPath: coverPath == null && nullToAbsent
          ? const Value.absent()
          : Value(coverPath),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      addedAt: Value(addedAt),
    );
  }

  factory Favorite.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Favorite(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      lastSyncedAt: serializer.fromJson<DateTime?>(json['lastSyncedAt']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      version: serializer.fromJson<int>(json['version']),
      isDirty: serializer.fromJson<bool>(json['isDirty']),
      nodeId: serializer.fromJson<String?>(json['nodeId']),
      resourceId: serializer.fromJson<String>(json['resourceId']),
      resourceType: serializer.fromJson<String>(json['resourceType']),
      title: serializer.fromJson<String>(json['title']),
      authorsJson: serializer.fromJson<String>(json['authorsJson']),
      coverPath: serializer.fromJson<String?>(json['coverPath']),
      categoryId: serializer.fromJson<String?>(json['categoryId']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'lastSyncedAt': serializer.toJson<DateTime?>(lastSyncedAt),
      'remoteId': serializer.toJson<String?>(remoteId),
      'version': serializer.toJson<int>(version),
      'isDirty': serializer.toJson<bool>(isDirty),
      'nodeId': serializer.toJson<String?>(nodeId),
      'resourceId': serializer.toJson<String>(resourceId),
      'resourceType': serializer.toJson<String>(resourceType),
      'title': serializer.toJson<String>(title),
      'authorsJson': serializer.toJson<String>(authorsJson),
      'coverPath': serializer.toJson<String?>(coverPath),
      'categoryId': serializer.toJson<String?>(categoryId),
      'addedAt': serializer.toJson<DateTime>(addedAt),
    };
  }

  Favorite copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? isDeleted,
          Value<DateTime?> deletedAt = const Value.absent(),
          String? syncStatus,
          Value<DateTime?> lastSyncedAt = const Value.absent(),
          Value<String?> remoteId = const Value.absent(),
          int? version,
          bool? isDirty,
          Value<String?> nodeId = const Value.absent(),
          String? resourceId,
          String? resourceType,
          String? title,
          String? authorsJson,
          Value<String?> coverPath = const Value.absent(),
          Value<String?> categoryId = const Value.absent(),
          DateTime? addedAt}) =>
      Favorite(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isDeleted: isDeleted ?? this.isDeleted,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        syncStatus: syncStatus ?? this.syncStatus,
        lastSyncedAt:
            lastSyncedAt.present ? lastSyncedAt.value : this.lastSyncedAt,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        version: version ?? this.version,
        isDirty: isDirty ?? this.isDirty,
        nodeId: nodeId.present ? nodeId.value : this.nodeId,
        resourceId: resourceId ?? this.resourceId,
        resourceType: resourceType ?? this.resourceType,
        title: title ?? this.title,
        authorsJson: authorsJson ?? this.authorsJson,
        coverPath: coverPath.present ? coverPath.value : this.coverPath,
        categoryId: categoryId.present ? categoryId.value : this.categoryId,
        addedAt: addedAt ?? this.addedAt,
      );
  Favorite copyWithCompanion(FavoritesCompanion data) {
    return Favorite(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      version: data.version.present ? data.version.value : this.version,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      nodeId: data.nodeId.present ? data.nodeId.value : this.nodeId,
      resourceId:
          data.resourceId.present ? data.resourceId.value : this.resourceId,
      resourceType: data.resourceType.present
          ? data.resourceType.value
          : this.resourceType,
      title: data.title.present ? data.title.value : this.title,
      authorsJson:
          data.authorsJson.present ? data.authorsJson.value : this.authorsJson,
      coverPath: data.coverPath.present ? data.coverPath.value : this.coverPath,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Favorite(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('version: $version, ')
          ..write('isDirty: $isDirty, ')
          ..write('nodeId: $nodeId, ')
          ..write('resourceId: $resourceId, ')
          ..write('resourceType: $resourceType, ')
          ..write('title: $title, ')
          ..write('authorsJson: $authorsJson, ')
          ..write('coverPath: $coverPath, ')
          ..write('categoryId: $categoryId, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      createdAt,
      updatedAt,
      isDeleted,
      deletedAt,
      syncStatus,
      lastSyncedAt,
      remoteId,
      version,
      isDirty,
      nodeId,
      resourceId,
      resourceType,
      title,
      authorsJson,
      coverPath,
      categoryId,
      addedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favorite &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.lastSyncedAt == this.lastSyncedAt &&
          other.remoteId == this.remoteId &&
          other.version == this.version &&
          other.isDirty == this.isDirty &&
          other.nodeId == this.nodeId &&
          other.resourceId == this.resourceId &&
          other.resourceType == this.resourceType &&
          other.title == this.title &&
          other.authorsJson == this.authorsJson &&
          other.coverPath == this.coverPath &&
          other.categoryId == this.categoryId &&
          other.addedAt == this.addedAt);
}

class FavoritesCompanion extends UpdateCompanion<Favorite> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<DateTime?> lastSyncedAt;
  final Value<String?> remoteId;
  final Value<int> version;
  final Value<bool> isDirty;
  final Value<String?> nodeId;
  final Value<String> resourceId;
  final Value<String> resourceType;
  final Value<String> title;
  final Value<String> authorsJson;
  final Value<String?> coverPath;
  final Value<String?> categoryId;
  final Value<DateTime> addedAt;
  final Value<int> rowid;
  const FavoritesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.version = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.nodeId = const Value.absent(),
    this.resourceId = const Value.absent(),
    this.resourceType = const Value.absent(),
    this.title = const Value.absent(),
    this.authorsJson = const Value.absent(),
    this.coverPath = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FavoritesCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.version = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.nodeId = const Value.absent(),
    required String resourceId,
    this.resourceType = const Value.absent(),
    required String title,
    this.authorsJson = const Value.absent(),
    this.coverPath = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        resourceId = Value(resourceId),
        title = Value(title);
  static Insertable<Favorite> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<DateTime>? lastSyncedAt,
    Expression<String>? remoteId,
    Expression<int>? version,
    Expression<bool>? isDirty,
    Expression<String>? nodeId,
    Expression<String>? resourceId,
    Expression<String>? resourceType,
    Expression<String>? title,
    Expression<String>? authorsJson,
    Expression<String>? coverPath,
    Expression<String>? categoryId,
    Expression<DateTime>? addedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (remoteId != null) 'remote_id': remoteId,
      if (version != null) 'version': version,
      if (isDirty != null) 'is_dirty': isDirty,
      if (nodeId != null) 'node_id': nodeId,
      if (resourceId != null) 'resource_id': resourceId,
      if (resourceType != null) 'resource_type': resourceType,
      if (title != null) 'title': title,
      if (authorsJson != null) 'authors_json': authorsJson,
      if (coverPath != null) 'cover_path': coverPath,
      if (categoryId != null) 'category_id': categoryId,
      if (addedAt != null) 'added_at': addedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FavoritesCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? isDeleted,
      Value<DateTime?>? deletedAt,
      Value<String>? syncStatus,
      Value<DateTime?>? lastSyncedAt,
      Value<String?>? remoteId,
      Value<int>? version,
      Value<bool>? isDirty,
      Value<String?>? nodeId,
      Value<String>? resourceId,
      Value<String>? resourceType,
      Value<String>? title,
      Value<String>? authorsJson,
      Value<String?>? coverPath,
      Value<String?>? categoryId,
      Value<DateTime>? addedAt,
      Value<int>? rowid}) {
    return FavoritesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      remoteId: remoteId ?? this.remoteId,
      version: version ?? this.version,
      isDirty: isDirty ?? this.isDirty,
      nodeId: nodeId ?? this.nodeId,
      resourceId: resourceId ?? this.resourceId,
      resourceType: resourceType ?? this.resourceType,
      title: title ?? this.title,
      authorsJson: authorsJson ?? this.authorsJson,
      coverPath: coverPath ?? this.coverPath,
      categoryId: categoryId ?? this.categoryId,
      addedAt: addedAt ?? this.addedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isDirty.present) {
      map['is_dirty'] = Variable<bool>(isDirty.value);
    }
    if (nodeId.present) {
      map['node_id'] = Variable<String>(nodeId.value);
    }
    if (resourceId.present) {
      map['resource_id'] = Variable<String>(resourceId.value);
    }
    if (resourceType.present) {
      map['resource_type'] = Variable<String>(resourceType.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (authorsJson.present) {
      map['authors_json'] = Variable<String>(authorsJson.value);
    }
    if (coverPath.present) {
      map['cover_path'] = Variable<String>(coverPath.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('version: $version, ')
          ..write('isDirty: $isDirty, ')
          ..write('nodeId: $nodeId, ')
          ..write('resourceId: $resourceId, ')
          ..write('resourceType: $resourceType, ')
          ..write('title: $title, ')
          ..write('authorsJson: $authorsJson, ')
          ..write('coverPath: $coverPath, ')
          ..write('categoryId: $categoryId, ')
          ..write('addedAt: $addedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReadingProgressTable extends ReadingProgress
    with TableInfo<$ReadingProgressTable, ReadingProgressData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReadingProgressTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  static const VerificationMeta _lastSyncedAtMeta =
      const VerificationMeta('lastSyncedAt');
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
      'last_synced_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _isDirtyMeta =
      const VerificationMeta('isDirty');
  @override
  late final GeneratedColumn<bool> isDirty = GeneratedColumn<bool>(
      'is_dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_dirty" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _nodeIdMeta = const VerificationMeta('nodeId');
  @override
  late final GeneratedColumn<String> nodeId = GeneratedColumn<String>(
      'node_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _resourceIdMeta =
      const VerificationMeta('resourceId');
  @override
  late final GeneratedColumn<String> resourceId = GeneratedColumn<String>(
      'resource_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _resourceTypeMeta =
      const VerificationMeta('resourceType');
  @override
  late final GeneratedColumn<String> resourceType = GeneratedColumn<String>(
      'resource_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('book'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 500),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _currentPageMeta =
      const VerificationMeta('currentPage');
  @override
  late final GeneratedColumn<int> currentPage = GeneratedColumn<int>(
      'current_page', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _totalPagesMeta =
      const VerificationMeta('totalPages');
  @override
  late final GeneratedColumn<int> totalPages = GeneratedColumn<int>(
      'total_pages', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _progressMeta =
      const VerificationMeta('progress');
  @override
  late final GeneratedColumn<double> progress = GeneratedColumn<double>(
      'progress', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _lastReadPositionMeta =
      const VerificationMeta('lastReadPosition');
  @override
  late final GeneratedColumn<String> lastReadPosition = GeneratedColumn<String>(
      'last_read_position', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _timeSpentSecondsMeta =
      const VerificationMeta('timeSpentSeconds');
  @override
  late final GeneratedColumn<int> timeSpentSeconds = GeneratedColumn<int>(
      'time_spent_seconds', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastReadAtMeta =
      const VerificationMeta('lastReadAt');
  @override
  late final GeneratedColumn<DateTime> lastReadAt = GeneratedColumn<DateTime>(
      'last_read_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        isDeleted,
        deletedAt,
        syncStatus,
        lastSyncedAt,
        remoteId,
        version,
        isDirty,
        nodeId,
        resourceId,
        resourceType,
        title,
        currentPage,
        totalPages,
        progress,
        lastReadPosition,
        timeSpentSeconds,
        lastReadAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reading_progress';
  @override
  VerificationContext validateIntegrity(
      Insertable<ReadingProgressData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
          _lastSyncedAtMeta,
          lastSyncedAt.isAcceptableOrUnknown(
              data['last_synced_at']!, _lastSyncedAtMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('is_dirty')) {
      context.handle(_isDirtyMeta,
          isDirty.isAcceptableOrUnknown(data['is_dirty']!, _isDirtyMeta));
    }
    if (data.containsKey('node_id')) {
      context.handle(_nodeIdMeta,
          nodeId.isAcceptableOrUnknown(data['node_id']!, _nodeIdMeta));
    }
    if (data.containsKey('resource_id')) {
      context.handle(
          _resourceIdMeta,
          resourceId.isAcceptableOrUnknown(
              data['resource_id']!, _resourceIdMeta));
    } else if (isInserting) {
      context.missing(_resourceIdMeta);
    }
    if (data.containsKey('resource_type')) {
      context.handle(
          _resourceTypeMeta,
          resourceType.isAcceptableOrUnknown(
              data['resource_type']!, _resourceTypeMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('current_page')) {
      context.handle(
          _currentPageMeta,
          currentPage.isAcceptableOrUnknown(
              data['current_page']!, _currentPageMeta));
    }
    if (data.containsKey('total_pages')) {
      context.handle(
          _totalPagesMeta,
          totalPages.isAcceptableOrUnknown(
              data['total_pages']!, _totalPagesMeta));
    }
    if (data.containsKey('progress')) {
      context.handle(_progressMeta,
          progress.isAcceptableOrUnknown(data['progress']!, _progressMeta));
    }
    if (data.containsKey('last_read_position')) {
      context.handle(
          _lastReadPositionMeta,
          lastReadPosition.isAcceptableOrUnknown(
              data['last_read_position']!, _lastReadPositionMeta));
    }
    if (data.containsKey('time_spent_seconds')) {
      context.handle(
          _timeSpentSecondsMeta,
          timeSpentSeconds.isAcceptableOrUnknown(
              data['time_spent_seconds']!, _timeSpentSecondsMeta));
    }
    if (data.containsKey('last_read_at')) {
      context.handle(
          _lastReadAtMeta,
          lastReadAt.isAcceptableOrUnknown(
              data['last_read_at']!, _lastReadAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReadingProgressData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReadingProgressData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_synced_at']),
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      isDirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_dirty'])!,
      nodeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}node_id']),
      resourceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resource_id'])!,
      resourceType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resource_type'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      currentPage: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_page'])!,
      totalPages: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_pages'])!,
      progress: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}progress'])!,
      lastReadPosition: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}last_read_position']),
      timeSpentSeconds: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}time_spent_seconds'])!,
      lastReadAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_read_at'])!,
    );
  }

  @override
  $ReadingProgressTable createAlias(String alias) {
    return $ReadingProgressTable(attachedDatabase, alias);
  }
}

class ReadingProgressData extends DataClass
    implements Insertable<ReadingProgressData> {
  /// Unique Primary Key identifier (UUID string or unique content hash).
  final String id;

  /// Creation timestamp.
  final DateTime createdAt;

  /// Last modification timestamp.
  final DateTime updatedAt;

  /// Soft delete flag to prevent permanent data loss and facilitate sync deletions.
  final bool isDeleted;

  /// Timestamp when the record was soft-deleted.
  final DateTime? deletedAt;

  /// Current synchronization status ('synced', 'pending', 'conflict', 'local_only').
  final String syncStatus;

  /// Timestamp when the record was last synchronized with a remote or peer node.
  final DateTime? lastSyncedAt;

  /// Remote or global canonical identifier (e.g., global URI or CID).
  final String? remoteId;

  /// Monotonic version counter for conflict resolution.
  final int version;

  /// Indicates if the record has local uncommitted changes waiting for sync.
  final bool isDirty;

  /// Peer or node ID that originally created or last modified this record.
  final String? nodeId;

  /// Target resource identifier.
  final String resourceId;

  /// Resource type discriminator ('book', 'paper', 'note').
  final String resourceType;

  /// Resource title for fast dashboard rendering without joins.
  final String title;

  /// Current page index (1-indexed).
  final int currentPage;

  /// Total page count.
  final int totalPages;

  /// Reading progress percentage as float (0.0 to 1.0).
  final double progress;

  /// Canonical location marker (EPUB CFI, PDF bookmark, or Markdown offset).
  final String? lastReadPosition;

  /// Cumulative reading time in seconds.
  final int timeSpentSeconds;

  /// Timestamp of the most recent reading session.
  final DateTime lastReadAt;
  const ReadingProgressData(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.isDeleted,
      this.deletedAt,
      required this.syncStatus,
      this.lastSyncedAt,
      this.remoteId,
      required this.version,
      required this.isDirty,
      this.nodeId,
      required this.resourceId,
      required this.resourceType,
      required this.title,
      required this.currentPage,
      required this.totalPages,
      required this.progress,
      this.lastReadPosition,
      required this.timeSpentSeconds,
      required this.lastReadAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || lastSyncedAt != null) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    }
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['version'] = Variable<int>(version);
    map['is_dirty'] = Variable<bool>(isDirty);
    if (!nullToAbsent || nodeId != null) {
      map['node_id'] = Variable<String>(nodeId);
    }
    map['resource_id'] = Variable<String>(resourceId);
    map['resource_type'] = Variable<String>(resourceType);
    map['title'] = Variable<String>(title);
    map['current_page'] = Variable<int>(currentPage);
    map['total_pages'] = Variable<int>(totalPages);
    map['progress'] = Variable<double>(progress);
    if (!nullToAbsent || lastReadPosition != null) {
      map['last_read_position'] = Variable<String>(lastReadPosition);
    }
    map['time_spent_seconds'] = Variable<int>(timeSpentSeconds);
    map['last_read_at'] = Variable<DateTime>(lastReadAt);
    return map;
  }

  ReadingProgressCompanion toCompanion(bool nullToAbsent) {
    return ReadingProgressCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      lastSyncedAt: lastSyncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncedAt),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      version: Value(version),
      isDirty: Value(isDirty),
      nodeId:
          nodeId == null && nullToAbsent ? const Value.absent() : Value(nodeId),
      resourceId: Value(resourceId),
      resourceType: Value(resourceType),
      title: Value(title),
      currentPage: Value(currentPage),
      totalPages: Value(totalPages),
      progress: Value(progress),
      lastReadPosition: lastReadPosition == null && nullToAbsent
          ? const Value.absent()
          : Value(lastReadPosition),
      timeSpentSeconds: Value(timeSpentSeconds),
      lastReadAt: Value(lastReadAt),
    );
  }

  factory ReadingProgressData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReadingProgressData(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      lastSyncedAt: serializer.fromJson<DateTime?>(json['lastSyncedAt']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      version: serializer.fromJson<int>(json['version']),
      isDirty: serializer.fromJson<bool>(json['isDirty']),
      nodeId: serializer.fromJson<String?>(json['nodeId']),
      resourceId: serializer.fromJson<String>(json['resourceId']),
      resourceType: serializer.fromJson<String>(json['resourceType']),
      title: serializer.fromJson<String>(json['title']),
      currentPage: serializer.fromJson<int>(json['currentPage']),
      totalPages: serializer.fromJson<int>(json['totalPages']),
      progress: serializer.fromJson<double>(json['progress']),
      lastReadPosition: serializer.fromJson<String?>(json['lastReadPosition']),
      timeSpentSeconds: serializer.fromJson<int>(json['timeSpentSeconds']),
      lastReadAt: serializer.fromJson<DateTime>(json['lastReadAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'lastSyncedAt': serializer.toJson<DateTime?>(lastSyncedAt),
      'remoteId': serializer.toJson<String?>(remoteId),
      'version': serializer.toJson<int>(version),
      'isDirty': serializer.toJson<bool>(isDirty),
      'nodeId': serializer.toJson<String?>(nodeId),
      'resourceId': serializer.toJson<String>(resourceId),
      'resourceType': serializer.toJson<String>(resourceType),
      'title': serializer.toJson<String>(title),
      'currentPage': serializer.toJson<int>(currentPage),
      'totalPages': serializer.toJson<int>(totalPages),
      'progress': serializer.toJson<double>(progress),
      'lastReadPosition': serializer.toJson<String?>(lastReadPosition),
      'timeSpentSeconds': serializer.toJson<int>(timeSpentSeconds),
      'lastReadAt': serializer.toJson<DateTime>(lastReadAt),
    };
  }

  ReadingProgressData copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? isDeleted,
          Value<DateTime?> deletedAt = const Value.absent(),
          String? syncStatus,
          Value<DateTime?> lastSyncedAt = const Value.absent(),
          Value<String?> remoteId = const Value.absent(),
          int? version,
          bool? isDirty,
          Value<String?> nodeId = const Value.absent(),
          String? resourceId,
          String? resourceType,
          String? title,
          int? currentPage,
          int? totalPages,
          double? progress,
          Value<String?> lastReadPosition = const Value.absent(),
          int? timeSpentSeconds,
          DateTime? lastReadAt}) =>
      ReadingProgressData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isDeleted: isDeleted ?? this.isDeleted,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        syncStatus: syncStatus ?? this.syncStatus,
        lastSyncedAt:
            lastSyncedAt.present ? lastSyncedAt.value : this.lastSyncedAt,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        version: version ?? this.version,
        isDirty: isDirty ?? this.isDirty,
        nodeId: nodeId.present ? nodeId.value : this.nodeId,
        resourceId: resourceId ?? this.resourceId,
        resourceType: resourceType ?? this.resourceType,
        title: title ?? this.title,
        currentPage: currentPage ?? this.currentPage,
        totalPages: totalPages ?? this.totalPages,
        progress: progress ?? this.progress,
        lastReadPosition: lastReadPosition.present
            ? lastReadPosition.value
            : this.lastReadPosition,
        timeSpentSeconds: timeSpentSeconds ?? this.timeSpentSeconds,
        lastReadAt: lastReadAt ?? this.lastReadAt,
      );
  ReadingProgressData copyWithCompanion(ReadingProgressCompanion data) {
    return ReadingProgressData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      version: data.version.present ? data.version.value : this.version,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      nodeId: data.nodeId.present ? data.nodeId.value : this.nodeId,
      resourceId:
          data.resourceId.present ? data.resourceId.value : this.resourceId,
      resourceType: data.resourceType.present
          ? data.resourceType.value
          : this.resourceType,
      title: data.title.present ? data.title.value : this.title,
      currentPage:
          data.currentPage.present ? data.currentPage.value : this.currentPage,
      totalPages:
          data.totalPages.present ? data.totalPages.value : this.totalPages,
      progress: data.progress.present ? data.progress.value : this.progress,
      lastReadPosition: data.lastReadPosition.present
          ? data.lastReadPosition.value
          : this.lastReadPosition,
      timeSpentSeconds: data.timeSpentSeconds.present
          ? data.timeSpentSeconds.value
          : this.timeSpentSeconds,
      lastReadAt:
          data.lastReadAt.present ? data.lastReadAt.value : this.lastReadAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReadingProgressData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('version: $version, ')
          ..write('isDirty: $isDirty, ')
          ..write('nodeId: $nodeId, ')
          ..write('resourceId: $resourceId, ')
          ..write('resourceType: $resourceType, ')
          ..write('title: $title, ')
          ..write('currentPage: $currentPage, ')
          ..write('totalPages: $totalPages, ')
          ..write('progress: $progress, ')
          ..write('lastReadPosition: $lastReadPosition, ')
          ..write('timeSpentSeconds: $timeSpentSeconds, ')
          ..write('lastReadAt: $lastReadAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      createdAt,
      updatedAt,
      isDeleted,
      deletedAt,
      syncStatus,
      lastSyncedAt,
      remoteId,
      version,
      isDirty,
      nodeId,
      resourceId,
      resourceType,
      title,
      currentPage,
      totalPages,
      progress,
      lastReadPosition,
      timeSpentSeconds,
      lastReadAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReadingProgressData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.lastSyncedAt == this.lastSyncedAt &&
          other.remoteId == this.remoteId &&
          other.version == this.version &&
          other.isDirty == this.isDirty &&
          other.nodeId == this.nodeId &&
          other.resourceId == this.resourceId &&
          other.resourceType == this.resourceType &&
          other.title == this.title &&
          other.currentPage == this.currentPage &&
          other.totalPages == this.totalPages &&
          other.progress == this.progress &&
          other.lastReadPosition == this.lastReadPosition &&
          other.timeSpentSeconds == this.timeSpentSeconds &&
          other.lastReadAt == this.lastReadAt);
}

class ReadingProgressCompanion extends UpdateCompanion<ReadingProgressData> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<DateTime?> lastSyncedAt;
  final Value<String?> remoteId;
  final Value<int> version;
  final Value<bool> isDirty;
  final Value<String?> nodeId;
  final Value<String> resourceId;
  final Value<String> resourceType;
  final Value<String> title;
  final Value<int> currentPage;
  final Value<int> totalPages;
  final Value<double> progress;
  final Value<String?> lastReadPosition;
  final Value<int> timeSpentSeconds;
  final Value<DateTime> lastReadAt;
  final Value<int> rowid;
  const ReadingProgressCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.version = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.nodeId = const Value.absent(),
    this.resourceId = const Value.absent(),
    this.resourceType = const Value.absent(),
    this.title = const Value.absent(),
    this.currentPage = const Value.absent(),
    this.totalPages = const Value.absent(),
    this.progress = const Value.absent(),
    this.lastReadPosition = const Value.absent(),
    this.timeSpentSeconds = const Value.absent(),
    this.lastReadAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReadingProgressCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.version = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.nodeId = const Value.absent(),
    required String resourceId,
    this.resourceType = const Value.absent(),
    required String title,
    this.currentPage = const Value.absent(),
    this.totalPages = const Value.absent(),
    this.progress = const Value.absent(),
    this.lastReadPosition = const Value.absent(),
    this.timeSpentSeconds = const Value.absent(),
    this.lastReadAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        resourceId = Value(resourceId),
        title = Value(title);
  static Insertable<ReadingProgressData> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<DateTime>? lastSyncedAt,
    Expression<String>? remoteId,
    Expression<int>? version,
    Expression<bool>? isDirty,
    Expression<String>? nodeId,
    Expression<String>? resourceId,
    Expression<String>? resourceType,
    Expression<String>? title,
    Expression<int>? currentPage,
    Expression<int>? totalPages,
    Expression<double>? progress,
    Expression<String>? lastReadPosition,
    Expression<int>? timeSpentSeconds,
    Expression<DateTime>? lastReadAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (remoteId != null) 'remote_id': remoteId,
      if (version != null) 'version': version,
      if (isDirty != null) 'is_dirty': isDirty,
      if (nodeId != null) 'node_id': nodeId,
      if (resourceId != null) 'resource_id': resourceId,
      if (resourceType != null) 'resource_type': resourceType,
      if (title != null) 'title': title,
      if (currentPage != null) 'current_page': currentPage,
      if (totalPages != null) 'total_pages': totalPages,
      if (progress != null) 'progress': progress,
      if (lastReadPosition != null) 'last_read_position': lastReadPosition,
      if (timeSpentSeconds != null) 'time_spent_seconds': timeSpentSeconds,
      if (lastReadAt != null) 'last_read_at': lastReadAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReadingProgressCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? isDeleted,
      Value<DateTime?>? deletedAt,
      Value<String>? syncStatus,
      Value<DateTime?>? lastSyncedAt,
      Value<String?>? remoteId,
      Value<int>? version,
      Value<bool>? isDirty,
      Value<String?>? nodeId,
      Value<String>? resourceId,
      Value<String>? resourceType,
      Value<String>? title,
      Value<int>? currentPage,
      Value<int>? totalPages,
      Value<double>? progress,
      Value<String?>? lastReadPosition,
      Value<int>? timeSpentSeconds,
      Value<DateTime>? lastReadAt,
      Value<int>? rowid}) {
    return ReadingProgressCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      remoteId: remoteId ?? this.remoteId,
      version: version ?? this.version,
      isDirty: isDirty ?? this.isDirty,
      nodeId: nodeId ?? this.nodeId,
      resourceId: resourceId ?? this.resourceId,
      resourceType: resourceType ?? this.resourceType,
      title: title ?? this.title,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      progress: progress ?? this.progress,
      lastReadPosition: lastReadPosition ?? this.lastReadPosition,
      timeSpentSeconds: timeSpentSeconds ?? this.timeSpentSeconds,
      lastReadAt: lastReadAt ?? this.lastReadAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isDirty.present) {
      map['is_dirty'] = Variable<bool>(isDirty.value);
    }
    if (nodeId.present) {
      map['node_id'] = Variable<String>(nodeId.value);
    }
    if (resourceId.present) {
      map['resource_id'] = Variable<String>(resourceId.value);
    }
    if (resourceType.present) {
      map['resource_type'] = Variable<String>(resourceType.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (currentPage.present) {
      map['current_page'] = Variable<int>(currentPage.value);
    }
    if (totalPages.present) {
      map['total_pages'] = Variable<int>(totalPages.value);
    }
    if (progress.present) {
      map['progress'] = Variable<double>(progress.value);
    }
    if (lastReadPosition.present) {
      map['last_read_position'] = Variable<String>(lastReadPosition.value);
    }
    if (timeSpentSeconds.present) {
      map['time_spent_seconds'] = Variable<int>(timeSpentSeconds.value);
    }
    if (lastReadAt.present) {
      map['last_read_at'] = Variable<DateTime>(lastReadAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReadingProgressCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('version: $version, ')
          ..write('isDirty: $isDirty, ')
          ..write('nodeId: $nodeId, ')
          ..write('resourceId: $resourceId, ')
          ..write('resourceType: $resourceType, ')
          ..write('title: $title, ')
          ..write('currentPage: $currentPage, ')
          ..write('totalPages: $totalPages, ')
          ..write('progress: $progress, ')
          ..write('lastReadPosition: $lastReadPosition, ')
          ..write('timeSpentSeconds: $timeSpentSeconds, ')
          ..write('lastReadAt: $lastReadAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  static const VerificationMeta _lastSyncedAtMeta =
      const VerificationMeta('lastSyncedAt');
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
      'last_synced_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _isDirtyMeta =
      const VerificationMeta('isDirty');
  @override
  late final GeneratedColumn<bool> isDirty = GeneratedColumn<bool>(
      'is_dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_dirty" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _nodeIdMeta = const VerificationMeta('nodeId');
  @override
  late final GeneratedColumn<String> nodeId = GeneratedColumn<String>(
      'node_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _slugMeta = const VerificationMeta('slug');
  @override
  late final GeneratedColumn<String> slug = GeneratedColumn<String>(
      'slug', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _iconNameMeta =
      const VerificationMeta('iconName');
  @override
  late final GeneratedColumn<String> iconName = GeneratedColumn<String>(
      'icon_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('category'));
  static const VerificationMeta _accentColorHexMeta =
      const VerificationMeta('accentColorHex');
  @override
  late final GeneratedColumn<String> accentColorHex = GeneratedColumn<String>(
      'accent_color_hex', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('#8B7DFF'));
  static const VerificationMeta _parentCategoryIdMeta =
      const VerificationMeta('parentCategoryId');
  @override
  late final GeneratedColumn<String> parentCategoryId = GeneratedColumn<String>(
      'parent_category_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _itemCountMeta =
      const VerificationMeta('itemCount');
  @override
  late final GeneratedColumn<int> itemCount = GeneratedColumn<int>(
      'item_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _displayOrderMeta =
      const VerificationMeta('displayOrder');
  @override
  late final GeneratedColumn<int> displayOrder = GeneratedColumn<int>(
      'display_order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        isDeleted,
        deletedAt,
        syncStatus,
        lastSyncedAt,
        remoteId,
        version,
        isDirty,
        nodeId,
        slug,
        name,
        description,
        iconName,
        accentColorHex,
        parentCategoryId,
        itemCount,
        displayOrder
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
          _lastSyncedAtMeta,
          lastSyncedAt.isAcceptableOrUnknown(
              data['last_synced_at']!, _lastSyncedAtMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('is_dirty')) {
      context.handle(_isDirtyMeta,
          isDirty.isAcceptableOrUnknown(data['is_dirty']!, _isDirtyMeta));
    }
    if (data.containsKey('node_id')) {
      context.handle(_nodeIdMeta,
          nodeId.isAcceptableOrUnknown(data['node_id']!, _nodeIdMeta));
    }
    if (data.containsKey('slug')) {
      context.handle(
          _slugMeta, slug.isAcceptableOrUnknown(data['slug']!, _slugMeta));
    } else if (isInserting) {
      context.missing(_slugMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('icon_name')) {
      context.handle(_iconNameMeta,
          iconName.isAcceptableOrUnknown(data['icon_name']!, _iconNameMeta));
    }
    if (data.containsKey('accent_color_hex')) {
      context.handle(
          _accentColorHexMeta,
          accentColorHex.isAcceptableOrUnknown(
              data['accent_color_hex']!, _accentColorHexMeta));
    }
    if (data.containsKey('parent_category_id')) {
      context.handle(
          _parentCategoryIdMeta,
          parentCategoryId.isAcceptableOrUnknown(
              data['parent_category_id']!, _parentCategoryIdMeta));
    }
    if (data.containsKey('item_count')) {
      context.handle(_itemCountMeta,
          itemCount.isAcceptableOrUnknown(data['item_count']!, _itemCountMeta));
    }
    if (data.containsKey('display_order')) {
      context.handle(
          _displayOrderMeta,
          displayOrder.isAcceptableOrUnknown(
              data['display_order']!, _displayOrderMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_synced_at']),
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      isDirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_dirty'])!,
      nodeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}node_id']),
      slug: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}slug'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      iconName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon_name'])!,
      accentColorHex: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}accent_color_hex'])!,
      parentCategoryId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}parent_category_id']),
      itemCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_count'])!,
      displayOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}display_order'])!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  /// Unique Primary Key identifier (UUID string or unique content hash).
  final String id;

  /// Creation timestamp.
  final DateTime createdAt;

  /// Last modification timestamp.
  final DateTime updatedAt;

  /// Soft delete flag to prevent permanent data loss and facilitate sync deletions.
  final bool isDeleted;

  /// Timestamp when the record was soft-deleted.
  final DateTime? deletedAt;

  /// Current synchronization status ('synced', 'pending', 'conflict', 'local_only').
  final String syncStatus;

  /// Timestamp when the record was last synchronized with a remote or peer node.
  final DateTime? lastSyncedAt;

  /// Remote or global canonical identifier (e.g., global URI or CID).
  final String? remoteId;

  /// Monotonic version counter for conflict resolution.
  final int version;

  /// Indicates if the record has local uncommitted changes waiting for sync.
  final bool isDirty;

  /// Peer or node ID that originally created or last modified this record.
  final String? nodeId;

  /// Category slug or unique code (e.g. 'cs', 'math', 'physics', 'bio').
  final String slug;

  /// Human-readable category title.
  final String name;

  /// Discipline description.
  final String? description;

  /// Canonical icon identifier mapping to AppIcons.
  final String iconName;

  /// Accent color hex string for category cards and glows.
  final String accentColorHex;

  /// Parent category ID for nested taxonomic hierarchies.
  final String? parentCategoryId;

  /// Number of indexed resources under this category.
  final int itemCount;

  /// Sort priority for UI display.
  final int displayOrder;
  const Category(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.isDeleted,
      this.deletedAt,
      required this.syncStatus,
      this.lastSyncedAt,
      this.remoteId,
      required this.version,
      required this.isDirty,
      this.nodeId,
      required this.slug,
      required this.name,
      this.description,
      required this.iconName,
      required this.accentColorHex,
      this.parentCategoryId,
      required this.itemCount,
      required this.displayOrder});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || lastSyncedAt != null) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    }
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['version'] = Variable<int>(version);
    map['is_dirty'] = Variable<bool>(isDirty);
    if (!nullToAbsent || nodeId != null) {
      map['node_id'] = Variable<String>(nodeId);
    }
    map['slug'] = Variable<String>(slug);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['icon_name'] = Variable<String>(iconName);
    map['accent_color_hex'] = Variable<String>(accentColorHex);
    if (!nullToAbsent || parentCategoryId != null) {
      map['parent_category_id'] = Variable<String>(parentCategoryId);
    }
    map['item_count'] = Variable<int>(itemCount);
    map['display_order'] = Variable<int>(displayOrder);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      lastSyncedAt: lastSyncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncedAt),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      version: Value(version),
      isDirty: Value(isDirty),
      nodeId:
          nodeId == null && nullToAbsent ? const Value.absent() : Value(nodeId),
      slug: Value(slug),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      iconName: Value(iconName),
      accentColorHex: Value(accentColorHex),
      parentCategoryId: parentCategoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentCategoryId),
      itemCount: Value(itemCount),
      displayOrder: Value(displayOrder),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      lastSyncedAt: serializer.fromJson<DateTime?>(json['lastSyncedAt']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      version: serializer.fromJson<int>(json['version']),
      isDirty: serializer.fromJson<bool>(json['isDirty']),
      nodeId: serializer.fromJson<String?>(json['nodeId']),
      slug: serializer.fromJson<String>(json['slug']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      iconName: serializer.fromJson<String>(json['iconName']),
      accentColorHex: serializer.fromJson<String>(json['accentColorHex']),
      parentCategoryId: serializer.fromJson<String?>(json['parentCategoryId']),
      itemCount: serializer.fromJson<int>(json['itemCount']),
      displayOrder: serializer.fromJson<int>(json['displayOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'lastSyncedAt': serializer.toJson<DateTime?>(lastSyncedAt),
      'remoteId': serializer.toJson<String?>(remoteId),
      'version': serializer.toJson<int>(version),
      'isDirty': serializer.toJson<bool>(isDirty),
      'nodeId': serializer.toJson<String?>(nodeId),
      'slug': serializer.toJson<String>(slug),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'iconName': serializer.toJson<String>(iconName),
      'accentColorHex': serializer.toJson<String>(accentColorHex),
      'parentCategoryId': serializer.toJson<String?>(parentCategoryId),
      'itemCount': serializer.toJson<int>(itemCount),
      'displayOrder': serializer.toJson<int>(displayOrder),
    };
  }

  Category copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? isDeleted,
          Value<DateTime?> deletedAt = const Value.absent(),
          String? syncStatus,
          Value<DateTime?> lastSyncedAt = const Value.absent(),
          Value<String?> remoteId = const Value.absent(),
          int? version,
          bool? isDirty,
          Value<String?> nodeId = const Value.absent(),
          String? slug,
          String? name,
          Value<String?> description = const Value.absent(),
          String? iconName,
          String? accentColorHex,
          Value<String?> parentCategoryId = const Value.absent(),
          int? itemCount,
          int? displayOrder}) =>
      Category(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isDeleted: isDeleted ?? this.isDeleted,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        syncStatus: syncStatus ?? this.syncStatus,
        lastSyncedAt:
            lastSyncedAt.present ? lastSyncedAt.value : this.lastSyncedAt,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        version: version ?? this.version,
        isDirty: isDirty ?? this.isDirty,
        nodeId: nodeId.present ? nodeId.value : this.nodeId,
        slug: slug ?? this.slug,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        iconName: iconName ?? this.iconName,
        accentColorHex: accentColorHex ?? this.accentColorHex,
        parentCategoryId: parentCategoryId.present
            ? parentCategoryId.value
            : this.parentCategoryId,
        itemCount: itemCount ?? this.itemCount,
        displayOrder: displayOrder ?? this.displayOrder,
      );
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      version: data.version.present ? data.version.value : this.version,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      nodeId: data.nodeId.present ? data.nodeId.value : this.nodeId,
      slug: data.slug.present ? data.slug.value : this.slug,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      iconName: data.iconName.present ? data.iconName.value : this.iconName,
      accentColorHex: data.accentColorHex.present
          ? data.accentColorHex.value
          : this.accentColorHex,
      parentCategoryId: data.parentCategoryId.present
          ? data.parentCategoryId.value
          : this.parentCategoryId,
      itemCount: data.itemCount.present ? data.itemCount.value : this.itemCount,
      displayOrder: data.displayOrder.present
          ? data.displayOrder.value
          : this.displayOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('version: $version, ')
          ..write('isDirty: $isDirty, ')
          ..write('nodeId: $nodeId, ')
          ..write('slug: $slug, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('iconName: $iconName, ')
          ..write('accentColorHex: $accentColorHex, ')
          ..write('parentCategoryId: $parentCategoryId, ')
          ..write('itemCount: $itemCount, ')
          ..write('displayOrder: $displayOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      createdAt,
      updatedAt,
      isDeleted,
      deletedAt,
      syncStatus,
      lastSyncedAt,
      remoteId,
      version,
      isDirty,
      nodeId,
      slug,
      name,
      description,
      iconName,
      accentColorHex,
      parentCategoryId,
      itemCount,
      displayOrder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.lastSyncedAt == this.lastSyncedAt &&
          other.remoteId == this.remoteId &&
          other.version == this.version &&
          other.isDirty == this.isDirty &&
          other.nodeId == this.nodeId &&
          other.slug == this.slug &&
          other.name == this.name &&
          other.description == this.description &&
          other.iconName == this.iconName &&
          other.accentColorHex == this.accentColorHex &&
          other.parentCategoryId == this.parentCategoryId &&
          other.itemCount == this.itemCount &&
          other.displayOrder == this.displayOrder);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<DateTime?> lastSyncedAt;
  final Value<String?> remoteId;
  final Value<int> version;
  final Value<bool> isDirty;
  final Value<String?> nodeId;
  final Value<String> slug;
  final Value<String> name;
  final Value<String?> description;
  final Value<String> iconName;
  final Value<String> accentColorHex;
  final Value<String?> parentCategoryId;
  final Value<int> itemCount;
  final Value<int> displayOrder;
  final Value<int> rowid;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.version = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.nodeId = const Value.absent(),
    this.slug = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.iconName = const Value.absent(),
    this.accentColorHex = const Value.absent(),
    this.parentCategoryId = const Value.absent(),
    this.itemCount = const Value.absent(),
    this.displayOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoriesCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.version = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.nodeId = const Value.absent(),
    required String slug,
    required String name,
    this.description = const Value.absent(),
    this.iconName = const Value.absent(),
    this.accentColorHex = const Value.absent(),
    this.parentCategoryId = const Value.absent(),
    this.itemCount = const Value.absent(),
    this.displayOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        slug = Value(slug),
        name = Value(name);
  static Insertable<Category> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<DateTime>? lastSyncedAt,
    Expression<String>? remoteId,
    Expression<int>? version,
    Expression<bool>? isDirty,
    Expression<String>? nodeId,
    Expression<String>? slug,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? iconName,
    Expression<String>? accentColorHex,
    Expression<String>? parentCategoryId,
    Expression<int>? itemCount,
    Expression<int>? displayOrder,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (remoteId != null) 'remote_id': remoteId,
      if (version != null) 'version': version,
      if (isDirty != null) 'is_dirty': isDirty,
      if (nodeId != null) 'node_id': nodeId,
      if (slug != null) 'slug': slug,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (iconName != null) 'icon_name': iconName,
      if (accentColorHex != null) 'accent_color_hex': accentColorHex,
      if (parentCategoryId != null) 'parent_category_id': parentCategoryId,
      if (itemCount != null) 'item_count': itemCount,
      if (displayOrder != null) 'display_order': displayOrder,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoriesCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? isDeleted,
      Value<DateTime?>? deletedAt,
      Value<String>? syncStatus,
      Value<DateTime?>? lastSyncedAt,
      Value<String?>? remoteId,
      Value<int>? version,
      Value<bool>? isDirty,
      Value<String?>? nodeId,
      Value<String>? slug,
      Value<String>? name,
      Value<String?>? description,
      Value<String>? iconName,
      Value<String>? accentColorHex,
      Value<String?>? parentCategoryId,
      Value<int>? itemCount,
      Value<int>? displayOrder,
      Value<int>? rowid}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      remoteId: remoteId ?? this.remoteId,
      version: version ?? this.version,
      isDirty: isDirty ?? this.isDirty,
      nodeId: nodeId ?? this.nodeId,
      slug: slug ?? this.slug,
      name: name ?? this.name,
      description: description ?? this.description,
      iconName: iconName ?? this.iconName,
      accentColorHex: accentColorHex ?? this.accentColorHex,
      parentCategoryId: parentCategoryId ?? this.parentCategoryId,
      itemCount: itemCount ?? this.itemCount,
      displayOrder: displayOrder ?? this.displayOrder,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isDirty.present) {
      map['is_dirty'] = Variable<bool>(isDirty.value);
    }
    if (nodeId.present) {
      map['node_id'] = Variable<String>(nodeId.value);
    }
    if (slug.present) {
      map['slug'] = Variable<String>(slug.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (iconName.present) {
      map['icon_name'] = Variable<String>(iconName.value);
    }
    if (accentColorHex.present) {
      map['accent_color_hex'] = Variable<String>(accentColorHex.value);
    }
    if (parentCategoryId.present) {
      map['parent_category_id'] = Variable<String>(parentCategoryId.value);
    }
    if (itemCount.present) {
      map['item_count'] = Variable<int>(itemCount.value);
    }
    if (displayOrder.present) {
      map['display_order'] = Variable<int>(displayOrder.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('version: $version, ')
          ..write('isDirty: $isDirty, ')
          ..write('nodeId: $nodeId, ')
          ..write('slug: $slug, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('iconName: $iconName, ')
          ..write('accentColorHex: $accentColorHex, ')
          ..write('parentCategoryId: $parentCategoryId, ')
          ..write('itemCount: $itemCount, ')
          ..write('displayOrder: $displayOrder, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AuthorsTable extends Authors with TableInfo<$AuthorsTable, Author> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuthorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  static const VerificationMeta _lastSyncedAtMeta =
      const VerificationMeta('lastSyncedAt');
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
      'last_synced_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _isDirtyMeta =
      const VerificationMeta('isDirty');
  @override
  late final GeneratedColumn<bool> isDirty = GeneratedColumn<bool>(
      'is_dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_dirty" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _nodeIdMeta = const VerificationMeta('nodeId');
  @override
  late final GeneratedColumn<String> nodeId = GeneratedColumn<String>(
      'node_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 300),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _orcidMeta = const VerificationMeta('orcid');
  @override
  late final GeneratedColumn<String> orcid = GeneratedColumn<String>(
      'orcid', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _institutionMeta =
      const VerificationMeta('institution');
  @override
  late final GeneratedColumn<String> institution = GeneratedColumn<String>(
      'institution', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _bioMeta = const VerificationMeta('bio');
  @override
  late final GeneratedColumn<String> bio = GeneratedColumn<String>(
      'bio', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _avatarUrlMeta =
      const VerificationMeta('avatarUrl');
  @override
  late final GeneratedColumn<String> avatarUrl = GeneratedColumn<String>(
      'avatar_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _publicationCountMeta =
      const VerificationMeta('publicationCount');
  @override
  late final GeneratedColumn<int> publicationCount = GeneratedColumn<int>(
      'publication_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _hIndexMeta = const VerificationMeta('hIndex');
  @override
  late final GeneratedColumn<int> hIndex = GeneratedColumn<int>(
      'h_index', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        isDeleted,
        deletedAt,
        syncStatus,
        lastSyncedAt,
        remoteId,
        version,
        isDirty,
        nodeId,
        name,
        orcid,
        institution,
        bio,
        avatarUrl,
        publicationCount,
        hIndex
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'authors';
  @override
  VerificationContext validateIntegrity(Insertable<Author> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
          _lastSyncedAtMeta,
          lastSyncedAt.isAcceptableOrUnknown(
              data['last_synced_at']!, _lastSyncedAtMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('is_dirty')) {
      context.handle(_isDirtyMeta,
          isDirty.isAcceptableOrUnknown(data['is_dirty']!, _isDirtyMeta));
    }
    if (data.containsKey('node_id')) {
      context.handle(_nodeIdMeta,
          nodeId.isAcceptableOrUnknown(data['node_id']!, _nodeIdMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('orcid')) {
      context.handle(
          _orcidMeta, orcid.isAcceptableOrUnknown(data['orcid']!, _orcidMeta));
    }
    if (data.containsKey('institution')) {
      context.handle(
          _institutionMeta,
          institution.isAcceptableOrUnknown(
              data['institution']!, _institutionMeta));
    }
    if (data.containsKey('bio')) {
      context.handle(
          _bioMeta, bio.isAcceptableOrUnknown(data['bio']!, _bioMeta));
    }
    if (data.containsKey('avatar_url')) {
      context.handle(_avatarUrlMeta,
          avatarUrl.isAcceptableOrUnknown(data['avatar_url']!, _avatarUrlMeta));
    }
    if (data.containsKey('publication_count')) {
      context.handle(
          _publicationCountMeta,
          publicationCount.isAcceptableOrUnknown(
              data['publication_count']!, _publicationCountMeta));
    }
    if (data.containsKey('h_index')) {
      context.handle(_hIndexMeta,
          hIndex.isAcceptableOrUnknown(data['h_index']!, _hIndexMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Author map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Author(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_synced_at']),
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      isDirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_dirty'])!,
      nodeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}node_id']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      orcid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}orcid']),
      institution: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}institution']),
      bio: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bio']),
      avatarUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}avatar_url']),
      publicationCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}publication_count'])!,
      hIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}h_index'])!,
    );
  }

  @override
  $AuthorsTable createAlias(String alias) {
    return $AuthorsTable(attachedDatabase, alias);
  }
}

class Author extends DataClass implements Insertable<Author> {
  /// Unique Primary Key identifier (UUID string or unique content hash).
  final String id;

  /// Creation timestamp.
  final DateTime createdAt;

  /// Last modification timestamp.
  final DateTime updatedAt;

  /// Soft delete flag to prevent permanent data loss and facilitate sync deletions.
  final bool isDeleted;

  /// Timestamp when the record was soft-deleted.
  final DateTime? deletedAt;

  /// Current synchronization status ('synced', 'pending', 'conflict', 'local_only').
  final String syncStatus;

  /// Timestamp when the record was last synchronized with a remote or peer node.
  final DateTime? lastSyncedAt;

  /// Remote or global canonical identifier (e.g., global URI or CID).
  final String? remoteId;

  /// Monotonic version counter for conflict resolution.
  final int version;

  /// Indicates if the record has local uncommitted changes waiting for sync.
  final bool isDirty;

  /// Peer or node ID that originally created or last modified this record.
  final String? nodeId;

  /// Full academic name.
  final String name;

  /// Open Researcher and Contributor ID (e.g. '0000-0002-1825-0097').
  final String? orcid;

  /// Primary academic institution, university, or lab affiliation.
  final String? institution;

  /// Researcher biography and field of study.
  final String? bio;

  /// Avatar image URL or local cached path.
  final String? avatarUrl;

  /// Total publications indexed in network.
  final int publicationCount;

  /// Author citation h-index metric.
  final int hIndex;
  const Author(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.isDeleted,
      this.deletedAt,
      required this.syncStatus,
      this.lastSyncedAt,
      this.remoteId,
      required this.version,
      required this.isDirty,
      this.nodeId,
      required this.name,
      this.orcid,
      this.institution,
      this.bio,
      this.avatarUrl,
      required this.publicationCount,
      required this.hIndex});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || lastSyncedAt != null) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    }
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['version'] = Variable<int>(version);
    map['is_dirty'] = Variable<bool>(isDirty);
    if (!nullToAbsent || nodeId != null) {
      map['node_id'] = Variable<String>(nodeId);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || orcid != null) {
      map['orcid'] = Variable<String>(orcid);
    }
    if (!nullToAbsent || institution != null) {
      map['institution'] = Variable<String>(institution);
    }
    if (!nullToAbsent || bio != null) {
      map['bio'] = Variable<String>(bio);
    }
    if (!nullToAbsent || avatarUrl != null) {
      map['avatar_url'] = Variable<String>(avatarUrl);
    }
    map['publication_count'] = Variable<int>(publicationCount);
    map['h_index'] = Variable<int>(hIndex);
    return map;
  }

  AuthorsCompanion toCompanion(bool nullToAbsent) {
    return AuthorsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      lastSyncedAt: lastSyncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncedAt),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      version: Value(version),
      isDirty: Value(isDirty),
      nodeId:
          nodeId == null && nullToAbsent ? const Value.absent() : Value(nodeId),
      name: Value(name),
      orcid:
          orcid == null && nullToAbsent ? const Value.absent() : Value(orcid),
      institution: institution == null && nullToAbsent
          ? const Value.absent()
          : Value(institution),
      bio: bio == null && nullToAbsent ? const Value.absent() : Value(bio),
      avatarUrl: avatarUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(avatarUrl),
      publicationCount: Value(publicationCount),
      hIndex: Value(hIndex),
    );
  }

  factory Author.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Author(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      lastSyncedAt: serializer.fromJson<DateTime?>(json['lastSyncedAt']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      version: serializer.fromJson<int>(json['version']),
      isDirty: serializer.fromJson<bool>(json['isDirty']),
      nodeId: serializer.fromJson<String?>(json['nodeId']),
      name: serializer.fromJson<String>(json['name']),
      orcid: serializer.fromJson<String?>(json['orcid']),
      institution: serializer.fromJson<String?>(json['institution']),
      bio: serializer.fromJson<String?>(json['bio']),
      avatarUrl: serializer.fromJson<String?>(json['avatarUrl']),
      publicationCount: serializer.fromJson<int>(json['publicationCount']),
      hIndex: serializer.fromJson<int>(json['hIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'lastSyncedAt': serializer.toJson<DateTime?>(lastSyncedAt),
      'remoteId': serializer.toJson<String?>(remoteId),
      'version': serializer.toJson<int>(version),
      'isDirty': serializer.toJson<bool>(isDirty),
      'nodeId': serializer.toJson<String?>(nodeId),
      'name': serializer.toJson<String>(name),
      'orcid': serializer.toJson<String?>(orcid),
      'institution': serializer.toJson<String?>(institution),
      'bio': serializer.toJson<String?>(bio),
      'avatarUrl': serializer.toJson<String?>(avatarUrl),
      'publicationCount': serializer.toJson<int>(publicationCount),
      'hIndex': serializer.toJson<int>(hIndex),
    };
  }

  Author copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? isDeleted,
          Value<DateTime?> deletedAt = const Value.absent(),
          String? syncStatus,
          Value<DateTime?> lastSyncedAt = const Value.absent(),
          Value<String?> remoteId = const Value.absent(),
          int? version,
          bool? isDirty,
          Value<String?> nodeId = const Value.absent(),
          String? name,
          Value<String?> orcid = const Value.absent(),
          Value<String?> institution = const Value.absent(),
          Value<String?> bio = const Value.absent(),
          Value<String?> avatarUrl = const Value.absent(),
          int? publicationCount,
          int? hIndex}) =>
      Author(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isDeleted: isDeleted ?? this.isDeleted,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        syncStatus: syncStatus ?? this.syncStatus,
        lastSyncedAt:
            lastSyncedAt.present ? lastSyncedAt.value : this.lastSyncedAt,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        version: version ?? this.version,
        isDirty: isDirty ?? this.isDirty,
        nodeId: nodeId.present ? nodeId.value : this.nodeId,
        name: name ?? this.name,
        orcid: orcid.present ? orcid.value : this.orcid,
        institution: institution.present ? institution.value : this.institution,
        bio: bio.present ? bio.value : this.bio,
        avatarUrl: avatarUrl.present ? avatarUrl.value : this.avatarUrl,
        publicationCount: publicationCount ?? this.publicationCount,
        hIndex: hIndex ?? this.hIndex,
      );
  Author copyWithCompanion(AuthorsCompanion data) {
    return Author(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      version: data.version.present ? data.version.value : this.version,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      nodeId: data.nodeId.present ? data.nodeId.value : this.nodeId,
      name: data.name.present ? data.name.value : this.name,
      orcid: data.orcid.present ? data.orcid.value : this.orcid,
      institution:
          data.institution.present ? data.institution.value : this.institution,
      bio: data.bio.present ? data.bio.value : this.bio,
      avatarUrl: data.avatarUrl.present ? data.avatarUrl.value : this.avatarUrl,
      publicationCount: data.publicationCount.present
          ? data.publicationCount.value
          : this.publicationCount,
      hIndex: data.hIndex.present ? data.hIndex.value : this.hIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Author(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('version: $version, ')
          ..write('isDirty: $isDirty, ')
          ..write('nodeId: $nodeId, ')
          ..write('name: $name, ')
          ..write('orcid: $orcid, ')
          ..write('institution: $institution, ')
          ..write('bio: $bio, ')
          ..write('avatarUrl: $avatarUrl, ')
          ..write('publicationCount: $publicationCount, ')
          ..write('hIndex: $hIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      createdAt,
      updatedAt,
      isDeleted,
      deletedAt,
      syncStatus,
      lastSyncedAt,
      remoteId,
      version,
      isDirty,
      nodeId,
      name,
      orcid,
      institution,
      bio,
      avatarUrl,
      publicationCount,
      hIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Author &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.lastSyncedAt == this.lastSyncedAt &&
          other.remoteId == this.remoteId &&
          other.version == this.version &&
          other.isDirty == this.isDirty &&
          other.nodeId == this.nodeId &&
          other.name == this.name &&
          other.orcid == this.orcid &&
          other.institution == this.institution &&
          other.bio == this.bio &&
          other.avatarUrl == this.avatarUrl &&
          other.publicationCount == this.publicationCount &&
          other.hIndex == this.hIndex);
}

class AuthorsCompanion extends UpdateCompanion<Author> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<DateTime?> lastSyncedAt;
  final Value<String?> remoteId;
  final Value<int> version;
  final Value<bool> isDirty;
  final Value<String?> nodeId;
  final Value<String> name;
  final Value<String?> orcid;
  final Value<String?> institution;
  final Value<String?> bio;
  final Value<String?> avatarUrl;
  final Value<int> publicationCount;
  final Value<int> hIndex;
  final Value<int> rowid;
  const AuthorsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.version = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.nodeId = const Value.absent(),
    this.name = const Value.absent(),
    this.orcid = const Value.absent(),
    this.institution = const Value.absent(),
    this.bio = const Value.absent(),
    this.avatarUrl = const Value.absent(),
    this.publicationCount = const Value.absent(),
    this.hIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AuthorsCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.version = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.nodeId = const Value.absent(),
    required String name,
    this.orcid = const Value.absent(),
    this.institution = const Value.absent(),
    this.bio = const Value.absent(),
    this.avatarUrl = const Value.absent(),
    this.publicationCount = const Value.absent(),
    this.hIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name);
  static Insertable<Author> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<DateTime>? lastSyncedAt,
    Expression<String>? remoteId,
    Expression<int>? version,
    Expression<bool>? isDirty,
    Expression<String>? nodeId,
    Expression<String>? name,
    Expression<String>? orcid,
    Expression<String>? institution,
    Expression<String>? bio,
    Expression<String>? avatarUrl,
    Expression<int>? publicationCount,
    Expression<int>? hIndex,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (remoteId != null) 'remote_id': remoteId,
      if (version != null) 'version': version,
      if (isDirty != null) 'is_dirty': isDirty,
      if (nodeId != null) 'node_id': nodeId,
      if (name != null) 'name': name,
      if (orcid != null) 'orcid': orcid,
      if (institution != null) 'institution': institution,
      if (bio != null) 'bio': bio,
      if (avatarUrl != null) 'avatar_url': avatarUrl,
      if (publicationCount != null) 'publication_count': publicationCount,
      if (hIndex != null) 'h_index': hIndex,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AuthorsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? isDeleted,
      Value<DateTime?>? deletedAt,
      Value<String>? syncStatus,
      Value<DateTime?>? lastSyncedAt,
      Value<String?>? remoteId,
      Value<int>? version,
      Value<bool>? isDirty,
      Value<String?>? nodeId,
      Value<String>? name,
      Value<String?>? orcid,
      Value<String?>? institution,
      Value<String?>? bio,
      Value<String?>? avatarUrl,
      Value<int>? publicationCount,
      Value<int>? hIndex,
      Value<int>? rowid}) {
    return AuthorsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      remoteId: remoteId ?? this.remoteId,
      version: version ?? this.version,
      isDirty: isDirty ?? this.isDirty,
      nodeId: nodeId ?? this.nodeId,
      name: name ?? this.name,
      orcid: orcid ?? this.orcid,
      institution: institution ?? this.institution,
      bio: bio ?? this.bio,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      publicationCount: publicationCount ?? this.publicationCount,
      hIndex: hIndex ?? this.hIndex,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isDirty.present) {
      map['is_dirty'] = Variable<bool>(isDirty.value);
    }
    if (nodeId.present) {
      map['node_id'] = Variable<String>(nodeId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (orcid.present) {
      map['orcid'] = Variable<String>(orcid.value);
    }
    if (institution.present) {
      map['institution'] = Variable<String>(institution.value);
    }
    if (bio.present) {
      map['bio'] = Variable<String>(bio.value);
    }
    if (avatarUrl.present) {
      map['avatar_url'] = Variable<String>(avatarUrl.value);
    }
    if (publicationCount.present) {
      map['publication_count'] = Variable<int>(publicationCount.value);
    }
    if (hIndex.present) {
      map['h_index'] = Variable<int>(hIndex.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuthorsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('version: $version, ')
          ..write('isDirty: $isDirty, ')
          ..write('nodeId: $nodeId, ')
          ..write('name: $name, ')
          ..write('orcid: $orcid, ')
          ..write('institution: $institution, ')
          ..write('bio: $bio, ')
          ..write('avatarUrl: $avatarUrl, ')
          ..write('publicationCount: $publicationCount, ')
          ..write('hIndex: $hIndex, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SearchHistoryTable extends SearchHistory
    with TableInfo<$SearchHistoryTable, SearchHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SearchHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  static const VerificationMeta _lastSyncedAtMeta =
      const VerificationMeta('lastSyncedAt');
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
      'last_synced_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _isDirtyMeta =
      const VerificationMeta('isDirty');
  @override
  late final GeneratedColumn<bool> isDirty = GeneratedColumn<bool>(
      'is_dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_dirty" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _nodeIdMeta = const VerificationMeta('nodeId');
  @override
  late final GeneratedColumn<String> nodeId = GeneratedColumn<String>(
      'node_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _queryMeta = const VerificationMeta('query');
  @override
  late final GeneratedColumn<String> query = GeneratedColumn<String>(
      'query', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 500),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _resultCountMeta =
      const VerificationMeta('resultCount');
  @override
  late final GeneratedColumn<int> resultCount = GeneratedColumn<int>(
      'result_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _filtersJsonMeta =
      const VerificationMeta('filtersJson');
  @override
  late final GeneratedColumn<String> filtersJson = GeneratedColumn<String>(
      'filters_json', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('{}'));
  static const VerificationMeta _searchedAtMeta =
      const VerificationMeta('searchedAt');
  @override
  late final GeneratedColumn<DateTime> searchedAt = GeneratedColumn<DateTime>(
      'searched_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        isDeleted,
        deletedAt,
        syncStatus,
        lastSyncedAt,
        remoteId,
        version,
        isDirty,
        nodeId,
        query,
        resultCount,
        filtersJson,
        searchedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'search_history';
  @override
  VerificationContext validateIntegrity(Insertable<SearchHistoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
          _lastSyncedAtMeta,
          lastSyncedAt.isAcceptableOrUnknown(
              data['last_synced_at']!, _lastSyncedAtMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('is_dirty')) {
      context.handle(_isDirtyMeta,
          isDirty.isAcceptableOrUnknown(data['is_dirty']!, _isDirtyMeta));
    }
    if (data.containsKey('node_id')) {
      context.handle(_nodeIdMeta,
          nodeId.isAcceptableOrUnknown(data['node_id']!, _nodeIdMeta));
    }
    if (data.containsKey('query')) {
      context.handle(
          _queryMeta, query.isAcceptableOrUnknown(data['query']!, _queryMeta));
    } else if (isInserting) {
      context.missing(_queryMeta);
    }
    if (data.containsKey('result_count')) {
      context.handle(
          _resultCountMeta,
          resultCount.isAcceptableOrUnknown(
              data['result_count']!, _resultCountMeta));
    }
    if (data.containsKey('filters_json')) {
      context.handle(
          _filtersJsonMeta,
          filtersJson.isAcceptableOrUnknown(
              data['filters_json']!, _filtersJsonMeta));
    }
    if (data.containsKey('searched_at')) {
      context.handle(
          _searchedAtMeta,
          searchedAt.isAcceptableOrUnknown(
              data['searched_at']!, _searchedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SearchHistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SearchHistoryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_synced_at']),
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      isDirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_dirty'])!,
      nodeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}node_id']),
      query: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}query'])!,
      resultCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}result_count'])!,
      filtersJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}filters_json'])!,
      searchedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}searched_at'])!,
    );
  }

  @override
  $SearchHistoryTable createAlias(String alias) {
    return $SearchHistoryTable(attachedDatabase, alias);
  }
}

class SearchHistoryData extends DataClass
    implements Insertable<SearchHistoryData> {
  /// Unique Primary Key identifier (UUID string or unique content hash).
  final String id;

  /// Creation timestamp.
  final DateTime createdAt;

  /// Last modification timestamp.
  final DateTime updatedAt;

  /// Soft delete flag to prevent permanent data loss and facilitate sync deletions.
  final bool isDeleted;

  /// Timestamp when the record was soft-deleted.
  final DateTime? deletedAt;

  /// Current synchronization status ('synced', 'pending', 'conflict', 'local_only').
  final String syncStatus;

  /// Timestamp when the record was last synchronized with a remote or peer node.
  final DateTime? lastSyncedAt;

  /// Remote or global canonical identifier (e.g., global URI or CID).
  final String? remoteId;

  /// Monotonic version counter for conflict resolution.
  final int version;

  /// Indicates if the record has local uncommitted changes waiting for sync.
  final bool isDirty;

  /// Peer or node ID that originally created or last modified this record.
  final String? nodeId;

  /// Query string entered by the user.
  final String query;

  /// Total matches returned for this query execution.
  final int resultCount;

  /// JSON-encoded filter parameters applied to this search.
  final String filtersJson;

  /// Timestamp when search was triggered.
  final DateTime searchedAt;
  const SearchHistoryData(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.isDeleted,
      this.deletedAt,
      required this.syncStatus,
      this.lastSyncedAt,
      this.remoteId,
      required this.version,
      required this.isDirty,
      this.nodeId,
      required this.query,
      required this.resultCount,
      required this.filtersJson,
      required this.searchedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || lastSyncedAt != null) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    }
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['version'] = Variable<int>(version);
    map['is_dirty'] = Variable<bool>(isDirty);
    if (!nullToAbsent || nodeId != null) {
      map['node_id'] = Variable<String>(nodeId);
    }
    map['query'] = Variable<String>(query);
    map['result_count'] = Variable<int>(resultCount);
    map['filters_json'] = Variable<String>(filtersJson);
    map['searched_at'] = Variable<DateTime>(searchedAt);
    return map;
  }

  SearchHistoryCompanion toCompanion(bool nullToAbsent) {
    return SearchHistoryCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      lastSyncedAt: lastSyncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncedAt),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      version: Value(version),
      isDirty: Value(isDirty),
      nodeId:
          nodeId == null && nullToAbsent ? const Value.absent() : Value(nodeId),
      query: Value(query),
      resultCount: Value(resultCount),
      filtersJson: Value(filtersJson),
      searchedAt: Value(searchedAt),
    );
  }

  factory SearchHistoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SearchHistoryData(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      lastSyncedAt: serializer.fromJson<DateTime?>(json['lastSyncedAt']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      version: serializer.fromJson<int>(json['version']),
      isDirty: serializer.fromJson<bool>(json['isDirty']),
      nodeId: serializer.fromJson<String?>(json['nodeId']),
      query: serializer.fromJson<String>(json['query']),
      resultCount: serializer.fromJson<int>(json['resultCount']),
      filtersJson: serializer.fromJson<String>(json['filtersJson']),
      searchedAt: serializer.fromJson<DateTime>(json['searchedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'lastSyncedAt': serializer.toJson<DateTime?>(lastSyncedAt),
      'remoteId': serializer.toJson<String?>(remoteId),
      'version': serializer.toJson<int>(version),
      'isDirty': serializer.toJson<bool>(isDirty),
      'nodeId': serializer.toJson<String?>(nodeId),
      'query': serializer.toJson<String>(query),
      'resultCount': serializer.toJson<int>(resultCount),
      'filtersJson': serializer.toJson<String>(filtersJson),
      'searchedAt': serializer.toJson<DateTime>(searchedAt),
    };
  }

  SearchHistoryData copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? isDeleted,
          Value<DateTime?> deletedAt = const Value.absent(),
          String? syncStatus,
          Value<DateTime?> lastSyncedAt = const Value.absent(),
          Value<String?> remoteId = const Value.absent(),
          int? version,
          bool? isDirty,
          Value<String?> nodeId = const Value.absent(),
          String? query,
          int? resultCount,
          String? filtersJson,
          DateTime? searchedAt}) =>
      SearchHistoryData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isDeleted: isDeleted ?? this.isDeleted,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        syncStatus: syncStatus ?? this.syncStatus,
        lastSyncedAt:
            lastSyncedAt.present ? lastSyncedAt.value : this.lastSyncedAt,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        version: version ?? this.version,
        isDirty: isDirty ?? this.isDirty,
        nodeId: nodeId.present ? nodeId.value : this.nodeId,
        query: query ?? this.query,
        resultCount: resultCount ?? this.resultCount,
        filtersJson: filtersJson ?? this.filtersJson,
        searchedAt: searchedAt ?? this.searchedAt,
      );
  SearchHistoryData copyWithCompanion(SearchHistoryCompanion data) {
    return SearchHistoryData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      version: data.version.present ? data.version.value : this.version,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      nodeId: data.nodeId.present ? data.nodeId.value : this.nodeId,
      query: data.query.present ? data.query.value : this.query,
      resultCount:
          data.resultCount.present ? data.resultCount.value : this.resultCount,
      filtersJson:
          data.filtersJson.present ? data.filtersJson.value : this.filtersJson,
      searchedAt:
          data.searchedAt.present ? data.searchedAt.value : this.searchedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SearchHistoryData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('version: $version, ')
          ..write('isDirty: $isDirty, ')
          ..write('nodeId: $nodeId, ')
          ..write('query: $query, ')
          ..write('resultCount: $resultCount, ')
          ..write('filtersJson: $filtersJson, ')
          ..write('searchedAt: $searchedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      createdAt,
      updatedAt,
      isDeleted,
      deletedAt,
      syncStatus,
      lastSyncedAt,
      remoteId,
      version,
      isDirty,
      nodeId,
      query,
      resultCount,
      filtersJson,
      searchedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchHistoryData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.lastSyncedAt == this.lastSyncedAt &&
          other.remoteId == this.remoteId &&
          other.version == this.version &&
          other.isDirty == this.isDirty &&
          other.nodeId == this.nodeId &&
          other.query == this.query &&
          other.resultCount == this.resultCount &&
          other.filtersJson == this.filtersJson &&
          other.searchedAt == this.searchedAt);
}

class SearchHistoryCompanion extends UpdateCompanion<SearchHistoryData> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<DateTime?> lastSyncedAt;
  final Value<String?> remoteId;
  final Value<int> version;
  final Value<bool> isDirty;
  final Value<String?> nodeId;
  final Value<String> query;
  final Value<int> resultCount;
  final Value<String> filtersJson;
  final Value<DateTime> searchedAt;
  final Value<int> rowid;
  const SearchHistoryCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.version = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.nodeId = const Value.absent(),
    this.query = const Value.absent(),
    this.resultCount = const Value.absent(),
    this.filtersJson = const Value.absent(),
    this.searchedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SearchHistoryCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.version = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.nodeId = const Value.absent(),
    required String query,
    this.resultCount = const Value.absent(),
    this.filtersJson = const Value.absent(),
    this.searchedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        query = Value(query);
  static Insertable<SearchHistoryData> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<DateTime>? lastSyncedAt,
    Expression<String>? remoteId,
    Expression<int>? version,
    Expression<bool>? isDirty,
    Expression<String>? nodeId,
    Expression<String>? query,
    Expression<int>? resultCount,
    Expression<String>? filtersJson,
    Expression<DateTime>? searchedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (remoteId != null) 'remote_id': remoteId,
      if (version != null) 'version': version,
      if (isDirty != null) 'is_dirty': isDirty,
      if (nodeId != null) 'node_id': nodeId,
      if (query != null) 'query': query,
      if (resultCount != null) 'result_count': resultCount,
      if (filtersJson != null) 'filters_json': filtersJson,
      if (searchedAt != null) 'searched_at': searchedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SearchHistoryCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? isDeleted,
      Value<DateTime?>? deletedAt,
      Value<String>? syncStatus,
      Value<DateTime?>? lastSyncedAt,
      Value<String?>? remoteId,
      Value<int>? version,
      Value<bool>? isDirty,
      Value<String?>? nodeId,
      Value<String>? query,
      Value<int>? resultCount,
      Value<String>? filtersJson,
      Value<DateTime>? searchedAt,
      Value<int>? rowid}) {
    return SearchHistoryCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      remoteId: remoteId ?? this.remoteId,
      version: version ?? this.version,
      isDirty: isDirty ?? this.isDirty,
      nodeId: nodeId ?? this.nodeId,
      query: query ?? this.query,
      resultCount: resultCount ?? this.resultCount,
      filtersJson: filtersJson ?? this.filtersJson,
      searchedAt: searchedAt ?? this.searchedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isDirty.present) {
      map['is_dirty'] = Variable<bool>(isDirty.value);
    }
    if (nodeId.present) {
      map['node_id'] = Variable<String>(nodeId.value);
    }
    if (query.present) {
      map['query'] = Variable<String>(query.value);
    }
    if (resultCount.present) {
      map['result_count'] = Variable<int>(resultCount.value);
    }
    if (filtersJson.present) {
      map['filters_json'] = Variable<String>(filtersJson.value);
    }
    if (searchedAt.present) {
      map['searched_at'] = Variable<DateTime>(searchedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SearchHistoryCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('version: $version, ')
          ..write('isDirty: $isDirty, ')
          ..write('nodeId: $nodeId, ')
          ..write('query: $query, ')
          ..write('resultCount: $resultCount, ')
          ..write('filtersJson: $filtersJson, ')
          ..write('searchedAt: $searchedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecentSearchesTable extends RecentSearches
    with TableInfo<$RecentSearchesTable, RecentSearche> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecentSearchesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  static const VerificationMeta _lastSyncedAtMeta =
      const VerificationMeta('lastSyncedAt');
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
      'last_synced_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _isDirtyMeta =
      const VerificationMeta('isDirty');
  @override
  late final GeneratedColumn<bool> isDirty = GeneratedColumn<bool>(
      'is_dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_dirty" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _nodeIdMeta = const VerificationMeta('nodeId');
  @override
  late final GeneratedColumn<String> nodeId = GeneratedColumn<String>(
      'node_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _termMeta = const VerificationMeta('term');
  @override
  late final GeneratedColumn<String> term = GeneratedColumn<String>(
      'term', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 300),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _hitCountMeta =
      const VerificationMeta('hitCount');
  @override
  late final GeneratedColumn<int> hitCount = GeneratedColumn<int>(
      'hit_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _lastQueriedAtMeta =
      const VerificationMeta('lastQueriedAt');
  @override
  late final GeneratedColumn<DateTime> lastQueriedAt =
      GeneratedColumn<DateTime>('last_queried_at', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        isDeleted,
        deletedAt,
        syncStatus,
        lastSyncedAt,
        remoteId,
        version,
        isDirty,
        nodeId,
        term,
        hitCount,
        lastQueriedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recent_searches';
  @override
  VerificationContext validateIntegrity(Insertable<RecentSearche> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
          _lastSyncedAtMeta,
          lastSyncedAt.isAcceptableOrUnknown(
              data['last_synced_at']!, _lastSyncedAtMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('is_dirty')) {
      context.handle(_isDirtyMeta,
          isDirty.isAcceptableOrUnknown(data['is_dirty']!, _isDirtyMeta));
    }
    if (data.containsKey('node_id')) {
      context.handle(_nodeIdMeta,
          nodeId.isAcceptableOrUnknown(data['node_id']!, _nodeIdMeta));
    }
    if (data.containsKey('term')) {
      context.handle(
          _termMeta, term.isAcceptableOrUnknown(data['term']!, _termMeta));
    } else if (isInserting) {
      context.missing(_termMeta);
    }
    if (data.containsKey('hit_count')) {
      context.handle(_hitCountMeta,
          hitCount.isAcceptableOrUnknown(data['hit_count']!, _hitCountMeta));
    }
    if (data.containsKey('last_queried_at')) {
      context.handle(
          _lastQueriedAtMeta,
          lastQueriedAt.isAcceptableOrUnknown(
              data['last_queried_at']!, _lastQueriedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecentSearche map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecentSearche(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_synced_at']),
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      isDirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_dirty'])!,
      nodeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}node_id']),
      term: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}term'])!,
      hitCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}hit_count'])!,
      lastQueriedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_queried_at'])!,
    );
  }

  @override
  $RecentSearchesTable createAlias(String alias) {
    return $RecentSearchesTable(attachedDatabase, alias);
  }
}

class RecentSearche extends DataClass implements Insertable<RecentSearche> {
  /// Unique Primary Key identifier (UUID string or unique content hash).
  final String id;

  /// Creation timestamp.
  final DateTime createdAt;

  /// Last modification timestamp.
  final DateTime updatedAt;

  /// Soft delete flag to prevent permanent data loss and facilitate sync deletions.
  final bool isDeleted;

  /// Timestamp when the record was soft-deleted.
  final DateTime? deletedAt;

  /// Current synchronization status ('synced', 'pending', 'conflict', 'local_only').
  final String syncStatus;

  /// Timestamp when the record was last synchronized with a remote or peer node.
  final DateTime? lastSyncedAt;

  /// Remote or global canonical identifier (e.g., global URI or CID).
  final String? remoteId;

  /// Monotonic version counter for conflict resolution.
  final int version;

  /// Indicates if the record has local uncommitted changes waiting for sync.
  final bool isDirty;

  /// Peer or node ID that originally created or last modified this record.
  final String? nodeId;

  /// Unique search term.
  final String term;

  /// Total count of times this term was queried.
  final int hitCount;

  /// Most recent query timestamp.
  final DateTime lastQueriedAt;
  const RecentSearche(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.isDeleted,
      this.deletedAt,
      required this.syncStatus,
      this.lastSyncedAt,
      this.remoteId,
      required this.version,
      required this.isDirty,
      this.nodeId,
      required this.term,
      required this.hitCount,
      required this.lastQueriedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || lastSyncedAt != null) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    }
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['version'] = Variable<int>(version);
    map['is_dirty'] = Variable<bool>(isDirty);
    if (!nullToAbsent || nodeId != null) {
      map['node_id'] = Variable<String>(nodeId);
    }
    map['term'] = Variable<String>(term);
    map['hit_count'] = Variable<int>(hitCount);
    map['last_queried_at'] = Variable<DateTime>(lastQueriedAt);
    return map;
  }

  RecentSearchesCompanion toCompanion(bool nullToAbsent) {
    return RecentSearchesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      lastSyncedAt: lastSyncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncedAt),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      version: Value(version),
      isDirty: Value(isDirty),
      nodeId:
          nodeId == null && nullToAbsent ? const Value.absent() : Value(nodeId),
      term: Value(term),
      hitCount: Value(hitCount),
      lastQueriedAt: Value(lastQueriedAt),
    );
  }

  factory RecentSearche.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecentSearche(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      lastSyncedAt: serializer.fromJson<DateTime?>(json['lastSyncedAt']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      version: serializer.fromJson<int>(json['version']),
      isDirty: serializer.fromJson<bool>(json['isDirty']),
      nodeId: serializer.fromJson<String?>(json['nodeId']),
      term: serializer.fromJson<String>(json['term']),
      hitCount: serializer.fromJson<int>(json['hitCount']),
      lastQueriedAt: serializer.fromJson<DateTime>(json['lastQueriedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'lastSyncedAt': serializer.toJson<DateTime?>(lastSyncedAt),
      'remoteId': serializer.toJson<String?>(remoteId),
      'version': serializer.toJson<int>(version),
      'isDirty': serializer.toJson<bool>(isDirty),
      'nodeId': serializer.toJson<String?>(nodeId),
      'term': serializer.toJson<String>(term),
      'hitCount': serializer.toJson<int>(hitCount),
      'lastQueriedAt': serializer.toJson<DateTime>(lastQueriedAt),
    };
  }

  RecentSearche copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? isDeleted,
          Value<DateTime?> deletedAt = const Value.absent(),
          String? syncStatus,
          Value<DateTime?> lastSyncedAt = const Value.absent(),
          Value<String?> remoteId = const Value.absent(),
          int? version,
          bool? isDirty,
          Value<String?> nodeId = const Value.absent(),
          String? term,
          int? hitCount,
          DateTime? lastQueriedAt}) =>
      RecentSearche(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isDeleted: isDeleted ?? this.isDeleted,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        syncStatus: syncStatus ?? this.syncStatus,
        lastSyncedAt:
            lastSyncedAt.present ? lastSyncedAt.value : this.lastSyncedAt,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        version: version ?? this.version,
        isDirty: isDirty ?? this.isDirty,
        nodeId: nodeId.present ? nodeId.value : this.nodeId,
        term: term ?? this.term,
        hitCount: hitCount ?? this.hitCount,
        lastQueriedAt: lastQueriedAt ?? this.lastQueriedAt,
      );
  RecentSearche copyWithCompanion(RecentSearchesCompanion data) {
    return RecentSearche(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      version: data.version.present ? data.version.value : this.version,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      nodeId: data.nodeId.present ? data.nodeId.value : this.nodeId,
      term: data.term.present ? data.term.value : this.term,
      hitCount: data.hitCount.present ? data.hitCount.value : this.hitCount,
      lastQueriedAt: data.lastQueriedAt.present
          ? data.lastQueriedAt.value
          : this.lastQueriedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecentSearche(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('version: $version, ')
          ..write('isDirty: $isDirty, ')
          ..write('nodeId: $nodeId, ')
          ..write('term: $term, ')
          ..write('hitCount: $hitCount, ')
          ..write('lastQueriedAt: $lastQueriedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      createdAt,
      updatedAt,
      isDeleted,
      deletedAt,
      syncStatus,
      lastSyncedAt,
      remoteId,
      version,
      isDirty,
      nodeId,
      term,
      hitCount,
      lastQueriedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecentSearche &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.lastSyncedAt == this.lastSyncedAt &&
          other.remoteId == this.remoteId &&
          other.version == this.version &&
          other.isDirty == this.isDirty &&
          other.nodeId == this.nodeId &&
          other.term == this.term &&
          other.hitCount == this.hitCount &&
          other.lastQueriedAt == this.lastQueriedAt);
}

class RecentSearchesCompanion extends UpdateCompanion<RecentSearche> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<DateTime?> lastSyncedAt;
  final Value<String?> remoteId;
  final Value<int> version;
  final Value<bool> isDirty;
  final Value<String?> nodeId;
  final Value<String> term;
  final Value<int> hitCount;
  final Value<DateTime> lastQueriedAt;
  final Value<int> rowid;
  const RecentSearchesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.version = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.nodeId = const Value.absent(),
    this.term = const Value.absent(),
    this.hitCount = const Value.absent(),
    this.lastQueriedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecentSearchesCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.version = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.nodeId = const Value.absent(),
    required String term,
    this.hitCount = const Value.absent(),
    this.lastQueriedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        term = Value(term);
  static Insertable<RecentSearche> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<DateTime>? lastSyncedAt,
    Expression<String>? remoteId,
    Expression<int>? version,
    Expression<bool>? isDirty,
    Expression<String>? nodeId,
    Expression<String>? term,
    Expression<int>? hitCount,
    Expression<DateTime>? lastQueriedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (remoteId != null) 'remote_id': remoteId,
      if (version != null) 'version': version,
      if (isDirty != null) 'is_dirty': isDirty,
      if (nodeId != null) 'node_id': nodeId,
      if (term != null) 'term': term,
      if (hitCount != null) 'hit_count': hitCount,
      if (lastQueriedAt != null) 'last_queried_at': lastQueriedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecentSearchesCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? isDeleted,
      Value<DateTime?>? deletedAt,
      Value<String>? syncStatus,
      Value<DateTime?>? lastSyncedAt,
      Value<String?>? remoteId,
      Value<int>? version,
      Value<bool>? isDirty,
      Value<String?>? nodeId,
      Value<String>? term,
      Value<int>? hitCount,
      Value<DateTime>? lastQueriedAt,
      Value<int>? rowid}) {
    return RecentSearchesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      remoteId: remoteId ?? this.remoteId,
      version: version ?? this.version,
      isDirty: isDirty ?? this.isDirty,
      nodeId: nodeId ?? this.nodeId,
      term: term ?? this.term,
      hitCount: hitCount ?? this.hitCount,
      lastQueriedAt: lastQueriedAt ?? this.lastQueriedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isDirty.present) {
      map['is_dirty'] = Variable<bool>(isDirty.value);
    }
    if (nodeId.present) {
      map['node_id'] = Variable<String>(nodeId.value);
    }
    if (term.present) {
      map['term'] = Variable<String>(term.value);
    }
    if (hitCount.present) {
      map['hit_count'] = Variable<int>(hitCount.value);
    }
    if (lastQueriedAt.present) {
      map['last_queried_at'] = Variable<DateTime>(lastQueriedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecentSearchesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('version: $version, ')
          ..write('isDirty: $isDirty, ')
          ..write('nodeId: $nodeId, ')
          ..write('term: $term, ')
          ..write('hitCount: $hitCount, ')
          ..write('lastQueriedAt: $lastQueriedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings with TableInfo<$SettingsTable, Setting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  static const VerificationMeta _lastSyncedAtMeta =
      const VerificationMeta('lastSyncedAt');
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
      'last_synced_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _isDirtyMeta =
      const VerificationMeta('isDirty');
  @override
  late final GeneratedColumn<bool> isDirty = GeneratedColumn<bool>(
      'is_dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_dirty" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _nodeIdMeta = const VerificationMeta('nodeId');
  @override
  late final GeneratedColumn<String> nodeId = GeneratedColumn<String>(
      'node_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 150),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('system'));
  static const VerificationMeta _isEncryptedMeta =
      const VerificationMeta('isEncrypted');
  @override
  late final GeneratedColumn<bool> isEncrypted = GeneratedColumn<bool>(
      'is_encrypted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_encrypted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        isDeleted,
        deletedAt,
        syncStatus,
        lastSyncedAt,
        remoteId,
        version,
        isDirty,
        nodeId,
        key,
        value,
        category,
        isEncrypted
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(Insertable<Setting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
          _lastSyncedAtMeta,
          lastSyncedAt.isAcceptableOrUnknown(
              data['last_synced_at']!, _lastSyncedAtMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('is_dirty')) {
      context.handle(_isDirtyMeta,
          isDirty.isAcceptableOrUnknown(data['is_dirty']!, _isDirtyMeta));
    }
    if (data.containsKey('node_id')) {
      context.handle(_nodeIdMeta,
          nodeId.isAcceptableOrUnknown(data['node_id']!, _nodeIdMeta));
    }
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('is_encrypted')) {
      context.handle(
          _isEncryptedMeta,
          isEncrypted.isAcceptableOrUnknown(
              data['is_encrypted']!, _isEncryptedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Setting(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_synced_at']),
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      isDirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_dirty'])!,
      nodeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}node_id']),
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      isEncrypted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_encrypted'])!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class Setting extends DataClass implements Insertable<Setting> {
  /// Unique Primary Key identifier (UUID string or unique content hash).
  final String id;

  /// Creation timestamp.
  final DateTime createdAt;

  /// Last modification timestamp.
  final DateTime updatedAt;

  /// Soft delete flag to prevent permanent data loss and facilitate sync deletions.
  final bool isDeleted;

  /// Timestamp when the record was soft-deleted.
  final DateTime? deletedAt;

  /// Current synchronization status ('synced', 'pending', 'conflict', 'local_only').
  final String syncStatus;

  /// Timestamp when the record was last synchronized with a remote or peer node.
  final DateTime? lastSyncedAt;

  /// Remote or global canonical identifier (e.g., global URI or CID).
  final String? remoteId;

  /// Monotonic version counter for conflict resolution.
  final int version;

  /// Indicates if the record has local uncommitted changes waiting for sync.
  final bool isDirty;

  /// Peer or node ID that originally created or last modified this record.
  final String? nodeId;

  /// Unique configuration parameter key (e.g., 'theme_mode', 'p2p_seeding_enabled').
  final String key;

  /// String or JSON-encoded configuration value.
  final String value;

  /// Category grouping ('appearance', 'storage', 'security', 'network', 'system').
  final String category;

  /// Whether the value is stored with AES-GCM encryption.
  final bool isEncrypted;
  const Setting(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.isDeleted,
      this.deletedAt,
      required this.syncStatus,
      this.lastSyncedAt,
      this.remoteId,
      required this.version,
      required this.isDirty,
      this.nodeId,
      required this.key,
      required this.value,
      required this.category,
      required this.isEncrypted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || lastSyncedAt != null) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    }
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['version'] = Variable<int>(version);
    map['is_dirty'] = Variable<bool>(isDirty);
    if (!nullToAbsent || nodeId != null) {
      map['node_id'] = Variable<String>(nodeId);
    }
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    map['category'] = Variable<String>(category);
    map['is_encrypted'] = Variable<bool>(isEncrypted);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      lastSyncedAt: lastSyncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncedAt),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      version: Value(version),
      isDirty: Value(isDirty),
      nodeId:
          nodeId == null && nullToAbsent ? const Value.absent() : Value(nodeId),
      key: Value(key),
      value: Value(value),
      category: Value(category),
      isEncrypted: Value(isEncrypted),
    );
  }

  factory Setting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Setting(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      lastSyncedAt: serializer.fromJson<DateTime?>(json['lastSyncedAt']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      version: serializer.fromJson<int>(json['version']),
      isDirty: serializer.fromJson<bool>(json['isDirty']),
      nodeId: serializer.fromJson<String?>(json['nodeId']),
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
      category: serializer.fromJson<String>(json['category']),
      isEncrypted: serializer.fromJson<bool>(json['isEncrypted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'lastSyncedAt': serializer.toJson<DateTime?>(lastSyncedAt),
      'remoteId': serializer.toJson<String?>(remoteId),
      'version': serializer.toJson<int>(version),
      'isDirty': serializer.toJson<bool>(isDirty),
      'nodeId': serializer.toJson<String?>(nodeId),
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
      'category': serializer.toJson<String>(category),
      'isEncrypted': serializer.toJson<bool>(isEncrypted),
    };
  }

  Setting copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? isDeleted,
          Value<DateTime?> deletedAt = const Value.absent(),
          String? syncStatus,
          Value<DateTime?> lastSyncedAt = const Value.absent(),
          Value<String?> remoteId = const Value.absent(),
          int? version,
          bool? isDirty,
          Value<String?> nodeId = const Value.absent(),
          String? key,
          String? value,
          String? category,
          bool? isEncrypted}) =>
      Setting(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isDeleted: isDeleted ?? this.isDeleted,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        syncStatus: syncStatus ?? this.syncStatus,
        lastSyncedAt:
            lastSyncedAt.present ? lastSyncedAt.value : this.lastSyncedAt,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        version: version ?? this.version,
        isDirty: isDirty ?? this.isDirty,
        nodeId: nodeId.present ? nodeId.value : this.nodeId,
        key: key ?? this.key,
        value: value ?? this.value,
        category: category ?? this.category,
        isEncrypted: isEncrypted ?? this.isEncrypted,
      );
  Setting copyWithCompanion(SettingsCompanion data) {
    return Setting(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      version: data.version.present ? data.version.value : this.version,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      nodeId: data.nodeId.present ? data.nodeId.value : this.nodeId,
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      category: data.category.present ? data.category.value : this.category,
      isEncrypted:
          data.isEncrypted.present ? data.isEncrypted.value : this.isEncrypted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('version: $version, ')
          ..write('isDirty: $isDirty, ')
          ..write('nodeId: $nodeId, ')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('category: $category, ')
          ..write('isEncrypted: $isEncrypted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      createdAt,
      updatedAt,
      isDeleted,
      deletedAt,
      syncStatus,
      lastSyncedAt,
      remoteId,
      version,
      isDirty,
      nodeId,
      key,
      value,
      category,
      isEncrypted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.lastSyncedAt == this.lastSyncedAt &&
          other.remoteId == this.remoteId &&
          other.version == this.version &&
          other.isDirty == this.isDirty &&
          other.nodeId == this.nodeId &&
          other.key == this.key &&
          other.value == this.value &&
          other.category == this.category &&
          other.isEncrypted == this.isEncrypted);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<DateTime?> lastSyncedAt;
  final Value<String?> remoteId;
  final Value<int> version;
  final Value<bool> isDirty;
  final Value<String?> nodeId;
  final Value<String> key;
  final Value<String> value;
  final Value<String> category;
  final Value<bool> isEncrypted;
  final Value<int> rowid;
  const SettingsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.version = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.nodeId = const Value.absent(),
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.category = const Value.absent(),
    this.isEncrypted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SettingsCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.version = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.nodeId = const Value.absent(),
    required String key,
    required String value,
    this.category = const Value.absent(),
    this.isEncrypted = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        key = Value(key),
        value = Value(value);
  static Insertable<Setting> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<DateTime>? lastSyncedAt,
    Expression<String>? remoteId,
    Expression<int>? version,
    Expression<bool>? isDirty,
    Expression<String>? nodeId,
    Expression<String>? key,
    Expression<String>? value,
    Expression<String>? category,
    Expression<bool>? isEncrypted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (remoteId != null) 'remote_id': remoteId,
      if (version != null) 'version': version,
      if (isDirty != null) 'is_dirty': isDirty,
      if (nodeId != null) 'node_id': nodeId,
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (category != null) 'category': category,
      if (isEncrypted != null) 'is_encrypted': isEncrypted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SettingsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? isDeleted,
      Value<DateTime?>? deletedAt,
      Value<String>? syncStatus,
      Value<DateTime?>? lastSyncedAt,
      Value<String?>? remoteId,
      Value<int>? version,
      Value<bool>? isDirty,
      Value<String?>? nodeId,
      Value<String>? key,
      Value<String>? value,
      Value<String>? category,
      Value<bool>? isEncrypted,
      Value<int>? rowid}) {
    return SettingsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      remoteId: remoteId ?? this.remoteId,
      version: version ?? this.version,
      isDirty: isDirty ?? this.isDirty,
      nodeId: nodeId ?? this.nodeId,
      key: key ?? this.key,
      value: value ?? this.value,
      category: category ?? this.category,
      isEncrypted: isEncrypted ?? this.isEncrypted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isDirty.present) {
      map['is_dirty'] = Variable<bool>(isDirty.value);
    }
    if (nodeId.present) {
      map['node_id'] = Variable<String>(nodeId.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (isEncrypted.present) {
      map['is_encrypted'] = Variable<bool>(isEncrypted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('version: $version, ')
          ..write('isDirty: $isDirty, ')
          ..write('nodeId: $nodeId, ')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('category: $category, ')
          ..write('isEncrypted: $isEncrypted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CacheMetadataTable extends CacheMetadata
    with TableInfo<$CacheMetadataTable, CacheMetadataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CacheMetadataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  static const VerificationMeta _lastSyncedAtMeta =
      const VerificationMeta('lastSyncedAt');
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
      'last_synced_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _isDirtyMeta =
      const VerificationMeta('isDirty');
  @override
  late final GeneratedColumn<bool> isDirty = GeneratedColumn<bool>(
      'is_dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_dirty" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _nodeIdMeta = const VerificationMeta('nodeId');
  @override
  late final GeneratedColumn<String> nodeId = GeneratedColumn<String>(
      'node_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _cacheKeyMeta =
      const VerificationMeta('cacheKey');
  @override
  late final GeneratedColumn<String> cacheKey = GeneratedColumn<String>(
      'cache_key', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 500),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _contentTypeMeta =
      const VerificationMeta('contentType');
  @override
  late final GeneratedColumn<String> contentType = GeneratedColumn<String>(
      'content_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('application/octet-stream'));
  static const VerificationMeta _sizeBytesMeta =
      const VerificationMeta('sizeBytes');
  @override
  late final GeneratedColumn<int> sizeBytes = GeneratedColumn<int>(
      'size_bytes', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _eTagMeta = const VerificationMeta('eTag');
  @override
  late final GeneratedColumn<String> eTag = GeneratedColumn<String>(
      'e_tag', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _expiresAtMeta =
      const VerificationMeta('expiresAt');
  @override
  late final GeneratedColumn<DateTime> expiresAt = GeneratedColumn<DateTime>(
      'expires_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastAccessedAtMeta =
      const VerificationMeta('lastAccessedAt');
  @override
  late final GeneratedColumn<DateTime> lastAccessedAt =
      GeneratedColumn<DateTime>('last_accessed_at', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: currentDateAndTime);
  static const VerificationMeta _accessCountMeta =
      const VerificationMeta('accessCount');
  @override
  late final GeneratedColumn<int> accessCount = GeneratedColumn<int>(
      'access_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _localFilePathMeta =
      const VerificationMeta('localFilePath');
  @override
  late final GeneratedColumn<String> localFilePath = GeneratedColumn<String>(
      'local_file_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        isDeleted,
        deletedAt,
        syncStatus,
        lastSyncedAt,
        remoteId,
        version,
        isDirty,
        nodeId,
        cacheKey,
        contentType,
        sizeBytes,
        eTag,
        expiresAt,
        lastAccessedAt,
        accessCount,
        localFilePath
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cache_metadata';
  @override
  VerificationContext validateIntegrity(Insertable<CacheMetadataData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
          _lastSyncedAtMeta,
          lastSyncedAt.isAcceptableOrUnknown(
              data['last_synced_at']!, _lastSyncedAtMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('is_dirty')) {
      context.handle(_isDirtyMeta,
          isDirty.isAcceptableOrUnknown(data['is_dirty']!, _isDirtyMeta));
    }
    if (data.containsKey('node_id')) {
      context.handle(_nodeIdMeta,
          nodeId.isAcceptableOrUnknown(data['node_id']!, _nodeIdMeta));
    }
    if (data.containsKey('cache_key')) {
      context.handle(_cacheKeyMeta,
          cacheKey.isAcceptableOrUnknown(data['cache_key']!, _cacheKeyMeta));
    } else if (isInserting) {
      context.missing(_cacheKeyMeta);
    }
    if (data.containsKey('content_type')) {
      context.handle(
          _contentTypeMeta,
          contentType.isAcceptableOrUnknown(
              data['content_type']!, _contentTypeMeta));
    }
    if (data.containsKey('size_bytes')) {
      context.handle(_sizeBytesMeta,
          sizeBytes.isAcceptableOrUnknown(data['size_bytes']!, _sizeBytesMeta));
    }
    if (data.containsKey('e_tag')) {
      context.handle(
          _eTagMeta, eTag.isAcceptableOrUnknown(data['e_tag']!, _eTagMeta));
    }
    if (data.containsKey('expires_at')) {
      context.handle(_expiresAtMeta,
          expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta));
    }
    if (data.containsKey('last_accessed_at')) {
      context.handle(
          _lastAccessedAtMeta,
          lastAccessedAt.isAcceptableOrUnknown(
              data['last_accessed_at']!, _lastAccessedAtMeta));
    }
    if (data.containsKey('access_count')) {
      context.handle(
          _accessCountMeta,
          accessCount.isAcceptableOrUnknown(
              data['access_count']!, _accessCountMeta));
    }
    if (data.containsKey('local_file_path')) {
      context.handle(
          _localFilePathMeta,
          localFilePath.isAcceptableOrUnknown(
              data['local_file_path']!, _localFilePathMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CacheMetadataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CacheMetadataData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_synced_at']),
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      isDirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_dirty'])!,
      nodeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}node_id']),
      cacheKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cache_key'])!,
      contentType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content_type'])!,
      sizeBytes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}size_bytes'])!,
      eTag: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}e_tag']),
      expiresAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}expires_at']),
      lastAccessedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_accessed_at'])!,
      accessCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}access_count'])!,
      localFilePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}local_file_path']),
    );
  }

  @override
  $CacheMetadataTable createAlias(String alias) {
    return $CacheMetadataTable(attachedDatabase, alias);
  }
}

class CacheMetadataData extends DataClass
    implements Insertable<CacheMetadataData> {
  /// Unique Primary Key identifier (UUID string or unique content hash).
  final String id;

  /// Creation timestamp.
  final DateTime createdAt;

  /// Last modification timestamp.
  final DateTime updatedAt;

  /// Soft delete flag to prevent permanent data loss and facilitate sync deletions.
  final bool isDeleted;

  /// Timestamp when the record was soft-deleted.
  final DateTime? deletedAt;

  /// Current synchronization status ('synced', 'pending', 'conflict', 'local_only').
  final String syncStatus;

  /// Timestamp when the record was last synchronized with a remote or peer node.
  final DateTime? lastSyncedAt;

  /// Remote or global canonical identifier (e.g., global URI or CID).
  final String? remoteId;

  /// Monotonic version counter for conflict resolution.
  final int version;

  /// Indicates if the record has local uncommitted changes waiting for sync.
  final bool isDirty;

  /// Peer or node ID that originally created or last modified this record.
  final String? nodeId;

  /// Unique cache identification key (e.g., URL or CID hash).
  final String cacheKey;

  /// MIME content type ('application/pdf', 'application/json', 'image/png').
  final String contentType;

  /// Cached payload size in bytes.
  final int sizeBytes;

  /// HTTP ETag or IPFS hash for conditional validation.
  final String? eTag;

  /// Expiration timestamp for time-to-live (TTL) eviction.
  final DateTime? expiresAt;

  /// Timestamp when cache entry was last read.
  final DateTime lastAccessedAt;

  /// Frequency counter for LRU eviction policy.
  final int accessCount;

  /// Disk path if payload is stored outside SQLite.
  final String? localFilePath;
  const CacheMetadataData(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.isDeleted,
      this.deletedAt,
      required this.syncStatus,
      this.lastSyncedAt,
      this.remoteId,
      required this.version,
      required this.isDirty,
      this.nodeId,
      required this.cacheKey,
      required this.contentType,
      required this.sizeBytes,
      this.eTag,
      this.expiresAt,
      required this.lastAccessedAt,
      required this.accessCount,
      this.localFilePath});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || lastSyncedAt != null) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    }
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['version'] = Variable<int>(version);
    map['is_dirty'] = Variable<bool>(isDirty);
    if (!nullToAbsent || nodeId != null) {
      map['node_id'] = Variable<String>(nodeId);
    }
    map['cache_key'] = Variable<String>(cacheKey);
    map['content_type'] = Variable<String>(contentType);
    map['size_bytes'] = Variable<int>(sizeBytes);
    if (!nullToAbsent || eTag != null) {
      map['e_tag'] = Variable<String>(eTag);
    }
    if (!nullToAbsent || expiresAt != null) {
      map['expires_at'] = Variable<DateTime>(expiresAt);
    }
    map['last_accessed_at'] = Variable<DateTime>(lastAccessedAt);
    map['access_count'] = Variable<int>(accessCount);
    if (!nullToAbsent || localFilePath != null) {
      map['local_file_path'] = Variable<String>(localFilePath);
    }
    return map;
  }

  CacheMetadataCompanion toCompanion(bool nullToAbsent) {
    return CacheMetadataCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      lastSyncedAt: lastSyncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncedAt),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      version: Value(version),
      isDirty: Value(isDirty),
      nodeId:
          nodeId == null && nullToAbsent ? const Value.absent() : Value(nodeId),
      cacheKey: Value(cacheKey),
      contentType: Value(contentType),
      sizeBytes: Value(sizeBytes),
      eTag: eTag == null && nullToAbsent ? const Value.absent() : Value(eTag),
      expiresAt: expiresAt == null && nullToAbsent
          ? const Value.absent()
          : Value(expiresAt),
      lastAccessedAt: Value(lastAccessedAt),
      accessCount: Value(accessCount),
      localFilePath: localFilePath == null && nullToAbsent
          ? const Value.absent()
          : Value(localFilePath),
    );
  }

  factory CacheMetadataData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CacheMetadataData(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      lastSyncedAt: serializer.fromJson<DateTime?>(json['lastSyncedAt']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      version: serializer.fromJson<int>(json['version']),
      isDirty: serializer.fromJson<bool>(json['isDirty']),
      nodeId: serializer.fromJson<String?>(json['nodeId']),
      cacheKey: serializer.fromJson<String>(json['cacheKey']),
      contentType: serializer.fromJson<String>(json['contentType']),
      sizeBytes: serializer.fromJson<int>(json['sizeBytes']),
      eTag: serializer.fromJson<String?>(json['eTag']),
      expiresAt: serializer.fromJson<DateTime?>(json['expiresAt']),
      lastAccessedAt: serializer.fromJson<DateTime>(json['lastAccessedAt']),
      accessCount: serializer.fromJson<int>(json['accessCount']),
      localFilePath: serializer.fromJson<String?>(json['localFilePath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'lastSyncedAt': serializer.toJson<DateTime?>(lastSyncedAt),
      'remoteId': serializer.toJson<String?>(remoteId),
      'version': serializer.toJson<int>(version),
      'isDirty': serializer.toJson<bool>(isDirty),
      'nodeId': serializer.toJson<String?>(nodeId),
      'cacheKey': serializer.toJson<String>(cacheKey),
      'contentType': serializer.toJson<String>(contentType),
      'sizeBytes': serializer.toJson<int>(sizeBytes),
      'eTag': serializer.toJson<String?>(eTag),
      'expiresAt': serializer.toJson<DateTime?>(expiresAt),
      'lastAccessedAt': serializer.toJson<DateTime>(lastAccessedAt),
      'accessCount': serializer.toJson<int>(accessCount),
      'localFilePath': serializer.toJson<String?>(localFilePath),
    };
  }

  CacheMetadataData copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? isDeleted,
          Value<DateTime?> deletedAt = const Value.absent(),
          String? syncStatus,
          Value<DateTime?> lastSyncedAt = const Value.absent(),
          Value<String?> remoteId = const Value.absent(),
          int? version,
          bool? isDirty,
          Value<String?> nodeId = const Value.absent(),
          String? cacheKey,
          String? contentType,
          int? sizeBytes,
          Value<String?> eTag = const Value.absent(),
          Value<DateTime?> expiresAt = const Value.absent(),
          DateTime? lastAccessedAt,
          int? accessCount,
          Value<String?> localFilePath = const Value.absent()}) =>
      CacheMetadataData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isDeleted: isDeleted ?? this.isDeleted,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        syncStatus: syncStatus ?? this.syncStatus,
        lastSyncedAt:
            lastSyncedAt.present ? lastSyncedAt.value : this.lastSyncedAt,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        version: version ?? this.version,
        isDirty: isDirty ?? this.isDirty,
        nodeId: nodeId.present ? nodeId.value : this.nodeId,
        cacheKey: cacheKey ?? this.cacheKey,
        contentType: contentType ?? this.contentType,
        sizeBytes: sizeBytes ?? this.sizeBytes,
        eTag: eTag.present ? eTag.value : this.eTag,
        expiresAt: expiresAt.present ? expiresAt.value : this.expiresAt,
        lastAccessedAt: lastAccessedAt ?? this.lastAccessedAt,
        accessCount: accessCount ?? this.accessCount,
        localFilePath:
            localFilePath.present ? localFilePath.value : this.localFilePath,
      );
  CacheMetadataData copyWithCompanion(CacheMetadataCompanion data) {
    return CacheMetadataData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      version: data.version.present ? data.version.value : this.version,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      nodeId: data.nodeId.present ? data.nodeId.value : this.nodeId,
      cacheKey: data.cacheKey.present ? data.cacheKey.value : this.cacheKey,
      contentType:
          data.contentType.present ? data.contentType.value : this.contentType,
      sizeBytes: data.sizeBytes.present ? data.sizeBytes.value : this.sizeBytes,
      eTag: data.eTag.present ? data.eTag.value : this.eTag,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
      lastAccessedAt: data.lastAccessedAt.present
          ? data.lastAccessedAt.value
          : this.lastAccessedAt,
      accessCount:
          data.accessCount.present ? data.accessCount.value : this.accessCount,
      localFilePath: data.localFilePath.present
          ? data.localFilePath.value
          : this.localFilePath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CacheMetadataData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('version: $version, ')
          ..write('isDirty: $isDirty, ')
          ..write('nodeId: $nodeId, ')
          ..write('cacheKey: $cacheKey, ')
          ..write('contentType: $contentType, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('eTag: $eTag, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('lastAccessedAt: $lastAccessedAt, ')
          ..write('accessCount: $accessCount, ')
          ..write('localFilePath: $localFilePath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      createdAt,
      updatedAt,
      isDeleted,
      deletedAt,
      syncStatus,
      lastSyncedAt,
      remoteId,
      version,
      isDirty,
      nodeId,
      cacheKey,
      contentType,
      sizeBytes,
      eTag,
      expiresAt,
      lastAccessedAt,
      accessCount,
      localFilePath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CacheMetadataData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.lastSyncedAt == this.lastSyncedAt &&
          other.remoteId == this.remoteId &&
          other.version == this.version &&
          other.isDirty == this.isDirty &&
          other.nodeId == this.nodeId &&
          other.cacheKey == this.cacheKey &&
          other.contentType == this.contentType &&
          other.sizeBytes == this.sizeBytes &&
          other.eTag == this.eTag &&
          other.expiresAt == this.expiresAt &&
          other.lastAccessedAt == this.lastAccessedAt &&
          other.accessCount == this.accessCount &&
          other.localFilePath == this.localFilePath);
}

class CacheMetadataCompanion extends UpdateCompanion<CacheMetadataData> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<DateTime?> lastSyncedAt;
  final Value<String?> remoteId;
  final Value<int> version;
  final Value<bool> isDirty;
  final Value<String?> nodeId;
  final Value<String> cacheKey;
  final Value<String> contentType;
  final Value<int> sizeBytes;
  final Value<String?> eTag;
  final Value<DateTime?> expiresAt;
  final Value<DateTime> lastAccessedAt;
  final Value<int> accessCount;
  final Value<String?> localFilePath;
  final Value<int> rowid;
  const CacheMetadataCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.version = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.nodeId = const Value.absent(),
    this.cacheKey = const Value.absent(),
    this.contentType = const Value.absent(),
    this.sizeBytes = const Value.absent(),
    this.eTag = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.lastAccessedAt = const Value.absent(),
    this.accessCount = const Value.absent(),
    this.localFilePath = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CacheMetadataCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.version = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.nodeId = const Value.absent(),
    required String cacheKey,
    this.contentType = const Value.absent(),
    this.sizeBytes = const Value.absent(),
    this.eTag = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.lastAccessedAt = const Value.absent(),
    this.accessCount = const Value.absent(),
    this.localFilePath = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        cacheKey = Value(cacheKey);
  static Insertable<CacheMetadataData> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<DateTime>? lastSyncedAt,
    Expression<String>? remoteId,
    Expression<int>? version,
    Expression<bool>? isDirty,
    Expression<String>? nodeId,
    Expression<String>? cacheKey,
    Expression<String>? contentType,
    Expression<int>? sizeBytes,
    Expression<String>? eTag,
    Expression<DateTime>? expiresAt,
    Expression<DateTime>? lastAccessedAt,
    Expression<int>? accessCount,
    Expression<String>? localFilePath,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (remoteId != null) 'remote_id': remoteId,
      if (version != null) 'version': version,
      if (isDirty != null) 'is_dirty': isDirty,
      if (nodeId != null) 'node_id': nodeId,
      if (cacheKey != null) 'cache_key': cacheKey,
      if (contentType != null) 'content_type': contentType,
      if (sizeBytes != null) 'size_bytes': sizeBytes,
      if (eTag != null) 'e_tag': eTag,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (lastAccessedAt != null) 'last_accessed_at': lastAccessedAt,
      if (accessCount != null) 'access_count': accessCount,
      if (localFilePath != null) 'local_file_path': localFilePath,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CacheMetadataCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? isDeleted,
      Value<DateTime?>? deletedAt,
      Value<String>? syncStatus,
      Value<DateTime?>? lastSyncedAt,
      Value<String?>? remoteId,
      Value<int>? version,
      Value<bool>? isDirty,
      Value<String?>? nodeId,
      Value<String>? cacheKey,
      Value<String>? contentType,
      Value<int>? sizeBytes,
      Value<String?>? eTag,
      Value<DateTime?>? expiresAt,
      Value<DateTime>? lastAccessedAt,
      Value<int>? accessCount,
      Value<String?>? localFilePath,
      Value<int>? rowid}) {
    return CacheMetadataCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      remoteId: remoteId ?? this.remoteId,
      version: version ?? this.version,
      isDirty: isDirty ?? this.isDirty,
      nodeId: nodeId ?? this.nodeId,
      cacheKey: cacheKey ?? this.cacheKey,
      contentType: contentType ?? this.contentType,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      eTag: eTag ?? this.eTag,
      expiresAt: expiresAt ?? this.expiresAt,
      lastAccessedAt: lastAccessedAt ?? this.lastAccessedAt,
      accessCount: accessCount ?? this.accessCount,
      localFilePath: localFilePath ?? this.localFilePath,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isDirty.present) {
      map['is_dirty'] = Variable<bool>(isDirty.value);
    }
    if (nodeId.present) {
      map['node_id'] = Variable<String>(nodeId.value);
    }
    if (cacheKey.present) {
      map['cache_key'] = Variable<String>(cacheKey.value);
    }
    if (contentType.present) {
      map['content_type'] = Variable<String>(contentType.value);
    }
    if (sizeBytes.present) {
      map['size_bytes'] = Variable<int>(sizeBytes.value);
    }
    if (eTag.present) {
      map['e_tag'] = Variable<String>(eTag.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    if (lastAccessedAt.present) {
      map['last_accessed_at'] = Variable<DateTime>(lastAccessedAt.value);
    }
    if (accessCount.present) {
      map['access_count'] = Variable<int>(accessCount.value);
    }
    if (localFilePath.present) {
      map['local_file_path'] = Variable<String>(localFilePath.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CacheMetadataCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('version: $version, ')
          ..write('isDirty: $isDirty, ')
          ..write('nodeId: $nodeId, ')
          ..write('cacheKey: $cacheKey, ')
          ..write('contentType: $contentType, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('eTag: $eTag, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('lastAccessedAt: $lastAccessedAt, ')
          ..write('accessCount: $accessCount, ')
          ..write('localFilePath: $localFilePath, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NetworkMetadataTable extends NetworkMetadata
    with TableInfo<$NetworkMetadataTable, NetworkMetadataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NetworkMetadataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  static const VerificationMeta _lastSyncedAtMeta =
      const VerificationMeta('lastSyncedAt');
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
      'last_synced_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _isDirtyMeta =
      const VerificationMeta('isDirty');
  @override
  late final GeneratedColumn<bool> isDirty = GeneratedColumn<bool>(
      'is_dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_dirty" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _nodeIdMeta = const VerificationMeta('nodeId');
  @override
  late final GeneratedColumn<String> nodeId = GeneratedColumn<String>(
      'node_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _swarmIdMeta =
      const VerificationMeta('swarmId');
  @override
  late final GeneratedColumn<String> swarmId = GeneratedColumn<String>(
      'swarm_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _peerCountMeta =
      const VerificationMeta('peerCount');
  @override
  late final GeneratedColumn<int> peerCount = GeneratedColumn<int>(
      'peer_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _averageLatencyMsMeta =
      const VerificationMeta('averageLatencyMs');
  @override
  late final GeneratedColumn<int> averageLatencyMs = GeneratedColumn<int>(
      'average_latency_ms', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _downloadSpeedBpsMeta =
      const VerificationMeta('downloadSpeedBps');
  @override
  late final GeneratedColumn<int> downloadSpeedBps = GeneratedColumn<int>(
      'download_speed_bps', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _uploadSpeedBpsMeta =
      const VerificationMeta('uploadSpeedBps');
  @override
  late final GeneratedColumn<int> uploadSpeedBps = GeneratedColumn<int>(
      'upload_speed_bps', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _dhtReputationScoreMeta =
      const VerificationMeta('dhtReputationScore');
  @override
  late final GeneratedColumn<double> dhtReputationScore =
      GeneratedColumn<double>('dht_reputation_score', aliasedName, false,
          type: DriftSqlType.double,
          requiredDuringInsert: false,
          defaultValue: const Constant(100.0));
  static const VerificationMeta _totalBytesSharedMeta =
      const VerificationMeta('totalBytesShared');
  @override
  late final GeneratedColumn<int> totalBytesShared = GeneratedColumn<int>(
      'total_bytes_shared', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _totalBytesReceivedMeta =
      const VerificationMeta('totalBytesReceived');
  @override
  late final GeneratedColumn<int> totalBytesReceived = GeneratedColumn<int>(
      'total_bytes_received', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastHealthCheckAtMeta =
      const VerificationMeta('lastHealthCheckAt');
  @override
  late final GeneratedColumn<DateTime> lastHealthCheckAt =
      GeneratedColumn<DateTime>('last_health_check_at', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        isDeleted,
        deletedAt,
        syncStatus,
        lastSyncedAt,
        remoteId,
        version,
        isDirty,
        nodeId,
        swarmId,
        peerCount,
        averageLatencyMs,
        downloadSpeedBps,
        uploadSpeedBps,
        dhtReputationScore,
        totalBytesShared,
        totalBytesReceived,
        lastHealthCheckAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'network_metadata';
  @override
  VerificationContext validateIntegrity(
      Insertable<NetworkMetadataData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
          _lastSyncedAtMeta,
          lastSyncedAt.isAcceptableOrUnknown(
              data['last_synced_at']!, _lastSyncedAtMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('is_dirty')) {
      context.handle(_isDirtyMeta,
          isDirty.isAcceptableOrUnknown(data['is_dirty']!, _isDirtyMeta));
    }
    if (data.containsKey('node_id')) {
      context.handle(_nodeIdMeta,
          nodeId.isAcceptableOrUnknown(data['node_id']!, _nodeIdMeta));
    }
    if (data.containsKey('swarm_id')) {
      context.handle(_swarmIdMeta,
          swarmId.isAcceptableOrUnknown(data['swarm_id']!, _swarmIdMeta));
    } else if (isInserting) {
      context.missing(_swarmIdMeta);
    }
    if (data.containsKey('peer_count')) {
      context.handle(_peerCountMeta,
          peerCount.isAcceptableOrUnknown(data['peer_count']!, _peerCountMeta));
    }
    if (data.containsKey('average_latency_ms')) {
      context.handle(
          _averageLatencyMsMeta,
          averageLatencyMs.isAcceptableOrUnknown(
              data['average_latency_ms']!, _averageLatencyMsMeta));
    }
    if (data.containsKey('download_speed_bps')) {
      context.handle(
          _downloadSpeedBpsMeta,
          downloadSpeedBps.isAcceptableOrUnknown(
              data['download_speed_bps']!, _downloadSpeedBpsMeta));
    }
    if (data.containsKey('upload_speed_bps')) {
      context.handle(
          _uploadSpeedBpsMeta,
          uploadSpeedBps.isAcceptableOrUnknown(
              data['upload_speed_bps']!, _uploadSpeedBpsMeta));
    }
    if (data.containsKey('dht_reputation_score')) {
      context.handle(
          _dhtReputationScoreMeta,
          dhtReputationScore.isAcceptableOrUnknown(
              data['dht_reputation_score']!, _dhtReputationScoreMeta));
    }
    if (data.containsKey('total_bytes_shared')) {
      context.handle(
          _totalBytesSharedMeta,
          totalBytesShared.isAcceptableOrUnknown(
              data['total_bytes_shared']!, _totalBytesSharedMeta));
    }
    if (data.containsKey('total_bytes_received')) {
      context.handle(
          _totalBytesReceivedMeta,
          totalBytesReceived.isAcceptableOrUnknown(
              data['total_bytes_received']!, _totalBytesReceivedMeta));
    }
    if (data.containsKey('last_health_check_at')) {
      context.handle(
          _lastHealthCheckAtMeta,
          lastHealthCheckAt.isAcceptableOrUnknown(
              data['last_health_check_at']!, _lastHealthCheckAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NetworkMetadataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NetworkMetadataData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_synced_at']),
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      isDirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_dirty'])!,
      nodeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}node_id']),
      swarmId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}swarm_id'])!,
      peerCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}peer_count'])!,
      averageLatencyMs: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}average_latency_ms'])!,
      downloadSpeedBps: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}download_speed_bps'])!,
      uploadSpeedBps: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}upload_speed_bps'])!,
      dhtReputationScore: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}dht_reputation_score'])!,
      totalBytesShared: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}total_bytes_shared'])!,
      totalBytesReceived: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}total_bytes_received'])!,
      lastHealthCheckAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}last_health_check_at'])!,
    );
  }

  @override
  $NetworkMetadataTable createAlias(String alias) {
    return $NetworkMetadataTable(attachedDatabase, alias);
  }
}

class NetworkMetadataData extends DataClass
    implements Insertable<NetworkMetadataData> {
  /// Unique Primary Key identifier (UUID string or unique content hash).
  final String id;

  /// Creation timestamp.
  final DateTime createdAt;

  /// Last modification timestamp.
  final DateTime updatedAt;

  /// Soft delete flag to prevent permanent data loss and facilitate sync deletions.
  final bool isDeleted;

  /// Timestamp when the record was soft-deleted.
  final DateTime? deletedAt;

  /// Current synchronization status ('synced', 'pending', 'conflict', 'local_only').
  final String syncStatus;

  /// Timestamp when the record was last synchronized with a remote or peer node.
  final DateTime? lastSyncedAt;

  /// Remote or global canonical identifier (e.g., global URI or CID).
  final String? remoteId;

  /// Monotonic version counter for conflict resolution.
  final int version;

  /// Indicates if the record has local uncommitted changes waiting for sync.
  final bool isDirty;

  /// Peer or node ID that originally created or last modified this record.
  final String? nodeId;

  /// Swarm or subnetwork identifier.
  final String swarmId;

  /// Connected peer count.
  final int peerCount;

  /// Average round-trip ping latency in milliseconds.
  final int averageLatencyMs;

  /// Observed download speed in bytes per second.
  final int downloadSpeedBps;

  /// Observed upload throughput in bytes per second.
  final int uploadSpeedBps;

  /// Distributed Hash Table (DHT) consensus reputation score (0.0 to 100.0).
  final double dhtReputationScore;

  /// Lifetime total bytes shared to network peers.
  final int totalBytesShared;

  /// Lifetime total bytes received from network peers.
  final int totalBytesReceived;

  /// Timestamp of the most recent swarm health check.
  final DateTime lastHealthCheckAt;
  const NetworkMetadataData(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.isDeleted,
      this.deletedAt,
      required this.syncStatus,
      this.lastSyncedAt,
      this.remoteId,
      required this.version,
      required this.isDirty,
      this.nodeId,
      required this.swarmId,
      required this.peerCount,
      required this.averageLatencyMs,
      required this.downloadSpeedBps,
      required this.uploadSpeedBps,
      required this.dhtReputationScore,
      required this.totalBytesShared,
      required this.totalBytesReceived,
      required this.lastHealthCheckAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || lastSyncedAt != null) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    }
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['version'] = Variable<int>(version);
    map['is_dirty'] = Variable<bool>(isDirty);
    if (!nullToAbsent || nodeId != null) {
      map['node_id'] = Variable<String>(nodeId);
    }
    map['swarm_id'] = Variable<String>(swarmId);
    map['peer_count'] = Variable<int>(peerCount);
    map['average_latency_ms'] = Variable<int>(averageLatencyMs);
    map['download_speed_bps'] = Variable<int>(downloadSpeedBps);
    map['upload_speed_bps'] = Variable<int>(uploadSpeedBps);
    map['dht_reputation_score'] = Variable<double>(dhtReputationScore);
    map['total_bytes_shared'] = Variable<int>(totalBytesShared);
    map['total_bytes_received'] = Variable<int>(totalBytesReceived);
    map['last_health_check_at'] = Variable<DateTime>(lastHealthCheckAt);
    return map;
  }

  NetworkMetadataCompanion toCompanion(bool nullToAbsent) {
    return NetworkMetadataCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      lastSyncedAt: lastSyncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncedAt),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      version: Value(version),
      isDirty: Value(isDirty),
      nodeId:
          nodeId == null && nullToAbsent ? const Value.absent() : Value(nodeId),
      swarmId: Value(swarmId),
      peerCount: Value(peerCount),
      averageLatencyMs: Value(averageLatencyMs),
      downloadSpeedBps: Value(downloadSpeedBps),
      uploadSpeedBps: Value(uploadSpeedBps),
      dhtReputationScore: Value(dhtReputationScore),
      totalBytesShared: Value(totalBytesShared),
      totalBytesReceived: Value(totalBytesReceived),
      lastHealthCheckAt: Value(lastHealthCheckAt),
    );
  }

  factory NetworkMetadataData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NetworkMetadataData(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      lastSyncedAt: serializer.fromJson<DateTime?>(json['lastSyncedAt']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      version: serializer.fromJson<int>(json['version']),
      isDirty: serializer.fromJson<bool>(json['isDirty']),
      nodeId: serializer.fromJson<String?>(json['nodeId']),
      swarmId: serializer.fromJson<String>(json['swarmId']),
      peerCount: serializer.fromJson<int>(json['peerCount']),
      averageLatencyMs: serializer.fromJson<int>(json['averageLatencyMs']),
      downloadSpeedBps: serializer.fromJson<int>(json['downloadSpeedBps']),
      uploadSpeedBps: serializer.fromJson<int>(json['uploadSpeedBps']),
      dhtReputationScore:
          serializer.fromJson<double>(json['dhtReputationScore']),
      totalBytesShared: serializer.fromJson<int>(json['totalBytesShared']),
      totalBytesReceived: serializer.fromJson<int>(json['totalBytesReceived']),
      lastHealthCheckAt:
          serializer.fromJson<DateTime>(json['lastHealthCheckAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'lastSyncedAt': serializer.toJson<DateTime?>(lastSyncedAt),
      'remoteId': serializer.toJson<String?>(remoteId),
      'version': serializer.toJson<int>(version),
      'isDirty': serializer.toJson<bool>(isDirty),
      'nodeId': serializer.toJson<String?>(nodeId),
      'swarmId': serializer.toJson<String>(swarmId),
      'peerCount': serializer.toJson<int>(peerCount),
      'averageLatencyMs': serializer.toJson<int>(averageLatencyMs),
      'downloadSpeedBps': serializer.toJson<int>(downloadSpeedBps),
      'uploadSpeedBps': serializer.toJson<int>(uploadSpeedBps),
      'dhtReputationScore': serializer.toJson<double>(dhtReputationScore),
      'totalBytesShared': serializer.toJson<int>(totalBytesShared),
      'totalBytesReceived': serializer.toJson<int>(totalBytesReceived),
      'lastHealthCheckAt': serializer.toJson<DateTime>(lastHealthCheckAt),
    };
  }

  NetworkMetadataData copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? isDeleted,
          Value<DateTime?> deletedAt = const Value.absent(),
          String? syncStatus,
          Value<DateTime?> lastSyncedAt = const Value.absent(),
          Value<String?> remoteId = const Value.absent(),
          int? version,
          bool? isDirty,
          Value<String?> nodeId = const Value.absent(),
          String? swarmId,
          int? peerCount,
          int? averageLatencyMs,
          int? downloadSpeedBps,
          int? uploadSpeedBps,
          double? dhtReputationScore,
          int? totalBytesShared,
          int? totalBytesReceived,
          DateTime? lastHealthCheckAt}) =>
      NetworkMetadataData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isDeleted: isDeleted ?? this.isDeleted,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        syncStatus: syncStatus ?? this.syncStatus,
        lastSyncedAt:
            lastSyncedAt.present ? lastSyncedAt.value : this.lastSyncedAt,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        version: version ?? this.version,
        isDirty: isDirty ?? this.isDirty,
        nodeId: nodeId.present ? nodeId.value : this.nodeId,
        swarmId: swarmId ?? this.swarmId,
        peerCount: peerCount ?? this.peerCount,
        averageLatencyMs: averageLatencyMs ?? this.averageLatencyMs,
        downloadSpeedBps: downloadSpeedBps ?? this.downloadSpeedBps,
        uploadSpeedBps: uploadSpeedBps ?? this.uploadSpeedBps,
        dhtReputationScore: dhtReputationScore ?? this.dhtReputationScore,
        totalBytesShared: totalBytesShared ?? this.totalBytesShared,
        totalBytesReceived: totalBytesReceived ?? this.totalBytesReceived,
        lastHealthCheckAt: lastHealthCheckAt ?? this.lastHealthCheckAt,
      );
  NetworkMetadataData copyWithCompanion(NetworkMetadataCompanion data) {
    return NetworkMetadataData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      version: data.version.present ? data.version.value : this.version,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      nodeId: data.nodeId.present ? data.nodeId.value : this.nodeId,
      swarmId: data.swarmId.present ? data.swarmId.value : this.swarmId,
      peerCount: data.peerCount.present ? data.peerCount.value : this.peerCount,
      averageLatencyMs: data.averageLatencyMs.present
          ? data.averageLatencyMs.value
          : this.averageLatencyMs,
      downloadSpeedBps: data.downloadSpeedBps.present
          ? data.downloadSpeedBps.value
          : this.downloadSpeedBps,
      uploadSpeedBps: data.uploadSpeedBps.present
          ? data.uploadSpeedBps.value
          : this.uploadSpeedBps,
      dhtReputationScore: data.dhtReputationScore.present
          ? data.dhtReputationScore.value
          : this.dhtReputationScore,
      totalBytesShared: data.totalBytesShared.present
          ? data.totalBytesShared.value
          : this.totalBytesShared,
      totalBytesReceived: data.totalBytesReceived.present
          ? data.totalBytesReceived.value
          : this.totalBytesReceived,
      lastHealthCheckAt: data.lastHealthCheckAt.present
          ? data.lastHealthCheckAt.value
          : this.lastHealthCheckAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NetworkMetadataData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('version: $version, ')
          ..write('isDirty: $isDirty, ')
          ..write('nodeId: $nodeId, ')
          ..write('swarmId: $swarmId, ')
          ..write('peerCount: $peerCount, ')
          ..write('averageLatencyMs: $averageLatencyMs, ')
          ..write('downloadSpeedBps: $downloadSpeedBps, ')
          ..write('uploadSpeedBps: $uploadSpeedBps, ')
          ..write('dhtReputationScore: $dhtReputationScore, ')
          ..write('totalBytesShared: $totalBytesShared, ')
          ..write('totalBytesReceived: $totalBytesReceived, ')
          ..write('lastHealthCheckAt: $lastHealthCheckAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      createdAt,
      updatedAt,
      isDeleted,
      deletedAt,
      syncStatus,
      lastSyncedAt,
      remoteId,
      version,
      isDirty,
      nodeId,
      swarmId,
      peerCount,
      averageLatencyMs,
      downloadSpeedBps,
      uploadSpeedBps,
      dhtReputationScore,
      totalBytesShared,
      totalBytesReceived,
      lastHealthCheckAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NetworkMetadataData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.lastSyncedAt == this.lastSyncedAt &&
          other.remoteId == this.remoteId &&
          other.version == this.version &&
          other.isDirty == this.isDirty &&
          other.nodeId == this.nodeId &&
          other.swarmId == this.swarmId &&
          other.peerCount == this.peerCount &&
          other.averageLatencyMs == this.averageLatencyMs &&
          other.downloadSpeedBps == this.downloadSpeedBps &&
          other.uploadSpeedBps == this.uploadSpeedBps &&
          other.dhtReputationScore == this.dhtReputationScore &&
          other.totalBytesShared == this.totalBytesShared &&
          other.totalBytesReceived == this.totalBytesReceived &&
          other.lastHealthCheckAt == this.lastHealthCheckAt);
}

class NetworkMetadataCompanion extends UpdateCompanion<NetworkMetadataData> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<DateTime?> lastSyncedAt;
  final Value<String?> remoteId;
  final Value<int> version;
  final Value<bool> isDirty;
  final Value<String?> nodeId;
  final Value<String> swarmId;
  final Value<int> peerCount;
  final Value<int> averageLatencyMs;
  final Value<int> downloadSpeedBps;
  final Value<int> uploadSpeedBps;
  final Value<double> dhtReputationScore;
  final Value<int> totalBytesShared;
  final Value<int> totalBytesReceived;
  final Value<DateTime> lastHealthCheckAt;
  final Value<int> rowid;
  const NetworkMetadataCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.version = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.nodeId = const Value.absent(),
    this.swarmId = const Value.absent(),
    this.peerCount = const Value.absent(),
    this.averageLatencyMs = const Value.absent(),
    this.downloadSpeedBps = const Value.absent(),
    this.uploadSpeedBps = const Value.absent(),
    this.dhtReputationScore = const Value.absent(),
    this.totalBytesShared = const Value.absent(),
    this.totalBytesReceived = const Value.absent(),
    this.lastHealthCheckAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NetworkMetadataCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.version = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.nodeId = const Value.absent(),
    required String swarmId,
    this.peerCount = const Value.absent(),
    this.averageLatencyMs = const Value.absent(),
    this.downloadSpeedBps = const Value.absent(),
    this.uploadSpeedBps = const Value.absent(),
    this.dhtReputationScore = const Value.absent(),
    this.totalBytesShared = const Value.absent(),
    this.totalBytesReceived = const Value.absent(),
    this.lastHealthCheckAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        swarmId = Value(swarmId);
  static Insertable<NetworkMetadataData> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<DateTime>? lastSyncedAt,
    Expression<String>? remoteId,
    Expression<int>? version,
    Expression<bool>? isDirty,
    Expression<String>? nodeId,
    Expression<String>? swarmId,
    Expression<int>? peerCount,
    Expression<int>? averageLatencyMs,
    Expression<int>? downloadSpeedBps,
    Expression<int>? uploadSpeedBps,
    Expression<double>? dhtReputationScore,
    Expression<int>? totalBytesShared,
    Expression<int>? totalBytesReceived,
    Expression<DateTime>? lastHealthCheckAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (remoteId != null) 'remote_id': remoteId,
      if (version != null) 'version': version,
      if (isDirty != null) 'is_dirty': isDirty,
      if (nodeId != null) 'node_id': nodeId,
      if (swarmId != null) 'swarm_id': swarmId,
      if (peerCount != null) 'peer_count': peerCount,
      if (averageLatencyMs != null) 'average_latency_ms': averageLatencyMs,
      if (downloadSpeedBps != null) 'download_speed_bps': downloadSpeedBps,
      if (uploadSpeedBps != null) 'upload_speed_bps': uploadSpeedBps,
      if (dhtReputationScore != null)
        'dht_reputation_score': dhtReputationScore,
      if (totalBytesShared != null) 'total_bytes_shared': totalBytesShared,
      if (totalBytesReceived != null)
        'total_bytes_received': totalBytesReceived,
      if (lastHealthCheckAt != null) 'last_health_check_at': lastHealthCheckAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NetworkMetadataCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? isDeleted,
      Value<DateTime?>? deletedAt,
      Value<String>? syncStatus,
      Value<DateTime?>? lastSyncedAt,
      Value<String?>? remoteId,
      Value<int>? version,
      Value<bool>? isDirty,
      Value<String?>? nodeId,
      Value<String>? swarmId,
      Value<int>? peerCount,
      Value<int>? averageLatencyMs,
      Value<int>? downloadSpeedBps,
      Value<int>? uploadSpeedBps,
      Value<double>? dhtReputationScore,
      Value<int>? totalBytesShared,
      Value<int>? totalBytesReceived,
      Value<DateTime>? lastHealthCheckAt,
      Value<int>? rowid}) {
    return NetworkMetadataCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      remoteId: remoteId ?? this.remoteId,
      version: version ?? this.version,
      isDirty: isDirty ?? this.isDirty,
      nodeId: nodeId ?? this.nodeId,
      swarmId: swarmId ?? this.swarmId,
      peerCount: peerCount ?? this.peerCount,
      averageLatencyMs: averageLatencyMs ?? this.averageLatencyMs,
      downloadSpeedBps: downloadSpeedBps ?? this.downloadSpeedBps,
      uploadSpeedBps: uploadSpeedBps ?? this.uploadSpeedBps,
      dhtReputationScore: dhtReputationScore ?? this.dhtReputationScore,
      totalBytesShared: totalBytesShared ?? this.totalBytesShared,
      totalBytesReceived: totalBytesReceived ?? this.totalBytesReceived,
      lastHealthCheckAt: lastHealthCheckAt ?? this.lastHealthCheckAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isDirty.present) {
      map['is_dirty'] = Variable<bool>(isDirty.value);
    }
    if (nodeId.present) {
      map['node_id'] = Variable<String>(nodeId.value);
    }
    if (swarmId.present) {
      map['swarm_id'] = Variable<String>(swarmId.value);
    }
    if (peerCount.present) {
      map['peer_count'] = Variable<int>(peerCount.value);
    }
    if (averageLatencyMs.present) {
      map['average_latency_ms'] = Variable<int>(averageLatencyMs.value);
    }
    if (downloadSpeedBps.present) {
      map['download_speed_bps'] = Variable<int>(downloadSpeedBps.value);
    }
    if (uploadSpeedBps.present) {
      map['upload_speed_bps'] = Variable<int>(uploadSpeedBps.value);
    }
    if (dhtReputationScore.present) {
      map['dht_reputation_score'] = Variable<double>(dhtReputationScore.value);
    }
    if (totalBytesShared.present) {
      map['total_bytes_shared'] = Variable<int>(totalBytesShared.value);
    }
    if (totalBytesReceived.present) {
      map['total_bytes_received'] = Variable<int>(totalBytesReceived.value);
    }
    if (lastHealthCheckAt.present) {
      map['last_health_check_at'] = Variable<DateTime>(lastHealthCheckAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NetworkMetadataCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('version: $version, ')
          ..write('isDirty: $isDirty, ')
          ..write('nodeId: $nodeId, ')
          ..write('swarmId: $swarmId, ')
          ..write('peerCount: $peerCount, ')
          ..write('averageLatencyMs: $averageLatencyMs, ')
          ..write('downloadSpeedBps: $downloadSpeedBps, ')
          ..write('uploadSpeedBps: $uploadSpeedBps, ')
          ..write('dhtReputationScore: $dhtReputationScore, ')
          ..write('totalBytesShared: $totalBytesShared, ')
          ..write('totalBytesReceived: $totalBytesReceived, ')
          ..write('lastHealthCheckAt: $lastHealthCheckAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NodeMetadataTable extends NodeMetadata
    with TableInfo<$NodeMetadataTable, NodeMetadataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NodeMetadataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  static const VerificationMeta _lastSyncedAtMeta =
      const VerificationMeta('lastSyncedAt');
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
      'last_synced_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _isDirtyMeta =
      const VerificationMeta('isDirty');
  @override
  late final GeneratedColumn<bool> isDirty = GeneratedColumn<bool>(
      'is_dirty', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_dirty" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _nodeIdMeta = const VerificationMeta('nodeId');
  @override
  late final GeneratedColumn<String> nodeId = GeneratedColumn<String>(
      'node_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nodePublicKeyMeta =
      const VerificationMeta('nodePublicKey');
  @override
  late final GeneratedColumn<String> nodePublicKey = GeneratedColumn<String>(
      'node_public_key', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 256),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _multiaddressesJsonMeta =
      const VerificationMeta('multiaddressesJson');
  @override
  late final GeneratedColumn<String> multiaddressesJson =
      GeneratedColumn<String>('multiaddresses_json', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant('[]'));
  static const VerificationMeta _protocolVersionMeta =
      const VerificationMeta('protocolVersion');
  @override
  late final GeneratedColumn<String> protocolVersion = GeneratedColumn<String>(
      'protocol_version', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('studyvault/0.4.0'));
  static const VerificationMeta _reputationScoreMeta =
      const VerificationMeta('reputationScore');
  @override
  late final GeneratedColumn<double> reputationScore = GeneratedColumn<double>(
      'reputation_score', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(100.0));
  static const VerificationMeta _latencyMsMeta =
      const VerificationMeta('latencyMs');
  @override
  late final GeneratedColumn<int> latencyMs = GeneratedColumn<int>(
      'latency_ms', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _isConnectedMeta =
      const VerificationMeta('isConnected');
  @override
  late final GeneratedColumn<bool> isConnected = GeneratedColumn<bool>(
      'is_connected', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_connected" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isBannedMeta =
      const VerificationMeta('isBanned');
  @override
  late final GeneratedColumn<bool> isBanned = GeneratedColumn<bool>(
      'is_banned', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_banned" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _lastSeenAtMeta =
      const VerificationMeta('lastSeenAt');
  @override
  late final GeneratedColumn<DateTime> lastSeenAt = GeneratedColumn<DateTime>(
      'last_seen_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        updatedAt,
        isDeleted,
        deletedAt,
        syncStatus,
        lastSyncedAt,
        remoteId,
        version,
        isDirty,
        nodeId,
        nodePublicKey,
        multiaddressesJson,
        protocolVersion,
        reputationScore,
        latencyMs,
        isConnected,
        isBanned,
        lastSeenAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'node_metadata';
  @override
  VerificationContext validateIntegrity(Insertable<NodeMetadataData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
          _lastSyncedAtMeta,
          lastSyncedAt.isAcceptableOrUnknown(
              data['last_synced_at']!, _lastSyncedAtMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('is_dirty')) {
      context.handle(_isDirtyMeta,
          isDirty.isAcceptableOrUnknown(data['is_dirty']!, _isDirtyMeta));
    }
    if (data.containsKey('node_id')) {
      context.handle(_nodeIdMeta,
          nodeId.isAcceptableOrUnknown(data['node_id']!, _nodeIdMeta));
    }
    if (data.containsKey('node_public_key')) {
      context.handle(
          _nodePublicKeyMeta,
          nodePublicKey.isAcceptableOrUnknown(
              data['node_public_key']!, _nodePublicKeyMeta));
    } else if (isInserting) {
      context.missing(_nodePublicKeyMeta);
    }
    if (data.containsKey('multiaddresses_json')) {
      context.handle(
          _multiaddressesJsonMeta,
          multiaddressesJson.isAcceptableOrUnknown(
              data['multiaddresses_json']!, _multiaddressesJsonMeta));
    }
    if (data.containsKey('protocol_version')) {
      context.handle(
          _protocolVersionMeta,
          protocolVersion.isAcceptableOrUnknown(
              data['protocol_version']!, _protocolVersionMeta));
    }
    if (data.containsKey('reputation_score')) {
      context.handle(
          _reputationScoreMeta,
          reputationScore.isAcceptableOrUnknown(
              data['reputation_score']!, _reputationScoreMeta));
    }
    if (data.containsKey('latency_ms')) {
      context.handle(_latencyMsMeta,
          latencyMs.isAcceptableOrUnknown(data['latency_ms']!, _latencyMsMeta));
    }
    if (data.containsKey('is_connected')) {
      context.handle(
          _isConnectedMeta,
          isConnected.isAcceptableOrUnknown(
              data['is_connected']!, _isConnectedMeta));
    }
    if (data.containsKey('is_banned')) {
      context.handle(_isBannedMeta,
          isBanned.isAcceptableOrUnknown(data['is_banned']!, _isBannedMeta));
    }
    if (data.containsKey('last_seen_at')) {
      context.handle(
          _lastSeenAtMeta,
          lastSeenAt.isAcceptableOrUnknown(
              data['last_seen_at']!, _lastSeenAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NodeMetadataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NodeMetadataData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_synced_at']),
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      isDirty: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_dirty'])!,
      nodeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}node_id']),
      nodePublicKey: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}node_public_key'])!,
      multiaddressesJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}multiaddresses_json'])!,
      protocolVersion: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}protocol_version'])!,
      reputationScore: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}reputation_score'])!,
      latencyMs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}latency_ms'])!,
      isConnected: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_connected'])!,
      isBanned: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_banned'])!,
      lastSeenAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_seen_at'])!,
    );
  }

  @override
  $NodeMetadataTable createAlias(String alias) {
    return $NodeMetadataTable(attachedDatabase, alias);
  }
}

class NodeMetadataData extends DataClass
    implements Insertable<NodeMetadataData> {
  /// Unique Primary Key identifier (UUID string or unique content hash).
  final String id;

  /// Creation timestamp.
  final DateTime createdAt;

  /// Last modification timestamp.
  final DateTime updatedAt;

  /// Soft delete flag to prevent permanent data loss and facilitate sync deletions.
  final bool isDeleted;

  /// Timestamp when the record was soft-deleted.
  final DateTime? deletedAt;

  /// Current synchronization status ('synced', 'pending', 'conflict', 'local_only').
  final String syncStatus;

  /// Timestamp when the record was last synchronized with a remote or peer node.
  final DateTime? lastSyncedAt;

  /// Remote or global canonical identifier (e.g., global URI or CID).
  final String? remoteId;

  /// Monotonic version counter for conflict resolution.
  final int version;

  /// Indicates if the record has local uncommitted changes waiting for sync.
  final bool isDirty;

  /// Peer or node ID that originally created or last modified this record.
  final String? nodeId;

  /// Base58 or hex encoded Ed25519/Secp256k1 public key of the peer node.
  final String nodePublicKey;

  /// JSON array of libp2p/IPFS multiaddresses (e.g., `["/ip4/192.168.1.1/tcp/4001/p2p/..."]`).
  final String multiaddressesJson;

  /// Node client and protocol version string.
  final String protocolVersion;

  /// Quorum peer trust and consensus reputation score (0.0 to 100.0).
  final double reputationScore;

  /// Observed ping latency in milliseconds.
  final int latencyMs;

  /// Whether active socket connection exists with this peer.
  final bool isConnected;

  /// Whether peer is quarantined or banned due to invalid cryptographic proofs.
  final bool isBanned;

  /// Timestamp when peer was last active or responded to ping.
  final DateTime lastSeenAt;
  const NodeMetadataData(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.isDeleted,
      this.deletedAt,
      required this.syncStatus,
      this.lastSyncedAt,
      this.remoteId,
      required this.version,
      required this.isDirty,
      this.nodeId,
      required this.nodePublicKey,
      required this.multiaddressesJson,
      required this.protocolVersion,
      required this.reputationScore,
      required this.latencyMs,
      required this.isConnected,
      required this.isBanned,
      required this.lastSeenAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || lastSyncedAt != null) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    }
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['version'] = Variable<int>(version);
    map['is_dirty'] = Variable<bool>(isDirty);
    if (!nullToAbsent || nodeId != null) {
      map['node_id'] = Variable<String>(nodeId);
    }
    map['node_public_key'] = Variable<String>(nodePublicKey);
    map['multiaddresses_json'] = Variable<String>(multiaddressesJson);
    map['protocol_version'] = Variable<String>(protocolVersion);
    map['reputation_score'] = Variable<double>(reputationScore);
    map['latency_ms'] = Variable<int>(latencyMs);
    map['is_connected'] = Variable<bool>(isConnected);
    map['is_banned'] = Variable<bool>(isBanned);
    map['last_seen_at'] = Variable<DateTime>(lastSeenAt);
    return map;
  }

  NodeMetadataCompanion toCompanion(bool nullToAbsent) {
    return NodeMetadataCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      lastSyncedAt: lastSyncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncedAt),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      version: Value(version),
      isDirty: Value(isDirty),
      nodeId:
          nodeId == null && nullToAbsent ? const Value.absent() : Value(nodeId),
      nodePublicKey: Value(nodePublicKey),
      multiaddressesJson: Value(multiaddressesJson),
      protocolVersion: Value(protocolVersion),
      reputationScore: Value(reputationScore),
      latencyMs: Value(latencyMs),
      isConnected: Value(isConnected),
      isBanned: Value(isBanned),
      lastSeenAt: Value(lastSeenAt),
    );
  }

  factory NodeMetadataData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NodeMetadataData(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      lastSyncedAt: serializer.fromJson<DateTime?>(json['lastSyncedAt']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      version: serializer.fromJson<int>(json['version']),
      isDirty: serializer.fromJson<bool>(json['isDirty']),
      nodeId: serializer.fromJson<String?>(json['nodeId']),
      nodePublicKey: serializer.fromJson<String>(json['nodePublicKey']),
      multiaddressesJson:
          serializer.fromJson<String>(json['multiaddressesJson']),
      protocolVersion: serializer.fromJson<String>(json['protocolVersion']),
      reputationScore: serializer.fromJson<double>(json['reputationScore']),
      latencyMs: serializer.fromJson<int>(json['latencyMs']),
      isConnected: serializer.fromJson<bool>(json['isConnected']),
      isBanned: serializer.fromJson<bool>(json['isBanned']),
      lastSeenAt: serializer.fromJson<DateTime>(json['lastSeenAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'lastSyncedAt': serializer.toJson<DateTime?>(lastSyncedAt),
      'remoteId': serializer.toJson<String?>(remoteId),
      'version': serializer.toJson<int>(version),
      'isDirty': serializer.toJson<bool>(isDirty),
      'nodeId': serializer.toJson<String?>(nodeId),
      'nodePublicKey': serializer.toJson<String>(nodePublicKey),
      'multiaddressesJson': serializer.toJson<String>(multiaddressesJson),
      'protocolVersion': serializer.toJson<String>(protocolVersion),
      'reputationScore': serializer.toJson<double>(reputationScore),
      'latencyMs': serializer.toJson<int>(latencyMs),
      'isConnected': serializer.toJson<bool>(isConnected),
      'isBanned': serializer.toJson<bool>(isBanned),
      'lastSeenAt': serializer.toJson<DateTime>(lastSeenAt),
    };
  }

  NodeMetadataData copyWith(
          {String? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? isDeleted,
          Value<DateTime?> deletedAt = const Value.absent(),
          String? syncStatus,
          Value<DateTime?> lastSyncedAt = const Value.absent(),
          Value<String?> remoteId = const Value.absent(),
          int? version,
          bool? isDirty,
          Value<String?> nodeId = const Value.absent(),
          String? nodePublicKey,
          String? multiaddressesJson,
          String? protocolVersion,
          double? reputationScore,
          int? latencyMs,
          bool? isConnected,
          bool? isBanned,
          DateTime? lastSeenAt}) =>
      NodeMetadataData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isDeleted: isDeleted ?? this.isDeleted,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        syncStatus: syncStatus ?? this.syncStatus,
        lastSyncedAt:
            lastSyncedAt.present ? lastSyncedAt.value : this.lastSyncedAt,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        version: version ?? this.version,
        isDirty: isDirty ?? this.isDirty,
        nodeId: nodeId.present ? nodeId.value : this.nodeId,
        nodePublicKey: nodePublicKey ?? this.nodePublicKey,
        multiaddressesJson: multiaddressesJson ?? this.multiaddressesJson,
        protocolVersion: protocolVersion ?? this.protocolVersion,
        reputationScore: reputationScore ?? this.reputationScore,
        latencyMs: latencyMs ?? this.latencyMs,
        isConnected: isConnected ?? this.isConnected,
        isBanned: isBanned ?? this.isBanned,
        lastSeenAt: lastSeenAt ?? this.lastSeenAt,
      );
  NodeMetadataData copyWithCompanion(NodeMetadataCompanion data) {
    return NodeMetadataData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      version: data.version.present ? data.version.value : this.version,
      isDirty: data.isDirty.present ? data.isDirty.value : this.isDirty,
      nodeId: data.nodeId.present ? data.nodeId.value : this.nodeId,
      nodePublicKey: data.nodePublicKey.present
          ? data.nodePublicKey.value
          : this.nodePublicKey,
      multiaddressesJson: data.multiaddressesJson.present
          ? data.multiaddressesJson.value
          : this.multiaddressesJson,
      protocolVersion: data.protocolVersion.present
          ? data.protocolVersion.value
          : this.protocolVersion,
      reputationScore: data.reputationScore.present
          ? data.reputationScore.value
          : this.reputationScore,
      latencyMs: data.latencyMs.present ? data.latencyMs.value : this.latencyMs,
      isConnected:
          data.isConnected.present ? data.isConnected.value : this.isConnected,
      isBanned: data.isBanned.present ? data.isBanned.value : this.isBanned,
      lastSeenAt:
          data.lastSeenAt.present ? data.lastSeenAt.value : this.lastSeenAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NodeMetadataData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('version: $version, ')
          ..write('isDirty: $isDirty, ')
          ..write('nodeId: $nodeId, ')
          ..write('nodePublicKey: $nodePublicKey, ')
          ..write('multiaddressesJson: $multiaddressesJson, ')
          ..write('protocolVersion: $protocolVersion, ')
          ..write('reputationScore: $reputationScore, ')
          ..write('latencyMs: $latencyMs, ')
          ..write('isConnected: $isConnected, ')
          ..write('isBanned: $isBanned, ')
          ..write('lastSeenAt: $lastSeenAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      createdAt,
      updatedAt,
      isDeleted,
      deletedAt,
      syncStatus,
      lastSyncedAt,
      remoteId,
      version,
      isDirty,
      nodeId,
      nodePublicKey,
      multiaddressesJson,
      protocolVersion,
      reputationScore,
      latencyMs,
      isConnected,
      isBanned,
      lastSeenAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NodeMetadataData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.lastSyncedAt == this.lastSyncedAt &&
          other.remoteId == this.remoteId &&
          other.version == this.version &&
          other.isDirty == this.isDirty &&
          other.nodeId == this.nodeId &&
          other.nodePublicKey == this.nodePublicKey &&
          other.multiaddressesJson == this.multiaddressesJson &&
          other.protocolVersion == this.protocolVersion &&
          other.reputationScore == this.reputationScore &&
          other.latencyMs == this.latencyMs &&
          other.isConnected == this.isConnected &&
          other.isBanned == this.isBanned &&
          other.lastSeenAt == this.lastSeenAt);
}

class NodeMetadataCompanion extends UpdateCompanion<NodeMetadataData> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<DateTime?> lastSyncedAt;
  final Value<String?> remoteId;
  final Value<int> version;
  final Value<bool> isDirty;
  final Value<String?> nodeId;
  final Value<String> nodePublicKey;
  final Value<String> multiaddressesJson;
  final Value<String> protocolVersion;
  final Value<double> reputationScore;
  final Value<int> latencyMs;
  final Value<bool> isConnected;
  final Value<bool> isBanned;
  final Value<DateTime> lastSeenAt;
  final Value<int> rowid;
  const NodeMetadataCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.version = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.nodeId = const Value.absent(),
    this.nodePublicKey = const Value.absent(),
    this.multiaddressesJson = const Value.absent(),
    this.protocolVersion = const Value.absent(),
    this.reputationScore = const Value.absent(),
    this.latencyMs = const Value.absent(),
    this.isConnected = const Value.absent(),
    this.isBanned = const Value.absent(),
    this.lastSeenAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NodeMetadataCompanion.insert({
    required String id,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.version = const Value.absent(),
    this.isDirty = const Value.absent(),
    this.nodeId = const Value.absent(),
    required String nodePublicKey,
    this.multiaddressesJson = const Value.absent(),
    this.protocolVersion = const Value.absent(),
    this.reputationScore = const Value.absent(),
    this.latencyMs = const Value.absent(),
    this.isConnected = const Value.absent(),
    this.isBanned = const Value.absent(),
    this.lastSeenAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        nodePublicKey = Value(nodePublicKey);
  static Insertable<NodeMetadataData> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<DateTime>? lastSyncedAt,
    Expression<String>? remoteId,
    Expression<int>? version,
    Expression<bool>? isDirty,
    Expression<String>? nodeId,
    Expression<String>? nodePublicKey,
    Expression<String>? multiaddressesJson,
    Expression<String>? protocolVersion,
    Expression<double>? reputationScore,
    Expression<int>? latencyMs,
    Expression<bool>? isConnected,
    Expression<bool>? isBanned,
    Expression<DateTime>? lastSeenAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (remoteId != null) 'remote_id': remoteId,
      if (version != null) 'version': version,
      if (isDirty != null) 'is_dirty': isDirty,
      if (nodeId != null) 'node_id': nodeId,
      if (nodePublicKey != null) 'node_public_key': nodePublicKey,
      if (multiaddressesJson != null) 'multiaddresses_json': multiaddressesJson,
      if (protocolVersion != null) 'protocol_version': protocolVersion,
      if (reputationScore != null) 'reputation_score': reputationScore,
      if (latencyMs != null) 'latency_ms': latencyMs,
      if (isConnected != null) 'is_connected': isConnected,
      if (isBanned != null) 'is_banned': isBanned,
      if (lastSeenAt != null) 'last_seen_at': lastSeenAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NodeMetadataCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? isDeleted,
      Value<DateTime?>? deletedAt,
      Value<String>? syncStatus,
      Value<DateTime?>? lastSyncedAt,
      Value<String?>? remoteId,
      Value<int>? version,
      Value<bool>? isDirty,
      Value<String?>? nodeId,
      Value<String>? nodePublicKey,
      Value<String>? multiaddressesJson,
      Value<String>? protocolVersion,
      Value<double>? reputationScore,
      Value<int>? latencyMs,
      Value<bool>? isConnected,
      Value<bool>? isBanned,
      Value<DateTime>? lastSeenAt,
      Value<int>? rowid}) {
    return NodeMetadataCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      remoteId: remoteId ?? this.remoteId,
      version: version ?? this.version,
      isDirty: isDirty ?? this.isDirty,
      nodeId: nodeId ?? this.nodeId,
      nodePublicKey: nodePublicKey ?? this.nodePublicKey,
      multiaddressesJson: multiaddressesJson ?? this.multiaddressesJson,
      protocolVersion: protocolVersion ?? this.protocolVersion,
      reputationScore: reputationScore ?? this.reputationScore,
      latencyMs: latencyMs ?? this.latencyMs,
      isConnected: isConnected ?? this.isConnected,
      isBanned: isBanned ?? this.isBanned,
      lastSeenAt: lastSeenAt ?? this.lastSeenAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isDirty.present) {
      map['is_dirty'] = Variable<bool>(isDirty.value);
    }
    if (nodeId.present) {
      map['node_id'] = Variable<String>(nodeId.value);
    }
    if (nodePublicKey.present) {
      map['node_public_key'] = Variable<String>(nodePublicKey.value);
    }
    if (multiaddressesJson.present) {
      map['multiaddresses_json'] = Variable<String>(multiaddressesJson.value);
    }
    if (protocolVersion.present) {
      map['protocol_version'] = Variable<String>(protocolVersion.value);
    }
    if (reputationScore.present) {
      map['reputation_score'] = Variable<double>(reputationScore.value);
    }
    if (latencyMs.present) {
      map['latency_ms'] = Variable<int>(latencyMs.value);
    }
    if (isConnected.present) {
      map['is_connected'] = Variable<bool>(isConnected.value);
    }
    if (isBanned.present) {
      map['is_banned'] = Variable<bool>(isBanned.value);
    }
    if (lastSeenAt.present) {
      map['last_seen_at'] = Variable<DateTime>(lastSeenAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NodeMetadataCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('remoteId: $remoteId, ')
          ..write('version: $version, ')
          ..write('isDirty: $isDirty, ')
          ..write('nodeId: $nodeId, ')
          ..write('nodePublicKey: $nodePublicKey, ')
          ..write('multiaddressesJson: $multiaddressesJson, ')
          ..write('protocolVersion: $protocolVersion, ')
          ..write('reputationScore: $reputationScore, ')
          ..write('latencyMs: $latencyMs, ')
          ..write('isConnected: $isConnected, ')
          ..write('isBanned: $isBanned, ')
          ..write('lastSeenAt: $lastSeenAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BooksTable books = $BooksTable(this);
  late final $NotesTable notes = $NotesTable(this);
  late final $ResearchPapersTable researchPapers = $ResearchPapersTable(this);
  late final $DownloadsTable downloads = $DownloadsTable(this);
  late final $FavoritesTable favorites = $FavoritesTable(this);
  late final $ReadingProgressTable readingProgress =
      $ReadingProgressTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $AuthorsTable authors = $AuthorsTable(this);
  late final $SearchHistoryTable searchHistory = $SearchHistoryTable(this);
  late final $RecentSearchesTable recentSearches = $RecentSearchesTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  late final $CacheMetadataTable cacheMetadata = $CacheMetadataTable(this);
  late final $NetworkMetadataTable networkMetadata =
      $NetworkMetadataTable(this);
  late final $NodeMetadataTable nodeMetadata = $NodeMetadataTable(this);
  late final Index booksCidIdx =
      Index('books_cid_idx', 'CREATE INDEX books_cid_idx ON books (cid)');
  late final Index booksCategoryIdx = Index('books_category_idx',
      'CREATE INDEX books_category_idx ON books (category_id)');
  late final Index booksTitleIdx =
      Index('books_title_idx', 'CREATE INDEX books_title_idx ON books (title)');
  late final Index booksIsDeletedIdx = Index('books_is_deleted_idx',
      'CREATE INDEX books_is_deleted_idx ON books (is_deleted)');
  late final Index booksSyncStatusIdx = Index('books_sync_status_idx',
      'CREATE INDEX books_sync_status_idx ON books (sync_status)');
  late final Index notesResourceIdIdx = Index('notes_resource_id_idx',
      'CREATE INDEX notes_resource_id_idx ON notes (resource_id)');
  late final Index notesIsPinnedIdx = Index('notes_is_pinned_idx',
      'CREATE INDEX notes_is_pinned_idx ON notes (is_pinned)');
  late final Index notesIsDeletedIdx = Index('notes_is_deleted_idx',
      'CREATE INDEX notes_is_deleted_idx ON notes (is_deleted)');
  late final Index notesUpdatedAtIdx = Index('notes_updated_at_idx',
      'CREATE INDEX notes_updated_at_idx ON notes (updated_at)');
  late final Index papersCidIdx = Index(
      'papers_cid_idx', 'CREATE INDEX papers_cid_idx ON research_papers (cid)');
  late final Index papersDoiIdx = Index(
      'papers_doi_idx', 'CREATE INDEX papers_doi_idx ON research_papers (doi)');
  late final Index papersArxivIdx = Index('papers_arxiv_idx',
      'CREATE INDEX papers_arxiv_idx ON research_papers (arxiv_id)');
  late final Index papersCategoryIdx = Index('papers_category_idx',
      'CREATE INDEX papers_category_idx ON research_papers (category_id)');
  late final Index papersIsDeletedIdx = Index('papers_is_deleted_idx',
      'CREATE INDEX papers_is_deleted_idx ON research_papers (is_deleted)');
  late final Index papersTitleIdx = Index('papers_title_idx',
      'CREATE INDEX papers_title_idx ON research_papers (title)');
  late final Index downloadsResourceIdIdx = Index('downloads_resource_id_idx',
      'CREATE INDEX downloads_resource_id_idx ON downloads (resource_id)');
  late final Index downloadsStatusIdx = Index('downloads_status_idx',
      'CREATE INDEX downloads_status_idx ON downloads (download_status)');
  late final Index downloadsIsDeletedIdx = Index('downloads_is_deleted_idx',
      'CREATE INDEX downloads_is_deleted_idx ON downloads (is_deleted)');
  late final Index downloadsCreatedAtIdx = Index('downloads_created_at_idx',
      'CREATE INDEX downloads_created_at_idx ON downloads (created_at)');
  late final Index favoritesResourceIdIdx = Index('favorites_resource_id_idx',
      'CREATE INDEX favorites_resource_id_idx ON favorites (resource_id)');
  late final Index favoritesCategoryIdx = Index('favorites_category_idx',
      'CREATE INDEX favorites_category_idx ON favorites (category_id)');
  late final Index favoritesIsDeletedIdx = Index('favorites_is_deleted_idx',
      'CREATE INDEX favorites_is_deleted_idx ON favorites (is_deleted)');
  late final Index readingProgressResourceIdIdx = Index(
      'reading_progress_resource_id_idx',
      'CREATE INDEX reading_progress_resource_id_idx ON reading_progress (resource_id)');
  late final Index readingProgressLastReadIdx = Index(
      'reading_progress_last_read_idx',
      'CREATE INDEX reading_progress_last_read_idx ON reading_progress (last_read_at)');
  late final Index readingProgressIsDeletedIdx = Index(
      'reading_progress_is_deleted_idx',
      'CREATE INDEX reading_progress_is_deleted_idx ON reading_progress (is_deleted)');
  late final Index categoriesSlugIdx = Index('categories_slug_idx',
      'CREATE INDEX categories_slug_idx ON categories (slug)');
  late final Index categoriesDisplayOrderIdx = Index(
      'categories_display_order_idx',
      'CREATE INDEX categories_display_order_idx ON categories (display_order)');
  late final Index categoriesIsDeletedIdx = Index('categories_is_deleted_idx',
      'CREATE INDEX categories_is_deleted_idx ON categories (is_deleted)');
  late final Index authorsNameIdx = Index(
      'authors_name_idx', 'CREATE INDEX authors_name_idx ON authors (name)');
  late final Index authorsOrcidIdx = Index(
      'authors_orcid_idx', 'CREATE INDEX authors_orcid_idx ON authors (orcid)');
  late final Index authorsIsDeletedIdx = Index('authors_is_deleted_idx',
      'CREATE INDEX authors_is_deleted_idx ON authors (is_deleted)');
  late final Index searchHistoryQueryIdx = Index('search_history_query_idx',
      'CREATE INDEX search_history_query_idx ON search_history ("query")');
  late final Index searchHistorySearchedAtIdx = Index(
      'search_history_searched_at_idx',
      'CREATE INDEX search_history_searched_at_idx ON search_history (searched_at)');
  late final Index searchHistoryIsDeletedIdx = Index(
      'search_history_is_deleted_idx',
      'CREATE INDEX search_history_is_deleted_idx ON search_history (is_deleted)');
  late final Index recentSearchesTermIdx = Index('recent_searches_term_idx',
      'CREATE INDEX recent_searches_term_idx ON recent_searches (term)');
  late final Index recentSearchesLastQueriedIdx = Index(
      'recent_searches_last_queried_idx',
      'CREATE INDEX recent_searches_last_queried_idx ON recent_searches (last_queried_at)');
  late final Index recentSearchesIsDeletedIdx = Index(
      'recent_searches_is_deleted_idx',
      'CREATE INDEX recent_searches_is_deleted_idx ON recent_searches (is_deleted)');
  late final Index settingsKeyIdx = Index(
      'settings_key_idx', 'CREATE INDEX settings_key_idx ON settings ("key")');
  late final Index settingsCategoryIdx = Index('settings_category_idx',
      'CREATE INDEX settings_category_idx ON settings (category)');
  late final Index settingsIsDeletedIdx = Index('settings_is_deleted_idx',
      'CREATE INDEX settings_is_deleted_idx ON settings (is_deleted)');
  late final Index cacheKeyIdx = Index('cache_key_idx',
      'CREATE INDEX cache_key_idx ON cache_metadata (cache_key)');
  late final Index cacheExpiresAtIdx = Index('cache_expires_at_idx',
      'CREATE INDEX cache_expires_at_idx ON cache_metadata (expires_at)');
  late final Index cacheLastAccessedIdx = Index('cache_last_accessed_idx',
      'CREATE INDEX cache_last_accessed_idx ON cache_metadata (last_accessed_at)');
  late final Index networkSwarmIdx = Index('network_swarm_idx',
      'CREATE INDEX network_swarm_idx ON network_metadata (swarm_id)');
  late final Index networkHealthIdx = Index('network_health_idx',
      'CREATE INDEX network_health_idx ON network_metadata (last_health_check_at)');
  late final Index nodesPublicKeyIdx = Index('nodes_public_key_idx',
      'CREATE INDEX nodes_public_key_idx ON node_metadata (node_public_key)');
  late final Index nodesIsConnectedIdx = Index('nodes_is_connected_idx',
      'CREATE INDEX nodes_is_connected_idx ON node_metadata (is_connected)');
  late final Index nodesLastSeenIdx = Index('nodes_last_seen_idx',
      'CREATE INDEX nodes_last_seen_idx ON node_metadata (last_seen_at)');
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        books,
        notes,
        researchPapers,
        downloads,
        favorites,
        readingProgress,
        categories,
        authors,
        searchHistory,
        recentSearches,
        settings,
        cacheMetadata,
        networkMetadata,
        nodeMetadata,
        booksCidIdx,
        booksCategoryIdx,
        booksTitleIdx,
        booksIsDeletedIdx,
        booksSyncStatusIdx,
        notesResourceIdIdx,
        notesIsPinnedIdx,
        notesIsDeletedIdx,
        notesUpdatedAtIdx,
        papersCidIdx,
        papersDoiIdx,
        papersArxivIdx,
        papersCategoryIdx,
        papersIsDeletedIdx,
        papersTitleIdx,
        downloadsResourceIdIdx,
        downloadsStatusIdx,
        downloadsIsDeletedIdx,
        downloadsCreatedAtIdx,
        favoritesResourceIdIdx,
        favoritesCategoryIdx,
        favoritesIsDeletedIdx,
        readingProgressResourceIdIdx,
        readingProgressLastReadIdx,
        readingProgressIsDeletedIdx,
        categoriesSlugIdx,
        categoriesDisplayOrderIdx,
        categoriesIsDeletedIdx,
        authorsNameIdx,
        authorsOrcidIdx,
        authorsIsDeletedIdx,
        searchHistoryQueryIdx,
        searchHistorySearchedAtIdx,
        searchHistoryIsDeletedIdx,
        recentSearchesTermIdx,
        recentSearchesLastQueriedIdx,
        recentSearchesIsDeletedIdx,
        settingsKeyIdx,
        settingsCategoryIdx,
        settingsIsDeletedIdx,
        cacheKeyIdx,
        cacheExpiresAtIdx,
        cacheLastAccessedIdx,
        networkSwarmIdx,
        networkHealthIdx,
        nodesPublicKeyIdx,
        nodesIsConnectedIdx,
        nodesLastSeenIdx
      ];
}

typedef $$BooksTableCreateCompanionBuilder = BooksCompanion Function({
  required String id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> version,
  Value<bool> isDirty,
  Value<String?> nodeId,
  required String title,
  Value<String?> subtitle,
  Value<String> authorsJson,
  Value<String?> publisher,
  Value<int?> publicationYear,
  Value<String?> isbn,
  Value<String?> doi,
  Value<String> language,
  Value<int> pageCount,
  Value<String> format,
  Value<int> sizeBytes,
  Value<String?> coverPath,
  Value<String?> cid,
  Value<String?> contentHash,
  Value<String> verificationTier,
  Value<String?> categoryId,
  Value<String> metadataJson,
  Value<bool> isDownloaded,
  Value<int> peerSeeders,
  Value<int> rowid,
});
typedef $$BooksTableUpdateCompanionBuilder = BooksCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> version,
  Value<bool> isDirty,
  Value<String?> nodeId,
  Value<String> title,
  Value<String?> subtitle,
  Value<String> authorsJson,
  Value<String?> publisher,
  Value<int?> publicationYear,
  Value<String?> isbn,
  Value<String?> doi,
  Value<String> language,
  Value<int> pageCount,
  Value<String> format,
  Value<int> sizeBytes,
  Value<String?> coverPath,
  Value<String?> cid,
  Value<String?> contentHash,
  Value<String> verificationTier,
  Value<String?> categoryId,
  Value<String> metadataJson,
  Value<bool> isDownloaded,
  Value<int> peerSeeders,
  Value<int> rowid,
});

class $$BooksTableFilterComposer extends Composer<_$AppDatabase, $BooksTable> {
  $$BooksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDirty => $composableBuilder(
      column: $table.isDirty, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nodeId => $composableBuilder(
      column: $table.nodeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get subtitle => $composableBuilder(
      column: $table.subtitle, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get authorsJson => $composableBuilder(
      column: $table.authorsJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get publisher => $composableBuilder(
      column: $table.publisher, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get publicationYear => $composableBuilder(
      column: $table.publicationYear,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get isbn => $composableBuilder(
      column: $table.isbn, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get doi => $composableBuilder(
      column: $table.doi, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get language => $composableBuilder(
      column: $table.language, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get pageCount => $composableBuilder(
      column: $table.pageCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get format => $composableBuilder(
      column: $table.format, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sizeBytes => $composableBuilder(
      column: $table.sizeBytes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get coverPath => $composableBuilder(
      column: $table.coverPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cid => $composableBuilder(
      column: $table.cid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get contentHash => $composableBuilder(
      column: $table.contentHash, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get verificationTier => $composableBuilder(
      column: $table.verificationTier,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get metadataJson => $composableBuilder(
      column: $table.metadataJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDownloaded => $composableBuilder(
      column: $table.isDownloaded, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get peerSeeders => $composableBuilder(
      column: $table.peerSeeders, builder: (column) => ColumnFilters(column));
}

class $$BooksTableOrderingComposer
    extends Composer<_$AppDatabase, $BooksTable> {
  $$BooksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDirty => $composableBuilder(
      column: $table.isDirty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nodeId => $composableBuilder(
      column: $table.nodeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subtitle => $composableBuilder(
      column: $table.subtitle, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get authorsJson => $composableBuilder(
      column: $table.authorsJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get publisher => $composableBuilder(
      column: $table.publisher, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get publicationYear => $composableBuilder(
      column: $table.publicationYear,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get isbn => $composableBuilder(
      column: $table.isbn, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get doi => $composableBuilder(
      column: $table.doi, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get language => $composableBuilder(
      column: $table.language, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get pageCount => $composableBuilder(
      column: $table.pageCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get format => $composableBuilder(
      column: $table.format, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sizeBytes => $composableBuilder(
      column: $table.sizeBytes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get coverPath => $composableBuilder(
      column: $table.coverPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cid => $composableBuilder(
      column: $table.cid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contentHash => $composableBuilder(
      column: $table.contentHash, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get verificationTier => $composableBuilder(
      column: $table.verificationTier,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get metadataJson => $composableBuilder(
      column: $table.metadataJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDownloaded => $composableBuilder(
      column: $table.isDownloaded,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get peerSeeders => $composableBuilder(
      column: $table.peerSeeders, builder: (column) => ColumnOrderings(column));
}

class $$BooksTableAnnotationComposer
    extends Composer<_$AppDatabase, $BooksTable> {
  $$BooksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isDirty =>
      $composableBuilder(column: $table.isDirty, builder: (column) => column);

  GeneratedColumn<String> get nodeId =>
      $composableBuilder(column: $table.nodeId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get subtitle =>
      $composableBuilder(column: $table.subtitle, builder: (column) => column);

  GeneratedColumn<String> get authorsJson => $composableBuilder(
      column: $table.authorsJson, builder: (column) => column);

  GeneratedColumn<String> get publisher =>
      $composableBuilder(column: $table.publisher, builder: (column) => column);

  GeneratedColumn<int> get publicationYear => $composableBuilder(
      column: $table.publicationYear, builder: (column) => column);

  GeneratedColumn<String> get isbn =>
      $composableBuilder(column: $table.isbn, builder: (column) => column);

  GeneratedColumn<String> get doi =>
      $composableBuilder(column: $table.doi, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<int> get pageCount =>
      $composableBuilder(column: $table.pageCount, builder: (column) => column);

  GeneratedColumn<String> get format =>
      $composableBuilder(column: $table.format, builder: (column) => column);

  GeneratedColumn<int> get sizeBytes =>
      $composableBuilder(column: $table.sizeBytes, builder: (column) => column);

  GeneratedColumn<String> get coverPath =>
      $composableBuilder(column: $table.coverPath, builder: (column) => column);

  GeneratedColumn<String> get cid =>
      $composableBuilder(column: $table.cid, builder: (column) => column);

  GeneratedColumn<String> get contentHash => $composableBuilder(
      column: $table.contentHash, builder: (column) => column);

  GeneratedColumn<String> get verificationTier => $composableBuilder(
      column: $table.verificationTier, builder: (column) => column);

  GeneratedColumn<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => column);

  GeneratedColumn<String> get metadataJson => $composableBuilder(
      column: $table.metadataJson, builder: (column) => column);

  GeneratedColumn<bool> get isDownloaded => $composableBuilder(
      column: $table.isDownloaded, builder: (column) => column);

  GeneratedColumn<int> get peerSeeders => $composableBuilder(
      column: $table.peerSeeders, builder: (column) => column);
}

class $$BooksTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BooksTable,
    Book,
    $$BooksTableFilterComposer,
    $$BooksTableOrderingComposer,
    $$BooksTableAnnotationComposer,
    $$BooksTableCreateCompanionBuilder,
    $$BooksTableUpdateCompanionBuilder,
    (Book, BaseReferences<_$AppDatabase, $BooksTable, Book>),
    Book,
    PrefetchHooks Function()> {
  $$BooksTableTableManager(_$AppDatabase db, $BooksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BooksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BooksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BooksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<String?> nodeId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> subtitle = const Value.absent(),
            Value<String> authorsJson = const Value.absent(),
            Value<String?> publisher = const Value.absent(),
            Value<int?> publicationYear = const Value.absent(),
            Value<String?> isbn = const Value.absent(),
            Value<String?> doi = const Value.absent(),
            Value<String> language = const Value.absent(),
            Value<int> pageCount = const Value.absent(),
            Value<String> format = const Value.absent(),
            Value<int> sizeBytes = const Value.absent(),
            Value<String?> coverPath = const Value.absent(),
            Value<String?> cid = const Value.absent(),
            Value<String?> contentHash = const Value.absent(),
            Value<String> verificationTier = const Value.absent(),
            Value<String?> categoryId = const Value.absent(),
            Value<String> metadataJson = const Value.absent(),
            Value<bool> isDownloaded = const Value.absent(),
            Value<int> peerSeeders = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BooksCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            version: version,
            isDirty: isDirty,
            nodeId: nodeId,
            title: title,
            subtitle: subtitle,
            authorsJson: authorsJson,
            publisher: publisher,
            publicationYear: publicationYear,
            isbn: isbn,
            doi: doi,
            language: language,
            pageCount: pageCount,
            format: format,
            sizeBytes: sizeBytes,
            coverPath: coverPath,
            cid: cid,
            contentHash: contentHash,
            verificationTier: verificationTier,
            categoryId: categoryId,
            metadataJson: metadataJson,
            isDownloaded: isDownloaded,
            peerSeeders: peerSeeders,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<String?> nodeId = const Value.absent(),
            required String title,
            Value<String?> subtitle = const Value.absent(),
            Value<String> authorsJson = const Value.absent(),
            Value<String?> publisher = const Value.absent(),
            Value<int?> publicationYear = const Value.absent(),
            Value<String?> isbn = const Value.absent(),
            Value<String?> doi = const Value.absent(),
            Value<String> language = const Value.absent(),
            Value<int> pageCount = const Value.absent(),
            Value<String> format = const Value.absent(),
            Value<int> sizeBytes = const Value.absent(),
            Value<String?> coverPath = const Value.absent(),
            Value<String?> cid = const Value.absent(),
            Value<String?> contentHash = const Value.absent(),
            Value<String> verificationTier = const Value.absent(),
            Value<String?> categoryId = const Value.absent(),
            Value<String> metadataJson = const Value.absent(),
            Value<bool> isDownloaded = const Value.absent(),
            Value<int> peerSeeders = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BooksCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            version: version,
            isDirty: isDirty,
            nodeId: nodeId,
            title: title,
            subtitle: subtitle,
            authorsJson: authorsJson,
            publisher: publisher,
            publicationYear: publicationYear,
            isbn: isbn,
            doi: doi,
            language: language,
            pageCount: pageCount,
            format: format,
            sizeBytes: sizeBytes,
            coverPath: coverPath,
            cid: cid,
            contentHash: contentHash,
            verificationTier: verificationTier,
            categoryId: categoryId,
            metadataJson: metadataJson,
            isDownloaded: isDownloaded,
            peerSeeders: peerSeeders,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BooksTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BooksTable,
    Book,
    $$BooksTableFilterComposer,
    $$BooksTableOrderingComposer,
    $$BooksTableAnnotationComposer,
    $$BooksTableCreateCompanionBuilder,
    $$BooksTableUpdateCompanionBuilder,
    (Book, BaseReferences<_$AppDatabase, $BooksTable, Book>),
    Book,
    PrefetchHooks Function()>;
typedef $$NotesTableCreateCompanionBuilder = NotesCompanion Function({
  required String id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> version,
  Value<bool> isDirty,
  Value<String?> nodeId,
  required String title,
  required String content,
  Value<String?> resourceId,
  Value<String> resourceType,
  Value<String?> colorHex,
  Value<String> tagsJson,
  Value<bool> isPinned,
  Value<String?> readingPosition,
  Value<int> rowid,
});
typedef $$NotesTableUpdateCompanionBuilder = NotesCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> version,
  Value<bool> isDirty,
  Value<String?> nodeId,
  Value<String> title,
  Value<String> content,
  Value<String?> resourceId,
  Value<String> resourceType,
  Value<String?> colorHex,
  Value<String> tagsJson,
  Value<bool> isPinned,
  Value<String?> readingPosition,
  Value<int> rowid,
});

class $$NotesTableFilterComposer extends Composer<_$AppDatabase, $NotesTable> {
  $$NotesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDirty => $composableBuilder(
      column: $table.isDirty, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nodeId => $composableBuilder(
      column: $table.nodeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get resourceId => $composableBuilder(
      column: $table.resourceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get resourceType => $composableBuilder(
      column: $table.resourceType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get colorHex => $composableBuilder(
      column: $table.colorHex, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tagsJson => $composableBuilder(
      column: $table.tagsJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isPinned => $composableBuilder(
      column: $table.isPinned, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get readingPosition => $composableBuilder(
      column: $table.readingPosition,
      builder: (column) => ColumnFilters(column));
}

class $$NotesTableOrderingComposer
    extends Composer<_$AppDatabase, $NotesTable> {
  $$NotesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDirty => $composableBuilder(
      column: $table.isDirty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nodeId => $composableBuilder(
      column: $table.nodeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get resourceId => $composableBuilder(
      column: $table.resourceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get resourceType => $composableBuilder(
      column: $table.resourceType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get colorHex => $composableBuilder(
      column: $table.colorHex, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tagsJson => $composableBuilder(
      column: $table.tagsJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isPinned => $composableBuilder(
      column: $table.isPinned, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get readingPosition => $composableBuilder(
      column: $table.readingPosition,
      builder: (column) => ColumnOrderings(column));
}

class $$NotesTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotesTable> {
  $$NotesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isDirty =>
      $composableBuilder(column: $table.isDirty, builder: (column) => column);

  GeneratedColumn<String> get nodeId =>
      $composableBuilder(column: $table.nodeId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get resourceId => $composableBuilder(
      column: $table.resourceId, builder: (column) => column);

  GeneratedColumn<String> get resourceType => $composableBuilder(
      column: $table.resourceType, builder: (column) => column);

  GeneratedColumn<String> get colorHex =>
      $composableBuilder(column: $table.colorHex, builder: (column) => column);

  GeneratedColumn<String> get tagsJson =>
      $composableBuilder(column: $table.tagsJson, builder: (column) => column);

  GeneratedColumn<bool> get isPinned =>
      $composableBuilder(column: $table.isPinned, builder: (column) => column);

  GeneratedColumn<String> get readingPosition => $composableBuilder(
      column: $table.readingPosition, builder: (column) => column);
}

class $$NotesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NotesTable,
    Note,
    $$NotesTableFilterComposer,
    $$NotesTableOrderingComposer,
    $$NotesTableAnnotationComposer,
    $$NotesTableCreateCompanionBuilder,
    $$NotesTableUpdateCompanionBuilder,
    (Note, BaseReferences<_$AppDatabase, $NotesTable, Note>),
    Note,
    PrefetchHooks Function()> {
  $$NotesTableTableManager(_$AppDatabase db, $NotesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<String?> nodeId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<String?> resourceId = const Value.absent(),
            Value<String> resourceType = const Value.absent(),
            Value<String?> colorHex = const Value.absent(),
            Value<String> tagsJson = const Value.absent(),
            Value<bool> isPinned = const Value.absent(),
            Value<String?> readingPosition = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              NotesCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            version: version,
            isDirty: isDirty,
            nodeId: nodeId,
            title: title,
            content: content,
            resourceId: resourceId,
            resourceType: resourceType,
            colorHex: colorHex,
            tagsJson: tagsJson,
            isPinned: isPinned,
            readingPosition: readingPosition,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<String?> nodeId = const Value.absent(),
            required String title,
            required String content,
            Value<String?> resourceId = const Value.absent(),
            Value<String> resourceType = const Value.absent(),
            Value<String?> colorHex = const Value.absent(),
            Value<String> tagsJson = const Value.absent(),
            Value<bool> isPinned = const Value.absent(),
            Value<String?> readingPosition = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              NotesCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            version: version,
            isDirty: isDirty,
            nodeId: nodeId,
            title: title,
            content: content,
            resourceId: resourceId,
            resourceType: resourceType,
            colorHex: colorHex,
            tagsJson: tagsJson,
            isPinned: isPinned,
            readingPosition: readingPosition,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$NotesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $NotesTable,
    Note,
    $$NotesTableFilterComposer,
    $$NotesTableOrderingComposer,
    $$NotesTableAnnotationComposer,
    $$NotesTableCreateCompanionBuilder,
    $$NotesTableUpdateCompanionBuilder,
    (Note, BaseReferences<_$AppDatabase, $NotesTable, Note>),
    Note,
    PrefetchHooks Function()>;
typedef $$ResearchPapersTableCreateCompanionBuilder = ResearchPapersCompanion
    Function({
  required String id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> version,
  Value<bool> isDirty,
  Value<String?> nodeId,
  required String title,
  Value<String> abstractText,
  Value<String> authorsJson,
  Value<String?> journal,
  Value<String?> conference,
  Value<String?> volume,
  Value<String?> issue,
  Value<String?> pages,
  Value<String?> doi,
  Value<String?> arxivId,
  Value<String?> pubmedId,
  Value<int?> publicationYear,
  Value<bool> isPeerReviewed,
  Value<int> citationsCount,
  Value<String?> cid,
  Value<String?> contentHash,
  Value<int> sizeBytes,
  Value<String> format,
  Value<String?> categoryId,
  Value<String> verificationTier,
  Value<bool> isDownloaded,
  Value<int> peerSeeders,
  Value<int> rowid,
});
typedef $$ResearchPapersTableUpdateCompanionBuilder = ResearchPapersCompanion
    Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> version,
  Value<bool> isDirty,
  Value<String?> nodeId,
  Value<String> title,
  Value<String> abstractText,
  Value<String> authorsJson,
  Value<String?> journal,
  Value<String?> conference,
  Value<String?> volume,
  Value<String?> issue,
  Value<String?> pages,
  Value<String?> doi,
  Value<String?> arxivId,
  Value<String?> pubmedId,
  Value<int?> publicationYear,
  Value<bool> isPeerReviewed,
  Value<int> citationsCount,
  Value<String?> cid,
  Value<String?> contentHash,
  Value<int> sizeBytes,
  Value<String> format,
  Value<String?> categoryId,
  Value<String> verificationTier,
  Value<bool> isDownloaded,
  Value<int> peerSeeders,
  Value<int> rowid,
});

class $$ResearchPapersTableFilterComposer
    extends Composer<_$AppDatabase, $ResearchPapersTable> {
  $$ResearchPapersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDirty => $composableBuilder(
      column: $table.isDirty, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nodeId => $composableBuilder(
      column: $table.nodeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get abstractText => $composableBuilder(
      column: $table.abstractText, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get authorsJson => $composableBuilder(
      column: $table.authorsJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get journal => $composableBuilder(
      column: $table.journal, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get conference => $composableBuilder(
      column: $table.conference, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get volume => $composableBuilder(
      column: $table.volume, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get issue => $composableBuilder(
      column: $table.issue, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pages => $composableBuilder(
      column: $table.pages, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get doi => $composableBuilder(
      column: $table.doi, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get arxivId => $composableBuilder(
      column: $table.arxivId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pubmedId => $composableBuilder(
      column: $table.pubmedId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get publicationYear => $composableBuilder(
      column: $table.publicationYear,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isPeerReviewed => $composableBuilder(
      column: $table.isPeerReviewed,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get citationsCount => $composableBuilder(
      column: $table.citationsCount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cid => $composableBuilder(
      column: $table.cid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get contentHash => $composableBuilder(
      column: $table.contentHash, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sizeBytes => $composableBuilder(
      column: $table.sizeBytes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get format => $composableBuilder(
      column: $table.format, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get verificationTier => $composableBuilder(
      column: $table.verificationTier,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDownloaded => $composableBuilder(
      column: $table.isDownloaded, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get peerSeeders => $composableBuilder(
      column: $table.peerSeeders, builder: (column) => ColumnFilters(column));
}

class $$ResearchPapersTableOrderingComposer
    extends Composer<_$AppDatabase, $ResearchPapersTable> {
  $$ResearchPapersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDirty => $composableBuilder(
      column: $table.isDirty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nodeId => $composableBuilder(
      column: $table.nodeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get abstractText => $composableBuilder(
      column: $table.abstractText,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get authorsJson => $composableBuilder(
      column: $table.authorsJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get journal => $composableBuilder(
      column: $table.journal, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get conference => $composableBuilder(
      column: $table.conference, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get volume => $composableBuilder(
      column: $table.volume, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get issue => $composableBuilder(
      column: $table.issue, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pages => $composableBuilder(
      column: $table.pages, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get doi => $composableBuilder(
      column: $table.doi, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get arxivId => $composableBuilder(
      column: $table.arxivId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pubmedId => $composableBuilder(
      column: $table.pubmedId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get publicationYear => $composableBuilder(
      column: $table.publicationYear,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isPeerReviewed => $composableBuilder(
      column: $table.isPeerReviewed,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get citationsCount => $composableBuilder(
      column: $table.citationsCount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cid => $composableBuilder(
      column: $table.cid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contentHash => $composableBuilder(
      column: $table.contentHash, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sizeBytes => $composableBuilder(
      column: $table.sizeBytes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get format => $composableBuilder(
      column: $table.format, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get verificationTier => $composableBuilder(
      column: $table.verificationTier,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDownloaded => $composableBuilder(
      column: $table.isDownloaded,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get peerSeeders => $composableBuilder(
      column: $table.peerSeeders, builder: (column) => ColumnOrderings(column));
}

class $$ResearchPapersTableAnnotationComposer
    extends Composer<_$AppDatabase, $ResearchPapersTable> {
  $$ResearchPapersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isDirty =>
      $composableBuilder(column: $table.isDirty, builder: (column) => column);

  GeneratedColumn<String> get nodeId =>
      $composableBuilder(column: $table.nodeId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get abstractText => $composableBuilder(
      column: $table.abstractText, builder: (column) => column);

  GeneratedColumn<String> get authorsJson => $composableBuilder(
      column: $table.authorsJson, builder: (column) => column);

  GeneratedColumn<String> get journal =>
      $composableBuilder(column: $table.journal, builder: (column) => column);

  GeneratedColumn<String> get conference => $composableBuilder(
      column: $table.conference, builder: (column) => column);

  GeneratedColumn<String> get volume =>
      $composableBuilder(column: $table.volume, builder: (column) => column);

  GeneratedColumn<String> get issue =>
      $composableBuilder(column: $table.issue, builder: (column) => column);

  GeneratedColumn<String> get pages =>
      $composableBuilder(column: $table.pages, builder: (column) => column);

  GeneratedColumn<String> get doi =>
      $composableBuilder(column: $table.doi, builder: (column) => column);

  GeneratedColumn<String> get arxivId =>
      $composableBuilder(column: $table.arxivId, builder: (column) => column);

  GeneratedColumn<String> get pubmedId =>
      $composableBuilder(column: $table.pubmedId, builder: (column) => column);

  GeneratedColumn<int> get publicationYear => $composableBuilder(
      column: $table.publicationYear, builder: (column) => column);

  GeneratedColumn<bool> get isPeerReviewed => $composableBuilder(
      column: $table.isPeerReviewed, builder: (column) => column);

  GeneratedColumn<int> get citationsCount => $composableBuilder(
      column: $table.citationsCount, builder: (column) => column);

  GeneratedColumn<String> get cid =>
      $composableBuilder(column: $table.cid, builder: (column) => column);

  GeneratedColumn<String> get contentHash => $composableBuilder(
      column: $table.contentHash, builder: (column) => column);

  GeneratedColumn<int> get sizeBytes =>
      $composableBuilder(column: $table.sizeBytes, builder: (column) => column);

  GeneratedColumn<String> get format =>
      $composableBuilder(column: $table.format, builder: (column) => column);

  GeneratedColumn<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => column);

  GeneratedColumn<String> get verificationTier => $composableBuilder(
      column: $table.verificationTier, builder: (column) => column);

  GeneratedColumn<bool> get isDownloaded => $composableBuilder(
      column: $table.isDownloaded, builder: (column) => column);

  GeneratedColumn<int> get peerSeeders => $composableBuilder(
      column: $table.peerSeeders, builder: (column) => column);
}

class $$ResearchPapersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ResearchPapersTable,
    ResearchPaper,
    $$ResearchPapersTableFilterComposer,
    $$ResearchPapersTableOrderingComposer,
    $$ResearchPapersTableAnnotationComposer,
    $$ResearchPapersTableCreateCompanionBuilder,
    $$ResearchPapersTableUpdateCompanionBuilder,
    (
      ResearchPaper,
      BaseReferences<_$AppDatabase, $ResearchPapersTable, ResearchPaper>
    ),
    ResearchPaper,
    PrefetchHooks Function()> {
  $$ResearchPapersTableTableManager(
      _$AppDatabase db, $ResearchPapersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ResearchPapersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ResearchPapersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ResearchPapersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<String?> nodeId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> abstractText = const Value.absent(),
            Value<String> authorsJson = const Value.absent(),
            Value<String?> journal = const Value.absent(),
            Value<String?> conference = const Value.absent(),
            Value<String?> volume = const Value.absent(),
            Value<String?> issue = const Value.absent(),
            Value<String?> pages = const Value.absent(),
            Value<String?> doi = const Value.absent(),
            Value<String?> arxivId = const Value.absent(),
            Value<String?> pubmedId = const Value.absent(),
            Value<int?> publicationYear = const Value.absent(),
            Value<bool> isPeerReviewed = const Value.absent(),
            Value<int> citationsCount = const Value.absent(),
            Value<String?> cid = const Value.absent(),
            Value<String?> contentHash = const Value.absent(),
            Value<int> sizeBytes = const Value.absent(),
            Value<String> format = const Value.absent(),
            Value<String?> categoryId = const Value.absent(),
            Value<String> verificationTier = const Value.absent(),
            Value<bool> isDownloaded = const Value.absent(),
            Value<int> peerSeeders = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ResearchPapersCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            version: version,
            isDirty: isDirty,
            nodeId: nodeId,
            title: title,
            abstractText: abstractText,
            authorsJson: authorsJson,
            journal: journal,
            conference: conference,
            volume: volume,
            issue: issue,
            pages: pages,
            doi: doi,
            arxivId: arxivId,
            pubmedId: pubmedId,
            publicationYear: publicationYear,
            isPeerReviewed: isPeerReviewed,
            citationsCount: citationsCount,
            cid: cid,
            contentHash: contentHash,
            sizeBytes: sizeBytes,
            format: format,
            categoryId: categoryId,
            verificationTier: verificationTier,
            isDownloaded: isDownloaded,
            peerSeeders: peerSeeders,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<String?> nodeId = const Value.absent(),
            required String title,
            Value<String> abstractText = const Value.absent(),
            Value<String> authorsJson = const Value.absent(),
            Value<String?> journal = const Value.absent(),
            Value<String?> conference = const Value.absent(),
            Value<String?> volume = const Value.absent(),
            Value<String?> issue = const Value.absent(),
            Value<String?> pages = const Value.absent(),
            Value<String?> doi = const Value.absent(),
            Value<String?> arxivId = const Value.absent(),
            Value<String?> pubmedId = const Value.absent(),
            Value<int?> publicationYear = const Value.absent(),
            Value<bool> isPeerReviewed = const Value.absent(),
            Value<int> citationsCount = const Value.absent(),
            Value<String?> cid = const Value.absent(),
            Value<String?> contentHash = const Value.absent(),
            Value<int> sizeBytes = const Value.absent(),
            Value<String> format = const Value.absent(),
            Value<String?> categoryId = const Value.absent(),
            Value<String> verificationTier = const Value.absent(),
            Value<bool> isDownloaded = const Value.absent(),
            Value<int> peerSeeders = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ResearchPapersCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            version: version,
            isDirty: isDirty,
            nodeId: nodeId,
            title: title,
            abstractText: abstractText,
            authorsJson: authorsJson,
            journal: journal,
            conference: conference,
            volume: volume,
            issue: issue,
            pages: pages,
            doi: doi,
            arxivId: arxivId,
            pubmedId: pubmedId,
            publicationYear: publicationYear,
            isPeerReviewed: isPeerReviewed,
            citationsCount: citationsCount,
            cid: cid,
            contentHash: contentHash,
            sizeBytes: sizeBytes,
            format: format,
            categoryId: categoryId,
            verificationTier: verificationTier,
            isDownloaded: isDownloaded,
            peerSeeders: peerSeeders,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ResearchPapersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ResearchPapersTable,
    ResearchPaper,
    $$ResearchPapersTableFilterComposer,
    $$ResearchPapersTableOrderingComposer,
    $$ResearchPapersTableAnnotationComposer,
    $$ResearchPapersTableCreateCompanionBuilder,
    $$ResearchPapersTableUpdateCompanionBuilder,
    (
      ResearchPaper,
      BaseReferences<_$AppDatabase, $ResearchPapersTable, ResearchPaper>
    ),
    ResearchPaper,
    PrefetchHooks Function()>;
typedef $$DownloadsTableCreateCompanionBuilder = DownloadsCompanion Function({
  required String id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> version,
  Value<bool> isDirty,
  Value<String?> nodeId,
  required String resourceId,
  Value<String> resourceType,
  required String title,
  Value<String?> filePath,
  Value<int> fileSizeBytes,
  Value<int> bytesDownloaded,
  Value<String> downloadStatus,
  Value<int> downloadSpeedBps,
  Value<double> progress,
  Value<String?> errorMessage,
  Value<String?> cid,
  Value<int> peerCount,
  Value<DateTime?> completedAt,
  Value<int> rowid,
});
typedef $$DownloadsTableUpdateCompanionBuilder = DownloadsCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> version,
  Value<bool> isDirty,
  Value<String?> nodeId,
  Value<String> resourceId,
  Value<String> resourceType,
  Value<String> title,
  Value<String?> filePath,
  Value<int> fileSizeBytes,
  Value<int> bytesDownloaded,
  Value<String> downloadStatus,
  Value<int> downloadSpeedBps,
  Value<double> progress,
  Value<String?> errorMessage,
  Value<String?> cid,
  Value<int> peerCount,
  Value<DateTime?> completedAt,
  Value<int> rowid,
});

class $$DownloadsTableFilterComposer
    extends Composer<_$AppDatabase, $DownloadsTable> {
  $$DownloadsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDirty => $composableBuilder(
      column: $table.isDirty, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nodeId => $composableBuilder(
      column: $table.nodeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get resourceId => $composableBuilder(
      column: $table.resourceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get resourceType => $composableBuilder(
      column: $table.resourceType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get filePath => $composableBuilder(
      column: $table.filePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get fileSizeBytes => $composableBuilder(
      column: $table.fileSizeBytes, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get bytesDownloaded => $composableBuilder(
      column: $table.bytesDownloaded,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get downloadStatus => $composableBuilder(
      column: $table.downloadStatus,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get downloadSpeedBps => $composableBuilder(
      column: $table.downloadSpeedBps,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get progress => $composableBuilder(
      column: $table.progress, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get errorMessage => $composableBuilder(
      column: $table.errorMessage, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cid => $composableBuilder(
      column: $table.cid, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get peerCount => $composableBuilder(
      column: $table.peerCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnFilters(column));
}

class $$DownloadsTableOrderingComposer
    extends Composer<_$AppDatabase, $DownloadsTable> {
  $$DownloadsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDirty => $composableBuilder(
      column: $table.isDirty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nodeId => $composableBuilder(
      column: $table.nodeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get resourceId => $composableBuilder(
      column: $table.resourceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get resourceType => $composableBuilder(
      column: $table.resourceType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get filePath => $composableBuilder(
      column: $table.filePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get fileSizeBytes => $composableBuilder(
      column: $table.fileSizeBytes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get bytesDownloaded => $composableBuilder(
      column: $table.bytesDownloaded,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get downloadStatus => $composableBuilder(
      column: $table.downloadStatus,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get downloadSpeedBps => $composableBuilder(
      column: $table.downloadSpeedBps,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get progress => $composableBuilder(
      column: $table.progress, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get errorMessage => $composableBuilder(
      column: $table.errorMessage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cid => $composableBuilder(
      column: $table.cid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get peerCount => $composableBuilder(
      column: $table.peerCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnOrderings(column));
}

class $$DownloadsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DownloadsTable> {
  $$DownloadsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isDirty =>
      $composableBuilder(column: $table.isDirty, builder: (column) => column);

  GeneratedColumn<String> get nodeId =>
      $composableBuilder(column: $table.nodeId, builder: (column) => column);

  GeneratedColumn<String> get resourceId => $composableBuilder(
      column: $table.resourceId, builder: (column) => column);

  GeneratedColumn<String> get resourceType => $composableBuilder(
      column: $table.resourceType, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<int> get fileSizeBytes => $composableBuilder(
      column: $table.fileSizeBytes, builder: (column) => column);

  GeneratedColumn<int> get bytesDownloaded => $composableBuilder(
      column: $table.bytesDownloaded, builder: (column) => column);

  GeneratedColumn<String> get downloadStatus => $composableBuilder(
      column: $table.downloadStatus, builder: (column) => column);

  GeneratedColumn<int> get downloadSpeedBps => $composableBuilder(
      column: $table.downloadSpeedBps, builder: (column) => column);

  GeneratedColumn<double> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<String> get errorMessage => $composableBuilder(
      column: $table.errorMessage, builder: (column) => column);

  GeneratedColumn<String> get cid =>
      $composableBuilder(column: $table.cid, builder: (column) => column);

  GeneratedColumn<int> get peerCount =>
      $composableBuilder(column: $table.peerCount, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => column);
}

class $$DownloadsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DownloadsTable,
    Download,
    $$DownloadsTableFilterComposer,
    $$DownloadsTableOrderingComposer,
    $$DownloadsTableAnnotationComposer,
    $$DownloadsTableCreateCompanionBuilder,
    $$DownloadsTableUpdateCompanionBuilder,
    (Download, BaseReferences<_$AppDatabase, $DownloadsTable, Download>),
    Download,
    PrefetchHooks Function()> {
  $$DownloadsTableTableManager(_$AppDatabase db, $DownloadsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DownloadsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DownloadsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DownloadsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<String?> nodeId = const Value.absent(),
            Value<String> resourceId = const Value.absent(),
            Value<String> resourceType = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> filePath = const Value.absent(),
            Value<int> fileSizeBytes = const Value.absent(),
            Value<int> bytesDownloaded = const Value.absent(),
            Value<String> downloadStatus = const Value.absent(),
            Value<int> downloadSpeedBps = const Value.absent(),
            Value<double> progress = const Value.absent(),
            Value<String?> errorMessage = const Value.absent(),
            Value<String?> cid = const Value.absent(),
            Value<int> peerCount = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DownloadsCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            version: version,
            isDirty: isDirty,
            nodeId: nodeId,
            resourceId: resourceId,
            resourceType: resourceType,
            title: title,
            filePath: filePath,
            fileSizeBytes: fileSizeBytes,
            bytesDownloaded: bytesDownloaded,
            downloadStatus: downloadStatus,
            downloadSpeedBps: downloadSpeedBps,
            progress: progress,
            errorMessage: errorMessage,
            cid: cid,
            peerCount: peerCount,
            completedAt: completedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<String?> nodeId = const Value.absent(),
            required String resourceId,
            Value<String> resourceType = const Value.absent(),
            required String title,
            Value<String?> filePath = const Value.absent(),
            Value<int> fileSizeBytes = const Value.absent(),
            Value<int> bytesDownloaded = const Value.absent(),
            Value<String> downloadStatus = const Value.absent(),
            Value<int> downloadSpeedBps = const Value.absent(),
            Value<double> progress = const Value.absent(),
            Value<String?> errorMessage = const Value.absent(),
            Value<String?> cid = const Value.absent(),
            Value<int> peerCount = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DownloadsCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            version: version,
            isDirty: isDirty,
            nodeId: nodeId,
            resourceId: resourceId,
            resourceType: resourceType,
            title: title,
            filePath: filePath,
            fileSizeBytes: fileSizeBytes,
            bytesDownloaded: bytesDownloaded,
            downloadStatus: downloadStatus,
            downloadSpeedBps: downloadSpeedBps,
            progress: progress,
            errorMessage: errorMessage,
            cid: cid,
            peerCount: peerCount,
            completedAt: completedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DownloadsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DownloadsTable,
    Download,
    $$DownloadsTableFilterComposer,
    $$DownloadsTableOrderingComposer,
    $$DownloadsTableAnnotationComposer,
    $$DownloadsTableCreateCompanionBuilder,
    $$DownloadsTableUpdateCompanionBuilder,
    (Download, BaseReferences<_$AppDatabase, $DownloadsTable, Download>),
    Download,
    PrefetchHooks Function()>;
typedef $$FavoritesTableCreateCompanionBuilder = FavoritesCompanion Function({
  required String id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> version,
  Value<bool> isDirty,
  Value<String?> nodeId,
  required String resourceId,
  Value<String> resourceType,
  required String title,
  Value<String> authorsJson,
  Value<String?> coverPath,
  Value<String?> categoryId,
  Value<DateTime> addedAt,
  Value<int> rowid,
});
typedef $$FavoritesTableUpdateCompanionBuilder = FavoritesCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> version,
  Value<bool> isDirty,
  Value<String?> nodeId,
  Value<String> resourceId,
  Value<String> resourceType,
  Value<String> title,
  Value<String> authorsJson,
  Value<String?> coverPath,
  Value<String?> categoryId,
  Value<DateTime> addedAt,
  Value<int> rowid,
});

class $$FavoritesTableFilterComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDirty => $composableBuilder(
      column: $table.isDirty, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nodeId => $composableBuilder(
      column: $table.nodeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get resourceId => $composableBuilder(
      column: $table.resourceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get resourceType => $composableBuilder(
      column: $table.resourceType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get authorsJson => $composableBuilder(
      column: $table.authorsJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get coverPath => $composableBuilder(
      column: $table.coverPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
      column: $table.addedAt, builder: (column) => ColumnFilters(column));
}

class $$FavoritesTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDirty => $composableBuilder(
      column: $table.isDirty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nodeId => $composableBuilder(
      column: $table.nodeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get resourceId => $composableBuilder(
      column: $table.resourceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get resourceType => $composableBuilder(
      column: $table.resourceType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get authorsJson => $composableBuilder(
      column: $table.authorsJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get coverPath => $composableBuilder(
      column: $table.coverPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
      column: $table.addedAt, builder: (column) => ColumnOrderings(column));
}

class $$FavoritesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isDirty =>
      $composableBuilder(column: $table.isDirty, builder: (column) => column);

  GeneratedColumn<String> get nodeId =>
      $composableBuilder(column: $table.nodeId, builder: (column) => column);

  GeneratedColumn<String> get resourceId => $composableBuilder(
      column: $table.resourceId, builder: (column) => column);

  GeneratedColumn<String> get resourceType => $composableBuilder(
      column: $table.resourceType, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get authorsJson => $composableBuilder(
      column: $table.authorsJson, builder: (column) => column);

  GeneratedColumn<String> get coverPath =>
      $composableBuilder(column: $table.coverPath, builder: (column) => column);

  GeneratedColumn<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => column);

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);
}

class $$FavoritesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FavoritesTable,
    Favorite,
    $$FavoritesTableFilterComposer,
    $$FavoritesTableOrderingComposer,
    $$FavoritesTableAnnotationComposer,
    $$FavoritesTableCreateCompanionBuilder,
    $$FavoritesTableUpdateCompanionBuilder,
    (Favorite, BaseReferences<_$AppDatabase, $FavoritesTable, Favorite>),
    Favorite,
    PrefetchHooks Function()> {
  $$FavoritesTableTableManager(_$AppDatabase db, $FavoritesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoritesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoritesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoritesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<String?> nodeId = const Value.absent(),
            Value<String> resourceId = const Value.absent(),
            Value<String> resourceType = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> authorsJson = const Value.absent(),
            Value<String?> coverPath = const Value.absent(),
            Value<String?> categoryId = const Value.absent(),
            Value<DateTime> addedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FavoritesCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            version: version,
            isDirty: isDirty,
            nodeId: nodeId,
            resourceId: resourceId,
            resourceType: resourceType,
            title: title,
            authorsJson: authorsJson,
            coverPath: coverPath,
            categoryId: categoryId,
            addedAt: addedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<String?> nodeId = const Value.absent(),
            required String resourceId,
            Value<String> resourceType = const Value.absent(),
            required String title,
            Value<String> authorsJson = const Value.absent(),
            Value<String?> coverPath = const Value.absent(),
            Value<String?> categoryId = const Value.absent(),
            Value<DateTime> addedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FavoritesCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            version: version,
            isDirty: isDirty,
            nodeId: nodeId,
            resourceId: resourceId,
            resourceType: resourceType,
            title: title,
            authorsJson: authorsJson,
            coverPath: coverPath,
            categoryId: categoryId,
            addedAt: addedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FavoritesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FavoritesTable,
    Favorite,
    $$FavoritesTableFilterComposer,
    $$FavoritesTableOrderingComposer,
    $$FavoritesTableAnnotationComposer,
    $$FavoritesTableCreateCompanionBuilder,
    $$FavoritesTableUpdateCompanionBuilder,
    (Favorite, BaseReferences<_$AppDatabase, $FavoritesTable, Favorite>),
    Favorite,
    PrefetchHooks Function()>;
typedef $$ReadingProgressTableCreateCompanionBuilder = ReadingProgressCompanion
    Function({
  required String id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> version,
  Value<bool> isDirty,
  Value<String?> nodeId,
  required String resourceId,
  Value<String> resourceType,
  required String title,
  Value<int> currentPage,
  Value<int> totalPages,
  Value<double> progress,
  Value<String?> lastReadPosition,
  Value<int> timeSpentSeconds,
  Value<DateTime> lastReadAt,
  Value<int> rowid,
});
typedef $$ReadingProgressTableUpdateCompanionBuilder = ReadingProgressCompanion
    Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> version,
  Value<bool> isDirty,
  Value<String?> nodeId,
  Value<String> resourceId,
  Value<String> resourceType,
  Value<String> title,
  Value<int> currentPage,
  Value<int> totalPages,
  Value<double> progress,
  Value<String?> lastReadPosition,
  Value<int> timeSpentSeconds,
  Value<DateTime> lastReadAt,
  Value<int> rowid,
});

class $$ReadingProgressTableFilterComposer
    extends Composer<_$AppDatabase, $ReadingProgressTable> {
  $$ReadingProgressTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDirty => $composableBuilder(
      column: $table.isDirty, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nodeId => $composableBuilder(
      column: $table.nodeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get resourceId => $composableBuilder(
      column: $table.resourceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get resourceType => $composableBuilder(
      column: $table.resourceType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get currentPage => $composableBuilder(
      column: $table.currentPage, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalPages => $composableBuilder(
      column: $table.totalPages, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get progress => $composableBuilder(
      column: $table.progress, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastReadPosition => $composableBuilder(
      column: $table.lastReadPosition,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get timeSpentSeconds => $composableBuilder(
      column: $table.timeSpentSeconds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastReadAt => $composableBuilder(
      column: $table.lastReadAt, builder: (column) => ColumnFilters(column));
}

class $$ReadingProgressTableOrderingComposer
    extends Composer<_$AppDatabase, $ReadingProgressTable> {
  $$ReadingProgressTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDirty => $composableBuilder(
      column: $table.isDirty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nodeId => $composableBuilder(
      column: $table.nodeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get resourceId => $composableBuilder(
      column: $table.resourceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get resourceType => $composableBuilder(
      column: $table.resourceType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get currentPage => $composableBuilder(
      column: $table.currentPage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalPages => $composableBuilder(
      column: $table.totalPages, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get progress => $composableBuilder(
      column: $table.progress, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastReadPosition => $composableBuilder(
      column: $table.lastReadPosition,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get timeSpentSeconds => $composableBuilder(
      column: $table.timeSpentSeconds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastReadAt => $composableBuilder(
      column: $table.lastReadAt, builder: (column) => ColumnOrderings(column));
}

class $$ReadingProgressTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReadingProgressTable> {
  $$ReadingProgressTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isDirty =>
      $composableBuilder(column: $table.isDirty, builder: (column) => column);

  GeneratedColumn<String> get nodeId =>
      $composableBuilder(column: $table.nodeId, builder: (column) => column);

  GeneratedColumn<String> get resourceId => $composableBuilder(
      column: $table.resourceId, builder: (column) => column);

  GeneratedColumn<String> get resourceType => $composableBuilder(
      column: $table.resourceType, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get currentPage => $composableBuilder(
      column: $table.currentPage, builder: (column) => column);

  GeneratedColumn<int> get totalPages => $composableBuilder(
      column: $table.totalPages, builder: (column) => column);

  GeneratedColumn<double> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<String> get lastReadPosition => $composableBuilder(
      column: $table.lastReadPosition, builder: (column) => column);

  GeneratedColumn<int> get timeSpentSeconds => $composableBuilder(
      column: $table.timeSpentSeconds, builder: (column) => column);

  GeneratedColumn<DateTime> get lastReadAt => $composableBuilder(
      column: $table.lastReadAt, builder: (column) => column);
}

class $$ReadingProgressTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ReadingProgressTable,
    ReadingProgressData,
    $$ReadingProgressTableFilterComposer,
    $$ReadingProgressTableOrderingComposer,
    $$ReadingProgressTableAnnotationComposer,
    $$ReadingProgressTableCreateCompanionBuilder,
    $$ReadingProgressTableUpdateCompanionBuilder,
    (
      ReadingProgressData,
      BaseReferences<_$AppDatabase, $ReadingProgressTable, ReadingProgressData>
    ),
    ReadingProgressData,
    PrefetchHooks Function()> {
  $$ReadingProgressTableTableManager(
      _$AppDatabase db, $ReadingProgressTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReadingProgressTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReadingProgressTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReadingProgressTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<String?> nodeId = const Value.absent(),
            Value<String> resourceId = const Value.absent(),
            Value<String> resourceType = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<int> currentPage = const Value.absent(),
            Value<int> totalPages = const Value.absent(),
            Value<double> progress = const Value.absent(),
            Value<String?> lastReadPosition = const Value.absent(),
            Value<int> timeSpentSeconds = const Value.absent(),
            Value<DateTime> lastReadAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ReadingProgressCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            version: version,
            isDirty: isDirty,
            nodeId: nodeId,
            resourceId: resourceId,
            resourceType: resourceType,
            title: title,
            currentPage: currentPage,
            totalPages: totalPages,
            progress: progress,
            lastReadPosition: lastReadPosition,
            timeSpentSeconds: timeSpentSeconds,
            lastReadAt: lastReadAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<String?> nodeId = const Value.absent(),
            required String resourceId,
            Value<String> resourceType = const Value.absent(),
            required String title,
            Value<int> currentPage = const Value.absent(),
            Value<int> totalPages = const Value.absent(),
            Value<double> progress = const Value.absent(),
            Value<String?> lastReadPosition = const Value.absent(),
            Value<int> timeSpentSeconds = const Value.absent(),
            Value<DateTime> lastReadAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ReadingProgressCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            version: version,
            isDirty: isDirty,
            nodeId: nodeId,
            resourceId: resourceId,
            resourceType: resourceType,
            title: title,
            currentPage: currentPage,
            totalPages: totalPages,
            progress: progress,
            lastReadPosition: lastReadPosition,
            timeSpentSeconds: timeSpentSeconds,
            lastReadAt: lastReadAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ReadingProgressTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ReadingProgressTable,
    ReadingProgressData,
    $$ReadingProgressTableFilterComposer,
    $$ReadingProgressTableOrderingComposer,
    $$ReadingProgressTableAnnotationComposer,
    $$ReadingProgressTableCreateCompanionBuilder,
    $$ReadingProgressTableUpdateCompanionBuilder,
    (
      ReadingProgressData,
      BaseReferences<_$AppDatabase, $ReadingProgressTable, ReadingProgressData>
    ),
    ReadingProgressData,
    PrefetchHooks Function()>;
typedef $$CategoriesTableCreateCompanionBuilder = CategoriesCompanion Function({
  required String id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> version,
  Value<bool> isDirty,
  Value<String?> nodeId,
  required String slug,
  required String name,
  Value<String?> description,
  Value<String> iconName,
  Value<String> accentColorHex,
  Value<String?> parentCategoryId,
  Value<int> itemCount,
  Value<int> displayOrder,
  Value<int> rowid,
});
typedef $$CategoriesTableUpdateCompanionBuilder = CategoriesCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> version,
  Value<bool> isDirty,
  Value<String?> nodeId,
  Value<String> slug,
  Value<String> name,
  Value<String?> description,
  Value<String> iconName,
  Value<String> accentColorHex,
  Value<String?> parentCategoryId,
  Value<int> itemCount,
  Value<int> displayOrder,
  Value<int> rowid,
});

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDirty => $composableBuilder(
      column: $table.isDirty, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nodeId => $composableBuilder(
      column: $table.nodeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get slug => $composableBuilder(
      column: $table.slug, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get iconName => $composableBuilder(
      column: $table.iconName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accentColorHex => $composableBuilder(
      column: $table.accentColorHex,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get parentCategoryId => $composableBuilder(
      column: $table.parentCategoryId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get itemCount => $composableBuilder(
      column: $table.itemCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get displayOrder => $composableBuilder(
      column: $table.displayOrder, builder: (column) => ColumnFilters(column));
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDirty => $composableBuilder(
      column: $table.isDirty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nodeId => $composableBuilder(
      column: $table.nodeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get slug => $composableBuilder(
      column: $table.slug, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get iconName => $composableBuilder(
      column: $table.iconName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accentColorHex => $composableBuilder(
      column: $table.accentColorHex,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get parentCategoryId => $composableBuilder(
      column: $table.parentCategoryId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get itemCount => $composableBuilder(
      column: $table.itemCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get displayOrder => $composableBuilder(
      column: $table.displayOrder,
      builder: (column) => ColumnOrderings(column));
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isDirty =>
      $composableBuilder(column: $table.isDirty, builder: (column) => column);

  GeneratedColumn<String> get nodeId =>
      $composableBuilder(column: $table.nodeId, builder: (column) => column);

  GeneratedColumn<String> get slug =>
      $composableBuilder(column: $table.slug, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get iconName =>
      $composableBuilder(column: $table.iconName, builder: (column) => column);

  GeneratedColumn<String> get accentColorHex => $composableBuilder(
      column: $table.accentColorHex, builder: (column) => column);

  GeneratedColumn<String> get parentCategoryId => $composableBuilder(
      column: $table.parentCategoryId, builder: (column) => column);

  GeneratedColumn<int> get itemCount =>
      $composableBuilder(column: $table.itemCount, builder: (column) => column);

  GeneratedColumn<int> get displayOrder => $composableBuilder(
      column: $table.displayOrder, builder: (column) => column);
}

class $$CategoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (Category, BaseReferences<_$AppDatabase, $CategoriesTable, Category>),
    Category,
    PrefetchHooks Function()> {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<String?> nodeId = const Value.absent(),
            Value<String> slug = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String> iconName = const Value.absent(),
            Value<String> accentColorHex = const Value.absent(),
            Value<String?> parentCategoryId = const Value.absent(),
            Value<int> itemCount = const Value.absent(),
            Value<int> displayOrder = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoriesCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            version: version,
            isDirty: isDirty,
            nodeId: nodeId,
            slug: slug,
            name: name,
            description: description,
            iconName: iconName,
            accentColorHex: accentColorHex,
            parentCategoryId: parentCategoryId,
            itemCount: itemCount,
            displayOrder: displayOrder,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<String?> nodeId = const Value.absent(),
            required String slug,
            required String name,
            Value<String?> description = const Value.absent(),
            Value<String> iconName = const Value.absent(),
            Value<String> accentColorHex = const Value.absent(),
            Value<String?> parentCategoryId = const Value.absent(),
            Value<int> itemCount = const Value.absent(),
            Value<int> displayOrder = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoriesCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            version: version,
            isDirty: isDirty,
            nodeId: nodeId,
            slug: slug,
            name: name,
            description: description,
            iconName: iconName,
            accentColorHex: accentColorHex,
            parentCategoryId: parentCategoryId,
            itemCount: itemCount,
            displayOrder: displayOrder,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CategoriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (Category, BaseReferences<_$AppDatabase, $CategoriesTable, Category>),
    Category,
    PrefetchHooks Function()>;
typedef $$AuthorsTableCreateCompanionBuilder = AuthorsCompanion Function({
  required String id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> version,
  Value<bool> isDirty,
  Value<String?> nodeId,
  required String name,
  Value<String?> orcid,
  Value<String?> institution,
  Value<String?> bio,
  Value<String?> avatarUrl,
  Value<int> publicationCount,
  Value<int> hIndex,
  Value<int> rowid,
});
typedef $$AuthorsTableUpdateCompanionBuilder = AuthorsCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> version,
  Value<bool> isDirty,
  Value<String?> nodeId,
  Value<String> name,
  Value<String?> orcid,
  Value<String?> institution,
  Value<String?> bio,
  Value<String?> avatarUrl,
  Value<int> publicationCount,
  Value<int> hIndex,
  Value<int> rowid,
});

class $$AuthorsTableFilterComposer
    extends Composer<_$AppDatabase, $AuthorsTable> {
  $$AuthorsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDirty => $composableBuilder(
      column: $table.isDirty, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nodeId => $composableBuilder(
      column: $table.nodeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get orcid => $composableBuilder(
      column: $table.orcid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get institution => $composableBuilder(
      column: $table.institution, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bio => $composableBuilder(
      column: $table.bio, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get avatarUrl => $composableBuilder(
      column: $table.avatarUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get publicationCount => $composableBuilder(
      column: $table.publicationCount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get hIndex => $composableBuilder(
      column: $table.hIndex, builder: (column) => ColumnFilters(column));
}

class $$AuthorsTableOrderingComposer
    extends Composer<_$AppDatabase, $AuthorsTable> {
  $$AuthorsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDirty => $composableBuilder(
      column: $table.isDirty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nodeId => $composableBuilder(
      column: $table.nodeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get orcid => $composableBuilder(
      column: $table.orcid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get institution => $composableBuilder(
      column: $table.institution, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bio => $composableBuilder(
      column: $table.bio, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get avatarUrl => $composableBuilder(
      column: $table.avatarUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get publicationCount => $composableBuilder(
      column: $table.publicationCount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get hIndex => $composableBuilder(
      column: $table.hIndex, builder: (column) => ColumnOrderings(column));
}

class $$AuthorsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuthorsTable> {
  $$AuthorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isDirty =>
      $composableBuilder(column: $table.isDirty, builder: (column) => column);

  GeneratedColumn<String> get nodeId =>
      $composableBuilder(column: $table.nodeId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get orcid =>
      $composableBuilder(column: $table.orcid, builder: (column) => column);

  GeneratedColumn<String> get institution => $composableBuilder(
      column: $table.institution, builder: (column) => column);

  GeneratedColumn<String> get bio =>
      $composableBuilder(column: $table.bio, builder: (column) => column);

  GeneratedColumn<String> get avatarUrl =>
      $composableBuilder(column: $table.avatarUrl, builder: (column) => column);

  GeneratedColumn<int> get publicationCount => $composableBuilder(
      column: $table.publicationCount, builder: (column) => column);

  GeneratedColumn<int> get hIndex =>
      $composableBuilder(column: $table.hIndex, builder: (column) => column);
}

class $$AuthorsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AuthorsTable,
    Author,
    $$AuthorsTableFilterComposer,
    $$AuthorsTableOrderingComposer,
    $$AuthorsTableAnnotationComposer,
    $$AuthorsTableCreateCompanionBuilder,
    $$AuthorsTableUpdateCompanionBuilder,
    (Author, BaseReferences<_$AppDatabase, $AuthorsTable, Author>),
    Author,
    PrefetchHooks Function()> {
  $$AuthorsTableTableManager(_$AppDatabase db, $AuthorsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuthorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuthorsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuthorsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<String?> nodeId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> orcid = const Value.absent(),
            Value<String?> institution = const Value.absent(),
            Value<String?> bio = const Value.absent(),
            Value<String?> avatarUrl = const Value.absent(),
            Value<int> publicationCount = const Value.absent(),
            Value<int> hIndex = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AuthorsCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            version: version,
            isDirty: isDirty,
            nodeId: nodeId,
            name: name,
            orcid: orcid,
            institution: institution,
            bio: bio,
            avatarUrl: avatarUrl,
            publicationCount: publicationCount,
            hIndex: hIndex,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<String?> nodeId = const Value.absent(),
            required String name,
            Value<String?> orcid = const Value.absent(),
            Value<String?> institution = const Value.absent(),
            Value<String?> bio = const Value.absent(),
            Value<String?> avatarUrl = const Value.absent(),
            Value<int> publicationCount = const Value.absent(),
            Value<int> hIndex = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AuthorsCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            version: version,
            isDirty: isDirty,
            nodeId: nodeId,
            name: name,
            orcid: orcid,
            institution: institution,
            bio: bio,
            avatarUrl: avatarUrl,
            publicationCount: publicationCount,
            hIndex: hIndex,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AuthorsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AuthorsTable,
    Author,
    $$AuthorsTableFilterComposer,
    $$AuthorsTableOrderingComposer,
    $$AuthorsTableAnnotationComposer,
    $$AuthorsTableCreateCompanionBuilder,
    $$AuthorsTableUpdateCompanionBuilder,
    (Author, BaseReferences<_$AppDatabase, $AuthorsTable, Author>),
    Author,
    PrefetchHooks Function()>;
typedef $$SearchHistoryTableCreateCompanionBuilder = SearchHistoryCompanion
    Function({
  required String id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> version,
  Value<bool> isDirty,
  Value<String?> nodeId,
  required String query,
  Value<int> resultCount,
  Value<String> filtersJson,
  Value<DateTime> searchedAt,
  Value<int> rowid,
});
typedef $$SearchHistoryTableUpdateCompanionBuilder = SearchHistoryCompanion
    Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> version,
  Value<bool> isDirty,
  Value<String?> nodeId,
  Value<String> query,
  Value<int> resultCount,
  Value<String> filtersJson,
  Value<DateTime> searchedAt,
  Value<int> rowid,
});

class $$SearchHistoryTableFilterComposer
    extends Composer<_$AppDatabase, $SearchHistoryTable> {
  $$SearchHistoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDirty => $composableBuilder(
      column: $table.isDirty, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nodeId => $composableBuilder(
      column: $table.nodeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get query => $composableBuilder(
      column: $table.query, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get resultCount => $composableBuilder(
      column: $table.resultCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get filtersJson => $composableBuilder(
      column: $table.filtersJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get searchedAt => $composableBuilder(
      column: $table.searchedAt, builder: (column) => ColumnFilters(column));
}

class $$SearchHistoryTableOrderingComposer
    extends Composer<_$AppDatabase, $SearchHistoryTable> {
  $$SearchHistoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDirty => $composableBuilder(
      column: $table.isDirty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nodeId => $composableBuilder(
      column: $table.nodeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get query => $composableBuilder(
      column: $table.query, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get resultCount => $composableBuilder(
      column: $table.resultCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get filtersJson => $composableBuilder(
      column: $table.filtersJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get searchedAt => $composableBuilder(
      column: $table.searchedAt, builder: (column) => ColumnOrderings(column));
}

class $$SearchHistoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $SearchHistoryTable> {
  $$SearchHistoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isDirty =>
      $composableBuilder(column: $table.isDirty, builder: (column) => column);

  GeneratedColumn<String> get nodeId =>
      $composableBuilder(column: $table.nodeId, builder: (column) => column);

  GeneratedColumn<String> get query =>
      $composableBuilder(column: $table.query, builder: (column) => column);

  GeneratedColumn<int> get resultCount => $composableBuilder(
      column: $table.resultCount, builder: (column) => column);

  GeneratedColumn<String> get filtersJson => $composableBuilder(
      column: $table.filtersJson, builder: (column) => column);

  GeneratedColumn<DateTime> get searchedAt => $composableBuilder(
      column: $table.searchedAt, builder: (column) => column);
}

class $$SearchHistoryTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SearchHistoryTable,
    SearchHistoryData,
    $$SearchHistoryTableFilterComposer,
    $$SearchHistoryTableOrderingComposer,
    $$SearchHistoryTableAnnotationComposer,
    $$SearchHistoryTableCreateCompanionBuilder,
    $$SearchHistoryTableUpdateCompanionBuilder,
    (
      SearchHistoryData,
      BaseReferences<_$AppDatabase, $SearchHistoryTable, SearchHistoryData>
    ),
    SearchHistoryData,
    PrefetchHooks Function()> {
  $$SearchHistoryTableTableManager(_$AppDatabase db, $SearchHistoryTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SearchHistoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SearchHistoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SearchHistoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<String?> nodeId = const Value.absent(),
            Value<String> query = const Value.absent(),
            Value<int> resultCount = const Value.absent(),
            Value<String> filtersJson = const Value.absent(),
            Value<DateTime> searchedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SearchHistoryCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            version: version,
            isDirty: isDirty,
            nodeId: nodeId,
            query: query,
            resultCount: resultCount,
            filtersJson: filtersJson,
            searchedAt: searchedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<String?> nodeId = const Value.absent(),
            required String query,
            Value<int> resultCount = const Value.absent(),
            Value<String> filtersJson = const Value.absent(),
            Value<DateTime> searchedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SearchHistoryCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            version: version,
            isDirty: isDirty,
            nodeId: nodeId,
            query: query,
            resultCount: resultCount,
            filtersJson: filtersJson,
            searchedAt: searchedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SearchHistoryTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SearchHistoryTable,
    SearchHistoryData,
    $$SearchHistoryTableFilterComposer,
    $$SearchHistoryTableOrderingComposer,
    $$SearchHistoryTableAnnotationComposer,
    $$SearchHistoryTableCreateCompanionBuilder,
    $$SearchHistoryTableUpdateCompanionBuilder,
    (
      SearchHistoryData,
      BaseReferences<_$AppDatabase, $SearchHistoryTable, SearchHistoryData>
    ),
    SearchHistoryData,
    PrefetchHooks Function()>;
typedef $$RecentSearchesTableCreateCompanionBuilder = RecentSearchesCompanion
    Function({
  required String id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> version,
  Value<bool> isDirty,
  Value<String?> nodeId,
  required String term,
  Value<int> hitCount,
  Value<DateTime> lastQueriedAt,
  Value<int> rowid,
});
typedef $$RecentSearchesTableUpdateCompanionBuilder = RecentSearchesCompanion
    Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> version,
  Value<bool> isDirty,
  Value<String?> nodeId,
  Value<String> term,
  Value<int> hitCount,
  Value<DateTime> lastQueriedAt,
  Value<int> rowid,
});

class $$RecentSearchesTableFilterComposer
    extends Composer<_$AppDatabase, $RecentSearchesTable> {
  $$RecentSearchesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDirty => $composableBuilder(
      column: $table.isDirty, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nodeId => $composableBuilder(
      column: $table.nodeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get term => $composableBuilder(
      column: $table.term, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get hitCount => $composableBuilder(
      column: $table.hitCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastQueriedAt => $composableBuilder(
      column: $table.lastQueriedAt, builder: (column) => ColumnFilters(column));
}

class $$RecentSearchesTableOrderingComposer
    extends Composer<_$AppDatabase, $RecentSearchesTable> {
  $$RecentSearchesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDirty => $composableBuilder(
      column: $table.isDirty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nodeId => $composableBuilder(
      column: $table.nodeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get term => $composableBuilder(
      column: $table.term, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get hitCount => $composableBuilder(
      column: $table.hitCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastQueriedAt => $composableBuilder(
      column: $table.lastQueriedAt,
      builder: (column) => ColumnOrderings(column));
}

class $$RecentSearchesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecentSearchesTable> {
  $$RecentSearchesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isDirty =>
      $composableBuilder(column: $table.isDirty, builder: (column) => column);

  GeneratedColumn<String> get nodeId =>
      $composableBuilder(column: $table.nodeId, builder: (column) => column);

  GeneratedColumn<String> get term =>
      $composableBuilder(column: $table.term, builder: (column) => column);

  GeneratedColumn<int> get hitCount =>
      $composableBuilder(column: $table.hitCount, builder: (column) => column);

  GeneratedColumn<DateTime> get lastQueriedAt => $composableBuilder(
      column: $table.lastQueriedAt, builder: (column) => column);
}

class $$RecentSearchesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RecentSearchesTable,
    RecentSearche,
    $$RecentSearchesTableFilterComposer,
    $$RecentSearchesTableOrderingComposer,
    $$RecentSearchesTableAnnotationComposer,
    $$RecentSearchesTableCreateCompanionBuilder,
    $$RecentSearchesTableUpdateCompanionBuilder,
    (
      RecentSearche,
      BaseReferences<_$AppDatabase, $RecentSearchesTable, RecentSearche>
    ),
    RecentSearche,
    PrefetchHooks Function()> {
  $$RecentSearchesTableTableManager(
      _$AppDatabase db, $RecentSearchesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecentSearchesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecentSearchesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecentSearchesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<String?> nodeId = const Value.absent(),
            Value<String> term = const Value.absent(),
            Value<int> hitCount = const Value.absent(),
            Value<DateTime> lastQueriedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecentSearchesCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            version: version,
            isDirty: isDirty,
            nodeId: nodeId,
            term: term,
            hitCount: hitCount,
            lastQueriedAt: lastQueriedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<String?> nodeId = const Value.absent(),
            required String term,
            Value<int> hitCount = const Value.absent(),
            Value<DateTime> lastQueriedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecentSearchesCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            version: version,
            isDirty: isDirty,
            nodeId: nodeId,
            term: term,
            hitCount: hitCount,
            lastQueriedAt: lastQueriedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RecentSearchesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RecentSearchesTable,
    RecentSearche,
    $$RecentSearchesTableFilterComposer,
    $$RecentSearchesTableOrderingComposer,
    $$RecentSearchesTableAnnotationComposer,
    $$RecentSearchesTableCreateCompanionBuilder,
    $$RecentSearchesTableUpdateCompanionBuilder,
    (
      RecentSearche,
      BaseReferences<_$AppDatabase, $RecentSearchesTable, RecentSearche>
    ),
    RecentSearche,
    PrefetchHooks Function()>;
typedef $$SettingsTableCreateCompanionBuilder = SettingsCompanion Function({
  required String id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> version,
  Value<bool> isDirty,
  Value<String?> nodeId,
  required String key,
  required String value,
  Value<String> category,
  Value<bool> isEncrypted,
  Value<int> rowid,
});
typedef $$SettingsTableUpdateCompanionBuilder = SettingsCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> version,
  Value<bool> isDirty,
  Value<String?> nodeId,
  Value<String> key,
  Value<String> value,
  Value<String> category,
  Value<bool> isEncrypted,
  Value<int> rowid,
});

class $$SettingsTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDirty => $composableBuilder(
      column: $table.isDirty, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nodeId => $composableBuilder(
      column: $table.nodeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isEncrypted => $composableBuilder(
      column: $table.isEncrypted, builder: (column) => ColumnFilters(column));
}

class $$SettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDirty => $composableBuilder(
      column: $table.isDirty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nodeId => $composableBuilder(
      column: $table.nodeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isEncrypted => $composableBuilder(
      column: $table.isEncrypted, builder: (column) => ColumnOrderings(column));
}

class $$SettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isDirty =>
      $composableBuilder(column: $table.isDirty, builder: (column) => column);

  GeneratedColumn<String> get nodeId =>
      $composableBuilder(column: $table.nodeId, builder: (column) => column);

  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<bool> get isEncrypted => $composableBuilder(
      column: $table.isEncrypted, builder: (column) => column);
}

class $$SettingsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SettingsTable,
    Setting,
    $$SettingsTableFilterComposer,
    $$SettingsTableOrderingComposer,
    $$SettingsTableAnnotationComposer,
    $$SettingsTableCreateCompanionBuilder,
    $$SettingsTableUpdateCompanionBuilder,
    (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
    Setting,
    PrefetchHooks Function()> {
  $$SettingsTableTableManager(_$AppDatabase db, $SettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<String?> nodeId = const Value.absent(),
            Value<String> key = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<bool> isEncrypted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SettingsCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            version: version,
            isDirty: isDirty,
            nodeId: nodeId,
            key: key,
            value: value,
            category: category,
            isEncrypted: isEncrypted,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<String?> nodeId = const Value.absent(),
            required String key,
            required String value,
            Value<String> category = const Value.absent(),
            Value<bool> isEncrypted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SettingsCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            version: version,
            isDirty: isDirty,
            nodeId: nodeId,
            key: key,
            value: value,
            category: category,
            isEncrypted: isEncrypted,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SettingsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SettingsTable,
    Setting,
    $$SettingsTableFilterComposer,
    $$SettingsTableOrderingComposer,
    $$SettingsTableAnnotationComposer,
    $$SettingsTableCreateCompanionBuilder,
    $$SettingsTableUpdateCompanionBuilder,
    (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
    Setting,
    PrefetchHooks Function()>;
typedef $$CacheMetadataTableCreateCompanionBuilder = CacheMetadataCompanion
    Function({
  required String id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> version,
  Value<bool> isDirty,
  Value<String?> nodeId,
  required String cacheKey,
  Value<String> contentType,
  Value<int> sizeBytes,
  Value<String?> eTag,
  Value<DateTime?> expiresAt,
  Value<DateTime> lastAccessedAt,
  Value<int> accessCount,
  Value<String?> localFilePath,
  Value<int> rowid,
});
typedef $$CacheMetadataTableUpdateCompanionBuilder = CacheMetadataCompanion
    Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> version,
  Value<bool> isDirty,
  Value<String?> nodeId,
  Value<String> cacheKey,
  Value<String> contentType,
  Value<int> sizeBytes,
  Value<String?> eTag,
  Value<DateTime?> expiresAt,
  Value<DateTime> lastAccessedAt,
  Value<int> accessCount,
  Value<String?> localFilePath,
  Value<int> rowid,
});

class $$CacheMetadataTableFilterComposer
    extends Composer<_$AppDatabase, $CacheMetadataTable> {
  $$CacheMetadataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDirty => $composableBuilder(
      column: $table.isDirty, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nodeId => $composableBuilder(
      column: $table.nodeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cacheKey => $composableBuilder(
      column: $table.cacheKey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get contentType => $composableBuilder(
      column: $table.contentType, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sizeBytes => $composableBuilder(
      column: $table.sizeBytes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get eTag => $composableBuilder(
      column: $table.eTag, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
      column: $table.expiresAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastAccessedAt => $composableBuilder(
      column: $table.lastAccessedAt,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get accessCount => $composableBuilder(
      column: $table.accessCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get localFilePath => $composableBuilder(
      column: $table.localFilePath, builder: (column) => ColumnFilters(column));
}

class $$CacheMetadataTableOrderingComposer
    extends Composer<_$AppDatabase, $CacheMetadataTable> {
  $$CacheMetadataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDirty => $composableBuilder(
      column: $table.isDirty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nodeId => $composableBuilder(
      column: $table.nodeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cacheKey => $composableBuilder(
      column: $table.cacheKey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contentType => $composableBuilder(
      column: $table.contentType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sizeBytes => $composableBuilder(
      column: $table.sizeBytes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get eTag => $composableBuilder(
      column: $table.eTag, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
      column: $table.expiresAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastAccessedAt => $composableBuilder(
      column: $table.lastAccessedAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get accessCount => $composableBuilder(
      column: $table.accessCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get localFilePath => $composableBuilder(
      column: $table.localFilePath,
      builder: (column) => ColumnOrderings(column));
}

class $$CacheMetadataTableAnnotationComposer
    extends Composer<_$AppDatabase, $CacheMetadataTable> {
  $$CacheMetadataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isDirty =>
      $composableBuilder(column: $table.isDirty, builder: (column) => column);

  GeneratedColumn<String> get nodeId =>
      $composableBuilder(column: $table.nodeId, builder: (column) => column);

  GeneratedColumn<String> get cacheKey =>
      $composableBuilder(column: $table.cacheKey, builder: (column) => column);

  GeneratedColumn<String> get contentType => $composableBuilder(
      column: $table.contentType, builder: (column) => column);

  GeneratedColumn<int> get sizeBytes =>
      $composableBuilder(column: $table.sizeBytes, builder: (column) => column);

  GeneratedColumn<String> get eTag =>
      $composableBuilder(column: $table.eTag, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastAccessedAt => $composableBuilder(
      column: $table.lastAccessedAt, builder: (column) => column);

  GeneratedColumn<int> get accessCount => $composableBuilder(
      column: $table.accessCount, builder: (column) => column);

  GeneratedColumn<String> get localFilePath => $composableBuilder(
      column: $table.localFilePath, builder: (column) => column);
}

class $$CacheMetadataTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CacheMetadataTable,
    CacheMetadataData,
    $$CacheMetadataTableFilterComposer,
    $$CacheMetadataTableOrderingComposer,
    $$CacheMetadataTableAnnotationComposer,
    $$CacheMetadataTableCreateCompanionBuilder,
    $$CacheMetadataTableUpdateCompanionBuilder,
    (
      CacheMetadataData,
      BaseReferences<_$AppDatabase, $CacheMetadataTable, CacheMetadataData>
    ),
    CacheMetadataData,
    PrefetchHooks Function()> {
  $$CacheMetadataTableTableManager(_$AppDatabase db, $CacheMetadataTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CacheMetadataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CacheMetadataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CacheMetadataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<String?> nodeId = const Value.absent(),
            Value<String> cacheKey = const Value.absent(),
            Value<String> contentType = const Value.absent(),
            Value<int> sizeBytes = const Value.absent(),
            Value<String?> eTag = const Value.absent(),
            Value<DateTime?> expiresAt = const Value.absent(),
            Value<DateTime> lastAccessedAt = const Value.absent(),
            Value<int> accessCount = const Value.absent(),
            Value<String?> localFilePath = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CacheMetadataCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            version: version,
            isDirty: isDirty,
            nodeId: nodeId,
            cacheKey: cacheKey,
            contentType: contentType,
            sizeBytes: sizeBytes,
            eTag: eTag,
            expiresAt: expiresAt,
            lastAccessedAt: lastAccessedAt,
            accessCount: accessCount,
            localFilePath: localFilePath,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<String?> nodeId = const Value.absent(),
            required String cacheKey,
            Value<String> contentType = const Value.absent(),
            Value<int> sizeBytes = const Value.absent(),
            Value<String?> eTag = const Value.absent(),
            Value<DateTime?> expiresAt = const Value.absent(),
            Value<DateTime> lastAccessedAt = const Value.absent(),
            Value<int> accessCount = const Value.absent(),
            Value<String?> localFilePath = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CacheMetadataCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            version: version,
            isDirty: isDirty,
            nodeId: nodeId,
            cacheKey: cacheKey,
            contentType: contentType,
            sizeBytes: sizeBytes,
            eTag: eTag,
            expiresAt: expiresAt,
            lastAccessedAt: lastAccessedAt,
            accessCount: accessCount,
            localFilePath: localFilePath,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CacheMetadataTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CacheMetadataTable,
    CacheMetadataData,
    $$CacheMetadataTableFilterComposer,
    $$CacheMetadataTableOrderingComposer,
    $$CacheMetadataTableAnnotationComposer,
    $$CacheMetadataTableCreateCompanionBuilder,
    $$CacheMetadataTableUpdateCompanionBuilder,
    (
      CacheMetadataData,
      BaseReferences<_$AppDatabase, $CacheMetadataTable, CacheMetadataData>
    ),
    CacheMetadataData,
    PrefetchHooks Function()>;
typedef $$NetworkMetadataTableCreateCompanionBuilder = NetworkMetadataCompanion
    Function({
  required String id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> version,
  Value<bool> isDirty,
  Value<String?> nodeId,
  required String swarmId,
  Value<int> peerCount,
  Value<int> averageLatencyMs,
  Value<int> downloadSpeedBps,
  Value<int> uploadSpeedBps,
  Value<double> dhtReputationScore,
  Value<int> totalBytesShared,
  Value<int> totalBytesReceived,
  Value<DateTime> lastHealthCheckAt,
  Value<int> rowid,
});
typedef $$NetworkMetadataTableUpdateCompanionBuilder = NetworkMetadataCompanion
    Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> version,
  Value<bool> isDirty,
  Value<String?> nodeId,
  Value<String> swarmId,
  Value<int> peerCount,
  Value<int> averageLatencyMs,
  Value<int> downloadSpeedBps,
  Value<int> uploadSpeedBps,
  Value<double> dhtReputationScore,
  Value<int> totalBytesShared,
  Value<int> totalBytesReceived,
  Value<DateTime> lastHealthCheckAt,
  Value<int> rowid,
});

class $$NetworkMetadataTableFilterComposer
    extends Composer<_$AppDatabase, $NetworkMetadataTable> {
  $$NetworkMetadataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDirty => $composableBuilder(
      column: $table.isDirty, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nodeId => $composableBuilder(
      column: $table.nodeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get swarmId => $composableBuilder(
      column: $table.swarmId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get peerCount => $composableBuilder(
      column: $table.peerCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get averageLatencyMs => $composableBuilder(
      column: $table.averageLatencyMs,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get downloadSpeedBps => $composableBuilder(
      column: $table.downloadSpeedBps,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get uploadSpeedBps => $composableBuilder(
      column: $table.uploadSpeedBps,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get dhtReputationScore => $composableBuilder(
      column: $table.dhtReputationScore,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalBytesShared => $composableBuilder(
      column: $table.totalBytesShared,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalBytesReceived => $composableBuilder(
      column: $table.totalBytesReceived,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastHealthCheckAt => $composableBuilder(
      column: $table.lastHealthCheckAt,
      builder: (column) => ColumnFilters(column));
}

class $$NetworkMetadataTableOrderingComposer
    extends Composer<_$AppDatabase, $NetworkMetadataTable> {
  $$NetworkMetadataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDirty => $composableBuilder(
      column: $table.isDirty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nodeId => $composableBuilder(
      column: $table.nodeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get swarmId => $composableBuilder(
      column: $table.swarmId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get peerCount => $composableBuilder(
      column: $table.peerCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get averageLatencyMs => $composableBuilder(
      column: $table.averageLatencyMs,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get downloadSpeedBps => $composableBuilder(
      column: $table.downloadSpeedBps,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get uploadSpeedBps => $composableBuilder(
      column: $table.uploadSpeedBps,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get dhtReputationScore => $composableBuilder(
      column: $table.dhtReputationScore,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalBytesShared => $composableBuilder(
      column: $table.totalBytesShared,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalBytesReceived => $composableBuilder(
      column: $table.totalBytesReceived,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastHealthCheckAt => $composableBuilder(
      column: $table.lastHealthCheckAt,
      builder: (column) => ColumnOrderings(column));
}

class $$NetworkMetadataTableAnnotationComposer
    extends Composer<_$AppDatabase, $NetworkMetadataTable> {
  $$NetworkMetadataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isDirty =>
      $composableBuilder(column: $table.isDirty, builder: (column) => column);

  GeneratedColumn<String> get nodeId =>
      $composableBuilder(column: $table.nodeId, builder: (column) => column);

  GeneratedColumn<String> get swarmId =>
      $composableBuilder(column: $table.swarmId, builder: (column) => column);

  GeneratedColumn<int> get peerCount =>
      $composableBuilder(column: $table.peerCount, builder: (column) => column);

  GeneratedColumn<int> get averageLatencyMs => $composableBuilder(
      column: $table.averageLatencyMs, builder: (column) => column);

  GeneratedColumn<int> get downloadSpeedBps => $composableBuilder(
      column: $table.downloadSpeedBps, builder: (column) => column);

  GeneratedColumn<int> get uploadSpeedBps => $composableBuilder(
      column: $table.uploadSpeedBps, builder: (column) => column);

  GeneratedColumn<double> get dhtReputationScore => $composableBuilder(
      column: $table.dhtReputationScore, builder: (column) => column);

  GeneratedColumn<int> get totalBytesShared => $composableBuilder(
      column: $table.totalBytesShared, builder: (column) => column);

  GeneratedColumn<int> get totalBytesReceived => $composableBuilder(
      column: $table.totalBytesReceived, builder: (column) => column);

  GeneratedColumn<DateTime> get lastHealthCheckAt => $composableBuilder(
      column: $table.lastHealthCheckAt, builder: (column) => column);
}

class $$NetworkMetadataTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NetworkMetadataTable,
    NetworkMetadataData,
    $$NetworkMetadataTableFilterComposer,
    $$NetworkMetadataTableOrderingComposer,
    $$NetworkMetadataTableAnnotationComposer,
    $$NetworkMetadataTableCreateCompanionBuilder,
    $$NetworkMetadataTableUpdateCompanionBuilder,
    (
      NetworkMetadataData,
      BaseReferences<_$AppDatabase, $NetworkMetadataTable, NetworkMetadataData>
    ),
    NetworkMetadataData,
    PrefetchHooks Function()> {
  $$NetworkMetadataTableTableManager(
      _$AppDatabase db, $NetworkMetadataTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NetworkMetadataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NetworkMetadataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NetworkMetadataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<String?> nodeId = const Value.absent(),
            Value<String> swarmId = const Value.absent(),
            Value<int> peerCount = const Value.absent(),
            Value<int> averageLatencyMs = const Value.absent(),
            Value<int> downloadSpeedBps = const Value.absent(),
            Value<int> uploadSpeedBps = const Value.absent(),
            Value<double> dhtReputationScore = const Value.absent(),
            Value<int> totalBytesShared = const Value.absent(),
            Value<int> totalBytesReceived = const Value.absent(),
            Value<DateTime> lastHealthCheckAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              NetworkMetadataCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            version: version,
            isDirty: isDirty,
            nodeId: nodeId,
            swarmId: swarmId,
            peerCount: peerCount,
            averageLatencyMs: averageLatencyMs,
            downloadSpeedBps: downloadSpeedBps,
            uploadSpeedBps: uploadSpeedBps,
            dhtReputationScore: dhtReputationScore,
            totalBytesShared: totalBytesShared,
            totalBytesReceived: totalBytesReceived,
            lastHealthCheckAt: lastHealthCheckAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<String?> nodeId = const Value.absent(),
            required String swarmId,
            Value<int> peerCount = const Value.absent(),
            Value<int> averageLatencyMs = const Value.absent(),
            Value<int> downloadSpeedBps = const Value.absent(),
            Value<int> uploadSpeedBps = const Value.absent(),
            Value<double> dhtReputationScore = const Value.absent(),
            Value<int> totalBytesShared = const Value.absent(),
            Value<int> totalBytesReceived = const Value.absent(),
            Value<DateTime> lastHealthCheckAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              NetworkMetadataCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            version: version,
            isDirty: isDirty,
            nodeId: nodeId,
            swarmId: swarmId,
            peerCount: peerCount,
            averageLatencyMs: averageLatencyMs,
            downloadSpeedBps: downloadSpeedBps,
            uploadSpeedBps: uploadSpeedBps,
            dhtReputationScore: dhtReputationScore,
            totalBytesShared: totalBytesShared,
            totalBytesReceived: totalBytesReceived,
            lastHealthCheckAt: lastHealthCheckAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$NetworkMetadataTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $NetworkMetadataTable,
    NetworkMetadataData,
    $$NetworkMetadataTableFilterComposer,
    $$NetworkMetadataTableOrderingComposer,
    $$NetworkMetadataTableAnnotationComposer,
    $$NetworkMetadataTableCreateCompanionBuilder,
    $$NetworkMetadataTableUpdateCompanionBuilder,
    (
      NetworkMetadataData,
      BaseReferences<_$AppDatabase, $NetworkMetadataTable, NetworkMetadataData>
    ),
    NetworkMetadataData,
    PrefetchHooks Function()>;
typedef $$NodeMetadataTableCreateCompanionBuilder = NodeMetadataCompanion
    Function({
  required String id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> version,
  Value<bool> isDirty,
  Value<String?> nodeId,
  required String nodePublicKey,
  Value<String> multiaddressesJson,
  Value<String> protocolVersion,
  Value<double> reputationScore,
  Value<int> latencyMs,
  Value<bool> isConnected,
  Value<bool> isBanned,
  Value<DateTime> lastSeenAt,
  Value<int> rowid,
});
typedef $$NodeMetadataTableUpdateCompanionBuilder = NodeMetadataCompanion
    Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<DateTime?> lastSyncedAt,
  Value<String?> remoteId,
  Value<int> version,
  Value<bool> isDirty,
  Value<String?> nodeId,
  Value<String> nodePublicKey,
  Value<String> multiaddressesJson,
  Value<String> protocolVersion,
  Value<double> reputationScore,
  Value<int> latencyMs,
  Value<bool> isConnected,
  Value<bool> isBanned,
  Value<DateTime> lastSeenAt,
  Value<int> rowid,
});

class $$NodeMetadataTableFilterComposer
    extends Composer<_$AppDatabase, $NodeMetadataTable> {
  $$NodeMetadataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDirty => $composableBuilder(
      column: $table.isDirty, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nodeId => $composableBuilder(
      column: $table.nodeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nodePublicKey => $composableBuilder(
      column: $table.nodePublicKey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get multiaddressesJson => $composableBuilder(
      column: $table.multiaddressesJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get protocolVersion => $composableBuilder(
      column: $table.protocolVersion,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get reputationScore => $composableBuilder(
      column: $table.reputationScore,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get latencyMs => $composableBuilder(
      column: $table.latencyMs, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isConnected => $composableBuilder(
      column: $table.isConnected, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isBanned => $composableBuilder(
      column: $table.isBanned, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastSeenAt => $composableBuilder(
      column: $table.lastSeenAt, builder: (column) => ColumnFilters(column));
}

class $$NodeMetadataTableOrderingComposer
    extends Composer<_$AppDatabase, $NodeMetadataTable> {
  $$NodeMetadataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDirty => $composableBuilder(
      column: $table.isDirty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nodeId => $composableBuilder(
      column: $table.nodeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nodePublicKey => $composableBuilder(
      column: $table.nodePublicKey,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get multiaddressesJson => $composableBuilder(
      column: $table.multiaddressesJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get protocolVersion => $composableBuilder(
      column: $table.protocolVersion,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get reputationScore => $composableBuilder(
      column: $table.reputationScore,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get latencyMs => $composableBuilder(
      column: $table.latencyMs, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isConnected => $composableBuilder(
      column: $table.isConnected, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isBanned => $composableBuilder(
      column: $table.isBanned, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastSeenAt => $composableBuilder(
      column: $table.lastSeenAt, builder: (column) => ColumnOrderings(column));
}

class $$NodeMetadataTableAnnotationComposer
    extends Composer<_$AppDatabase, $NodeMetadataTable> {
  $$NodeMetadataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isDirty =>
      $composableBuilder(column: $table.isDirty, builder: (column) => column);

  GeneratedColumn<String> get nodeId =>
      $composableBuilder(column: $table.nodeId, builder: (column) => column);

  GeneratedColumn<String> get nodePublicKey => $composableBuilder(
      column: $table.nodePublicKey, builder: (column) => column);

  GeneratedColumn<String> get multiaddressesJson => $composableBuilder(
      column: $table.multiaddressesJson, builder: (column) => column);

  GeneratedColumn<String> get protocolVersion => $composableBuilder(
      column: $table.protocolVersion, builder: (column) => column);

  GeneratedColumn<double> get reputationScore => $composableBuilder(
      column: $table.reputationScore, builder: (column) => column);

  GeneratedColumn<int> get latencyMs =>
      $composableBuilder(column: $table.latencyMs, builder: (column) => column);

  GeneratedColumn<bool> get isConnected => $composableBuilder(
      column: $table.isConnected, builder: (column) => column);

  GeneratedColumn<bool> get isBanned =>
      $composableBuilder(column: $table.isBanned, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSeenAt => $composableBuilder(
      column: $table.lastSeenAt, builder: (column) => column);
}

class $$NodeMetadataTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NodeMetadataTable,
    NodeMetadataData,
    $$NodeMetadataTableFilterComposer,
    $$NodeMetadataTableOrderingComposer,
    $$NodeMetadataTableAnnotationComposer,
    $$NodeMetadataTableCreateCompanionBuilder,
    $$NodeMetadataTableUpdateCompanionBuilder,
    (
      NodeMetadataData,
      BaseReferences<_$AppDatabase, $NodeMetadataTable, NodeMetadataData>
    ),
    NodeMetadataData,
    PrefetchHooks Function()> {
  $$NodeMetadataTableTableManager(_$AppDatabase db, $NodeMetadataTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NodeMetadataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NodeMetadataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NodeMetadataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<String?> nodeId = const Value.absent(),
            Value<String> nodePublicKey = const Value.absent(),
            Value<String> multiaddressesJson = const Value.absent(),
            Value<String> protocolVersion = const Value.absent(),
            Value<double> reputationScore = const Value.absent(),
            Value<int> latencyMs = const Value.absent(),
            Value<bool> isConnected = const Value.absent(),
            Value<bool> isBanned = const Value.absent(),
            Value<DateTime> lastSeenAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              NodeMetadataCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            version: version,
            isDirty: isDirty,
            nodeId: nodeId,
            nodePublicKey: nodePublicKey,
            multiaddressesJson: multiaddressesJson,
            protocolVersion: protocolVersion,
            reputationScore: reputationScore,
            latencyMs: latencyMs,
            isConnected: isConnected,
            isBanned: isBanned,
            lastSeenAt: lastSeenAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDirty = const Value.absent(),
            Value<String?> nodeId = const Value.absent(),
            required String nodePublicKey,
            Value<String> multiaddressesJson = const Value.absent(),
            Value<String> protocolVersion = const Value.absent(),
            Value<double> reputationScore = const Value.absent(),
            Value<int> latencyMs = const Value.absent(),
            Value<bool> isConnected = const Value.absent(),
            Value<bool> isBanned = const Value.absent(),
            Value<DateTime> lastSeenAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              NodeMetadataCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            lastSyncedAt: lastSyncedAt,
            remoteId: remoteId,
            version: version,
            isDirty: isDirty,
            nodeId: nodeId,
            nodePublicKey: nodePublicKey,
            multiaddressesJson: multiaddressesJson,
            protocolVersion: protocolVersion,
            reputationScore: reputationScore,
            latencyMs: latencyMs,
            isConnected: isConnected,
            isBanned: isBanned,
            lastSeenAt: lastSeenAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$NodeMetadataTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $NodeMetadataTable,
    NodeMetadataData,
    $$NodeMetadataTableFilterComposer,
    $$NodeMetadataTableOrderingComposer,
    $$NodeMetadataTableAnnotationComposer,
    $$NodeMetadataTableCreateCompanionBuilder,
    $$NodeMetadataTableUpdateCompanionBuilder,
    (
      NodeMetadataData,
      BaseReferences<_$AppDatabase, $NodeMetadataTable, NodeMetadataData>
    ),
    NodeMetadataData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BooksTableTableManager get books =>
      $$BooksTableTableManager(_db, _db.books);
  $$NotesTableTableManager get notes =>
      $$NotesTableTableManager(_db, _db.notes);
  $$ResearchPapersTableTableManager get researchPapers =>
      $$ResearchPapersTableTableManager(_db, _db.researchPapers);
  $$DownloadsTableTableManager get downloads =>
      $$DownloadsTableTableManager(_db, _db.downloads);
  $$FavoritesTableTableManager get favorites =>
      $$FavoritesTableTableManager(_db, _db.favorites);
  $$ReadingProgressTableTableManager get readingProgress =>
      $$ReadingProgressTableTableManager(_db, _db.readingProgress);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$AuthorsTableTableManager get authors =>
      $$AuthorsTableTableManager(_db, _db.authors);
  $$SearchHistoryTableTableManager get searchHistory =>
      $$SearchHistoryTableTableManager(_db, _db.searchHistory);
  $$RecentSearchesTableTableManager get recentSearches =>
      $$RecentSearchesTableTableManager(_db, _db.recentSearches);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
  $$CacheMetadataTableTableManager get cacheMetadata =>
      $$CacheMetadataTableTableManager(_db, _db.cacheMetadata);
  $$NetworkMetadataTableTableManager get networkMetadata =>
      $$NetworkMetadataTableTableManager(_db, _db.networkMetadata);
  $$NodeMetadataTableTableManager get nodeMetadata =>
      $$NodeMetadataTableTableManager(_db, _db.nodeMetadata);
}
