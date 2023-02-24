// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:admin/core/base/base_model.dart';
import 'package:flutter/foundation.dart';

class ResourceModel implements BaseModel {
  String? id;
  String? displayName;
  String? type;
  String? url;
  String? description;
  List<String>? tags;
  String? status;
  DateTime? createdAt;
  DateTime? modifiedAt;
  String? createdBy;
  String? modifiedBy;
  String? createdByBehalfOf;
  String? modifiedByBehalfOf;
  ResourceModel({
    required this.id,
    this.displayName,
    this.type,
    this.url,
    this.description,
    this.tags,
    this.status,
    this.createdAt,
    this.modifiedAt,
    this.createdBy,
    this.modifiedBy,
    this.createdByBehalfOf,
    this.modifiedByBehalfOf,
  });

  factory ResourceModel.init() {
    return ResourceModel(
      id: "",
      displayName: "",
      tags: [],
      description: "",
      status: "",
      url: "",
      type: "",
    );
  }

  ResourceModel copyWith({
    String? id,
    String? displayName,
    String? type,
    String? url,
    String? description,
    List<String>? tags,
    String? status,
    DateTime? createdAt,
    DateTime? modifiedAt,
    String? createdBy,
    String? modifiedBy,
    String? createdByBehalfOf,
    String? modifiedByBehalfOf,
  }) {
    return ResourceModel(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      type: type ?? this.type,
      url: url ?? this.url,
      description: description ?? this.description,
      tags: tags ?? this.tags,
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
      'displayName': displayName,
      'type': type,
      'url': url,
      'description': description,
      'tags': tags,
      'status': status,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'modifiedAt': modifiedAt?.millisecondsSinceEpoch,
      'createdBy': createdBy,
      'modifiedBy': modifiedBy,
      'createdByBehalfOf': createdByBehalfOf,
      'modifiedByBehalfOf': modifiedByBehalfOf,
    };
  }

  factory ResourceModel.fromMap(Map<String, dynamic> map) {
    return ResourceModel(
      id: map['id'] as String,
      displayName: map['displayName'] != null ? map['displayName'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      tags: map['tags'] != null ? List<String>.from((map['tags'] as List<String>)) : null,
      status: map['status'] != null ? map['status'] as String : null,
      createdAt: map['createdAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int) : null,
      modifiedAt: map['modifiedAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['modifiedAt'] as int) : null,
      createdBy: map['createdBy'] != null ? map['createdBy'] as String : null,
      modifiedBy: map['modifiedBy'] != null ? map['modifiedBy'] as String : null,
      createdByBehalfOf: map['createdByBehalfOf'] != null ? map['createdByBehalfOf'] as String : null,
      modifiedByBehalfOf: map['modifiedByBehalfOf'] != null ? map['modifiedByBehalfOf'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResourceModel.fromJson(String source) => ResourceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Resource(id: $id, displayName: $displayName, type: $type, url: $url, description: $description, tags: $tags, status: $status, createdAt: $createdAt, modifiedAt: $modifiedAt, createdBy: $createdBy, modifiedBy: $modifiedBy, createdByBehalfOf: $createdByBehalfOf, modifiedByBehalfOf: $modifiedByBehalfOf)';
  }

  @override
  bool operator ==(covariant ResourceModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.displayName == displayName &&
        other.type == type &&
        other.url == url &&
        other.description == description &&
        listEquals(other.tags, tags) &&
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
        displayName.hashCode ^
        type.hashCode ^
        url.hashCode ^
        description.hashCode ^
        tags.hashCode ^
        status.hashCode ^
        createdAt.hashCode ^
        modifiedAt.hashCode ^
        createdBy.hashCode ^
        modifiedBy.hashCode ^
        createdByBehalfOf.hashCode ^
        modifiedByBehalfOf.hashCode;
  }

  @override
  List<String> columns = [
    "displayName",
    "type",
    "url",
    "description",
    "tags",
    "status",
    "createdAt",
    "modifiedAt",
    "createdBy",
  ];
}
