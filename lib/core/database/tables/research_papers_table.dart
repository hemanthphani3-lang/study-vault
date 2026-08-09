import 'package:drift/drift.dart';
import 'base_sync_table.dart';

/// Research Papers table storing academic papers, conference proceedings, preprints, and manuscripts.
@TableIndex(name: 'papers_cid_idx', columns: {#cid})
@TableIndex(name: 'papers_doi_idx', columns: {#doi})
@TableIndex(name: 'papers_arxiv_idx', columns: {#arxivId})
@TableIndex(name: 'papers_category_idx', columns: {#categoryId})
@TableIndex(name: 'papers_is_deleted_idx', columns: {#isDeleted})
@TableIndex(name: 'papers_title_idx', columns: {#title})
class ResearchPapers extends Table with BaseSyncTable {
  /// Paper title.
  TextColumn get title => text().withLength(min: 1, max: 600)();

  /// Formatted academic abstract.
  TextColumn get abstractText => text().withDefault(const Constant(''))();

  /// JSON array of authors with affiliations.
  TextColumn get authorsJson => text().withDefault(const Constant('[]'))();

  /// Publishing journal name.
  TextColumn get journal => text().nullable()();

  /// Conference name or proceedings banner.
  TextColumn get conference => text().nullable()();

  /// Volume number.
  TextColumn get volume => text().nullable()();

  /// Issue number.
  TextColumn get issue => text().nullable()();

  /// Pagination range (e.g., '142-168').
  TextColumn get pages => text().nullable()();

  /// Digital Object Identifier.
  TextColumn get doi => text().nullable()();

  /// arXiv preprint identifier.
  TextColumn get arxivId => text().nullable()();

  /// PubMed Accession ID (PMID).
  TextColumn get pubmedId => text().nullable()();

  /// Year of publication.
  IntColumn get publicationYear => integer().nullable()();

  /// Flag indicating verified peer review status.
  BoolColumn get isPeerReviewed => boolean().withDefault(const Constant(true))();

  /// Citations count.
  IntColumn get citationsCount => integer().withDefault(const Constant(0))();

  /// IPFS Content Identifier (CID v1).
  TextColumn get cid => text().nullable()();

  /// SHA-256 hash.
  TextColumn get contentHash => text().nullable()();

  /// File size in bytes.
  IntColumn get sizeBytes => integer().withDefault(const Constant(0))();

  /// File format ('pdf', 'latex', 'markdown').
  TextColumn get format => text().withDefault(const Constant('pdf'))();

  /// Category slug or identifier.
  TextColumn get categoryId => text().nullable()();

  /// Verification tier ('verified', 'peerReviewed', 'community', 'unverified').
  TextColumn get verificationTier => text().withDefault(const Constant('peerReviewed'))();

  /// Indicates if stored in local vault.
  BoolColumn get isDownloaded => boolean().withDefault(const Constant(false))();

  /// Active peer seeders count.
  IntColumn get peerSeeders => integer().withDefault(const Constant(0))();
}
