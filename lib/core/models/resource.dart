// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:admin/core/models/common/resource/description.dart';
import 'package:admin/core/models/common/resource/displayname.dart';
import 'package:flutter/foundation.dart';

import 'package:admin/core/base/base_model.dart';

class ResourceModel implements BaseModel {
  String? id;
  List<DisplayNameModel>? displayNames;
  int? type;
  String? url;
  List<DescriptionModel>? descriptions;
  List<dynamic>? tags;
  String? status;
  String? createdBy;
  String? modifiedBy;
  String? createdByBehalfOf;
  String? modifiedByBehalfOf;
  ResourceModel({
    this.id,
    this.displayNames,
    this.type,
    this.url,
    this.descriptions,
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
      displayNames: [],
      tags: [],
      descriptions: [],
      status: "",
      url: "",
      type: 0,
    );
  }

  ResourceModel copyWith({
    String? id,
    List<DisplayNameModel>? displayNames,
    int? type,
    String? url,
    List<DescriptionModel>? descriptions,
    List<dynamic>? tags,
    String? status,
    String? createdBy,
    String? modifiedBy,
    String? createdByBehalfOf,
    String? modifiedByBehalfOf,
  }) {
    return ResourceModel(
      id: id ?? this.id,
      displayNames: displayNames ?? this.displayNames,
      type: type ?? this.type,
      url: url ?? this.url,
      descriptions: descriptions ?? this.descriptions,
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
      'displayNames': displayNames,
      'type': type,
      'url': url,
      'descriptions': descriptions,
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
      id: map['id'] != null ? map['id'] as String : '',
      displayNames: map['displayNames'] != null
          ? List<DisplayNameModel>.from((map['displayNames'] as List<dynamic>))
          : [],
      type: map['type'] != null ? map['type'] as int : 0,
      url: map['url'] != null ? map['url'] as String : '',
      descriptions: map['descriptions'] != null
          ? List<DescriptionModel>.from((map['descriptions'] as List<dynamic>))
          : [],
      tags: map['tags'] != null
          ? List<dynamic>.from((map['tags'] as List<dynamic>))
          : [],
      status: map['status'] != null ? map['status'] as String : '',
      createdBy: map['createdBy'] != null ? map['createdBy'] as String : '',
      modifiedBy: map['modifiedBy'] != null ? map['modifiedBy'] as String : '',
      createdByBehalfOf: map['createdByBehalfOf'] != null
          ? map['createdByBehalfOf'] as String
          : '',
      modifiedByBehalfOf: map['modifiedByBehalfOf'] != null
          ? map['modifiedByBehalfOf'] as String
          : '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ResourceModel.fromJson(String source) =>
      ResourceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResourceModel(id: $id, displayNames: $displayNames, type: $type, url: $url, descriptions: $descriptions, tags: $tags, status: $status, createdBy: $createdBy, modifiedBy: $modifiedBy, createdByBehalfOf: $createdByBehalfOf, modifiedByBehalfOf: $modifiedByBehalfOf)';
  }

  @override
  bool operator ==(covariant ResourceModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        listEquals(other.displayNames, displayNames) &&
        other.type == type &&
        other.url == url &&
        listEquals(other.descriptions, descriptions) &&
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
        displayNames.hashCode ^
        type.hashCode ^
        url.hashCode ^
        descriptions.hashCode ^
        tags.hashCode ^
        status.hashCode ^
        createdBy.hashCode ^
        modifiedBy.hashCode ^
        createdByBehalfOf.hashCode ^
        modifiedByBehalfOf.hashCode;
  }

  @override
  List<String> columns = [
    "displayNames",
    "type",
    "url",
    "descriptions",
    "tags",
    "status",
    "createdAt",
    "modifiedAt",
    "createdBy",
  ];
}
