// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:admin/core/base/base_model.dart';

class ResourceModel implements BaseModel {
  String? id;
  List<dynamic>? displayName;
  int? type;
  String? url;
  List<dynamic>? description;
  List<dynamic>? tags;
  String? status;
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
    this.createdBy,
    this.modifiedBy,
    this.createdByBehalfOf,
    this.modifiedByBehalfOf,
  });

  factory ResourceModel.init() {
    return ResourceModel(
      id: "",
      displayName: [],
      tags: [],
      description: [],
      status: "",
      url: "",
      type: 0,
    );
  }

  ResourceModel copyWith({
    String? id,
    List<dynamic>? displayName,
    int? type,
    String? url,
    List<dynamic>? description,
    List<dynamic>? tags,
    String? status,
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
      'createdBy': createdBy,
      'modifiedBy': modifiedBy,
      'createdByBehalfOf': createdByBehalfOf,
      'modifiedByBehalfOf': modifiedByBehalfOf,
    };
  }

  factory ResourceModel.fromMap(Map<String, dynamic> map) {
    return ResourceModel(
      id: map['id'] != null ? map['id'] as String : null,
      displayName: map['displayName'] != null
          ? List<dynamic>.from((map['displayName'] as List<dynamic>))
          : null,
      type: map['type'] != null ? map['type'] as int : null,
      url: map['url'] != null ? map['url'] as String : null,
      description: map['description'] != null
          ? List<dynamic>.from((map['description'] as List<dynamic>))
          : null,
      tags: map['tags'] != null
          ? List<dynamic>.from((map['tags'] as List<dynamic>))
          : null,
      status: map['status'] != null ? map['status'] as String : null,
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

  factory ResourceModel.fromJson(String source) =>
      ResourceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResourceModel(id: $id, displayName: $displayName, type: $type, url: $url, description: $description, tags: $tags, status: $status, createdBy: $createdBy, modifiedBy: $modifiedBy, createdByBehalfOf: $createdByBehalfOf, modifiedByBehalfOf: $modifiedByBehalfOf)';
  }

  @override
  bool operator ==(covariant ResourceModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        listEquals(other.displayName, displayName) &&
        other.type == type &&
        other.url == url &&
        listEquals(other.description, description) &&
        listEquals(other.tags, tags) &&
        other.status == status &&
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
