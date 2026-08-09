/// Sorting options for academic discovery and library ordering.
enum SearchSortOption {
  mostRelevant(label: 'Most Relevant', description: 'Weighted title, author, and keyword score'),
  highestSeeders(label: 'Highest Seeders', description: 'Maximum active swarm seeder nodes'),
  publicationYearDesc(label: 'Newest', description: 'Most recently published articles and books'),
  publicationYearAsc(label: 'Oldest', description: 'Earliest historical editions and papers'),
  titleAsc(label: 'Title (A-Z)', description: 'Alphabetical ascending by document title'),
  titleDesc(label: 'Title (Z-A)', description: 'Alphabetical descending by document title'),
  authorAsc(label: 'Author (A-Z)', description: 'Alphabetical by primary author name'),
  recentlyOpened(label: 'Recently Opened', description: 'Most recently accessed in local vault'),
  recentlyDownloaded(label: 'Recently Downloaded', description: 'Most recent download completions'),
  peerCount(label: 'Peer Count', description: 'Total connected network peers'),
  availabilityScore(label: 'Availability Score', description: 'Swarm health and chunk availability'),
  trustScore(label: 'Trust Score', description: 'Cryptographic reputation and quorum consensus');

  const SearchSortOption({
    required this.label,
    required this.description,
  });

  final String label;
  final String description;
}
