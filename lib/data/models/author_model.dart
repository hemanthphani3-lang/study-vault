/// Immutable domain and data model representing academic authors and researchers.
class AuthorModel {
  const AuthorModel({
    required this.id,
    required this.name,
    this.orcid,
    this.institution,
    this.bio,
    this.avatarUrl,
    this.publicationCount = 0,
    this.hIndex = 0,
    this.createdAt,
    this.updatedAt,
    this.isDeleted = false,
    this.deletedAt,
    this.syncStatus = 'synced',
    this.lastSyncedAt,
    this.remoteId,
    this.version = 1,
    this.isDirty = false,
    this.nodeId,
  });

  final String id;
  final String name;
  final String? orcid;
  final String? institution;
  final String? bio;
  final String? avatarUrl;
  final int publicationCount;
  final int hIndex;

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool isDeleted;
  final DateTime? deletedAt;
  final String syncStatus;
  final DateTime? lastSyncedAt;
  final String? remoteId;
  final int version;
  final bool isDirty;
  final String? nodeId;

  AuthorModel copyWith({
    String? id,
    String? name,
    String? orcid,
    String? institution,
    String? bio,
    String? avatarUrl,
    int? publicationCount,
    int? hIndex,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
    DateTime? deletedAt,
    String? syncStatus,
    DateTime? lastSyncedAt,
    String? remoteId,
    int? version,
    bool? isDirty,
    String? nodeId,
  }) {
    return AuthorModel(
      id: id ?? this.id,
      name: name ?? this.name,
      orcid: orcid ?? this.orcid,
      institution: institution ?? this.institution,
      bio: bio ?? this.bio,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      publicationCount: publicationCount ?? this.publicationCount,
      hIndex: hIndex ?? this.hIndex,
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
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'orcid': orcid,
      'institution': institution,
      'bio': bio,
      'avatarUrl': avatarUrl,
      'publicationCount': publicationCount,
      'hIndex': hIndex,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'isDeleted': isDeleted,
      'deletedAt': deletedAt?.toIso8601String(),
      'syncStatus': syncStatus,
      'lastSyncedAt': lastSyncedAt?.toIso8601String(),
      'remoteId': remoteId,
      'version': version,
      'isDirty': isDirty,
      'nodeId': nodeId,
    };
  }

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      orcid: json['orcid'] as String?,
      institution: json['institution'] as String?,
      bio: json['bio'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      publicationCount: json['publicationCount'] as int? ?? 0,
      hIndex: json['hIndex'] as int? ?? 0,
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt'] as String) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.tryParse(json['updatedAt'] as String) : null,
      isDeleted: json['isDeleted'] as bool? ?? false,
      deletedAt: json['deletedAt'] != null ? DateTime.tryParse(json['deletedAt'] as String) : null,
      syncStatus: json['syncStatus'] as String? ?? 'synced',
      lastSyncedAt: json['lastSyncedAt'] != null ? DateTime.tryParse(json['lastSyncedAt'] as String) : null,
      remoteId: json['remoteId'] as String?,
      version: json['version'] as int? ?? 1,
      isDirty: json['isDirty'] as bool? ?? false,
      nodeId: json['nodeId'] as String?,
    );
  }
}
