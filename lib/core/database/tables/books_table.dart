import 'package:drift/drift.dart';
import 'base_sync_table.dart';

/// Books table storing academic textbooks, reference guides, and digital publications.
@TableIndex(name: 'books_cid_idx', columns: {#cid})
@TableIndex(name: 'books_category_idx', columns: {#categoryId})
@TableIndex(name: 'books_title_idx', columns: {#title})
@TableIndex(name: 'books_is_deleted_idx', columns: {#isDeleted})
@TableIndex(name: 'books_sync_status_idx', columns: {#syncStatus})
class Books extends Table with BaseSyncTable {
  /// Book title.
  TextColumn get title => text().withLength(min: 1, max: 500)();

  /// Subtitle or edition note.
  TextColumn get subtitle => text().nullable()();

  /// JSON-encoded array of author names.
  TextColumn get authorsJson => text().withDefault(const Constant('[]'))();

  /// Publisher or academic press name.
  TextColumn get publisher => text().nullable()();

  /// Year of publication.
  IntColumn get publicationYear => integer().nullable()();

  /// International Standard Book Number (ISBN-10 or ISBN-13).
  TextColumn get isbn => text().nullable()();

  /// Digital Object Identifier.
  TextColumn get doi => text().nullable()();

  /// Language code (e.g., 'en', 'es', 'de').
  TextColumn get language => text().withDefault(const Constant('en'))();

  /// Total page count.
  IntColumn get pageCount => integer().withDefault(const Constant(0))();

  /// File format ('pdf', 'epub', 'markdown', 'djvu').
  TextColumn get format => text().withDefault(const Constant('pdf'))();

  /// File size in bytes.
  IntColumn get sizeBytes => integer().withDefault(const Constant(0))();

  /// Local path or remote asset URI for cover art.
  TextColumn get coverPath => text().nullable()();

  /// InterPlanetary File System (IPFS) Content Identifier (CID v1).
  TextColumn get cid => text().nullable()();

  /// Cryptographic SHA-256 hash of the content payload.
  TextColumn get contentHash => text().nullable()();

  /// Verification tier ('verified', 'peerReviewed', 'community', 'unverified').
  TextColumn get verificationTier => text().withDefault(const Constant('verified'))();

  /// Category slug or identifier linking to [Categories].
  TextColumn get categoryId => text().nullable()();

  /// Arbitrary JSON metadata for extensible academic indexing.
  TextColumn get metadataJson => text().withDefault(const Constant('{}'))();

  /// Indicates if the full payload has been stored locally in the vault.
  BoolColumn get isDownloaded => boolean().withDefault(const Constant(false))();

  /// Active peer seeders count observed in knowledge network.
  IntColumn get peerSeeders => integer().withDefault(const Constant(0))();
}
