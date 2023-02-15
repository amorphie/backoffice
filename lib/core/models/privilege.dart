// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PrivilegeModel {
  final String id;
  final String resourceId;
  final String? url;
  final int ttl;
  final String? status;
  final DateTime? createdAt;
  final DateTime? modifiedAt;
  final String? createdBy;
  final String? modifiedBy;
  final String? createdByBehalfOf;
  final String? modifiedByBehalfOf;
  PrivilegeModel({
    required this.id,
    required this.resourceId,
    this.url,
    required this.ttl,
    this.status,
    this.createdAt,
    this.modifiedAt,
    this.createdBy,
    this.modifiedBy,
    this.createdByBehalfOf,
    this.modifiedByBehalfOf,
  });

  factory PrivilegeModel.init() {
    return PrivilegeModel(id: "", resourceId: "", ttl: 0);
  }

  PrivilegeModel copyWith({
    String? id,
    String? resourceId,
    String? url,
    int? ttl,
    String? status,
    DateTime? createdAt,
    DateTime? modifiedAt,
    String? createdBy,
    String? modifiedBy,
    String? createdByBehalfOf,
    String? modifiedByBehalfOf,
  }) {
    return PrivilegeModel(
      id: id ?? this.id,
      resourceId: resourceId ?? this.resourceId,
      url: url ?? this.url,
      ttl: ttl ?? this.ttl,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      createdBy: createdBy ?? this.createdBy,
      modifiedBy: modifiedBy ?? this.modifiedBy,
      createdByBehalfOf: createdByBehalfOf ?? this.createdByBehalfOf,
      modifiedByBehalfOf: modifiedByBehalfOf ?? this.modifiedByBehalfOf,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'resourceId': resourceId,
      'url': url,
      'ttl': ttl,
      'status': status,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'modifiedAt': modifiedAt?.millisecondsSinceEpoch,
      'createdBy': createdBy,
      'modifiedBy': modifiedBy,
      'createdByBehalfOf': createdByBehalfOf,
      'modifiedByBehalfOf': modifiedByBehalfOf,
    };
  }

  factory PrivilegeModel.fromMap(Map<String, dynamic> map) {
    return PrivilegeModel(
      id: map['id'] as String,
      resourceId: map['resourceId'] as String,
      url: map['url'] != null ? map['url'] as String : null,
      ttl: map['ttl'] as int,
      status: map['status'] != null ? map['status'] as String : null,
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int)
          : null,
      modifiedAt: map['modifiedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['modifiedAt'] as int)
          : null,
      createdBy: map['createdBy'] != null ? map['createdBy'] as String : null,
      modifiedBy:
          map['modifiedBy'] != null ? map['modifiedBy'] as String : null,
      createdByBehalfOf: map['createdByBehalfOf'] != null
          ? map['createdByBehalfOf'] as String
          : null,
      modifiedByBehalfOf: map['modifiedByBehalfOf'] != null
          ? map['modifiedByBehalfOf'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PrivilegeModel.fromJson(String source) =>
      PrivilegeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PrivilegeModel(id: $id, resourceId: $resourceId, url: $url, ttl: $ttl, status: $status, createdAt: $createdAt, modifiedAt: $modifiedAt, createdBy: $createdBy, modifiedBy: $modifiedBy, createdByBehalfOf: $createdByBehalfOf, modifiedByBehalfOf: $modifiedByBehalfOf)';
  }

  @override
  bool operator ==(covariant PrivilegeModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.resourceId == resourceId &&
        other.url == url &&
        other.ttl == ttl &&
        other.status == status &&
        other.createdAt == createdAt &&
        other.modifiedAt == modifiedAt &&
        other.createdBy == createdBy &&
        other.modifiedBy == modifiedBy &&
        other.createdByBehalfOf == createdByBehalfOf &&
        other.modifiedByBehalfOf == modifiedByBehalfOf;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        resourceId.hashCode ^
        url.hashCode ^
        ttl.hashCode ^
        status.hashCode ^
        createdAt.hashCode ^
        modifiedAt.hashCode ^
        createdBy.hashCode ^
        modifiedBy.hashCode ^
        createdByBehalfOf.hashCode ^
        modifiedByBehalfOf.hashCode;
  }
}
