// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class RoleModel {
  final String? id;
  final List<dynamic>? titles;
  final List<dynamic>? tags;
  final String? status;
  final DateTime? createdAt;
  final DateTime? modifiedAt;
  final String? createdBy;
  final String? modifiedBy;
  final String? createdByBehalfOf;
  final String? modifiedByBehalfOf;
  RoleModel({
    this.id,
    this.titles,
    this.tags,
    this.status,
    this.createdAt,
    this.modifiedAt,
    this.createdBy,
    this.modifiedBy,
    this.createdByBehalfOf,
    this.modifiedByBehalfOf,
  });

  factory RoleModel.init() {
    return RoleModel(id: "", titles: []);
  }

  RoleModel copyWith({
    String? id,
    String? title,
    List<dynamic>? tags,
    String? status,
    DateTime? createdAt,
    DateTime? modifiedAt,
    String? createdBy,
    String? modifiedBy,
    String? createdByBehalfOf,
    String? modifiedByBehalfOf,
  }) {
    return RoleModel(
      id: id ?? this.id,
      titles: titles ?? this.titles,
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
      'titles': titles,
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

  factory RoleModel.fromMap(Map<String, dynamic> map) {
    return RoleModel(
      id: map['id'] as String,
      titles: map['titles'] != null
          ? List<dynamic>.from((map['titles'] as List<dynamic>))
          : [],
      tags: map['tags'] != null
          ? List<dynamic>.from((map['tags'] as List<dynamic>))
          : [],
      status: map['status'] != null ? map['status'] as String : '',
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt'])
          : DateTime.now(),
      modifiedAt: map['modifiedAt'] != null
          ? DateTime.parse(map['modifiedAt'])
          : DateTime.now(),
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

  factory RoleModel.fromJson(String source) =>
      RoleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RoleModel(id: $id, titles: $titles, tags: $tags, status: $status, createdAt: $createdAt, modifiedAt: $modifiedAt, createdBy: $createdBy, modifiedBy: $modifiedBy, createdByBehalfOf: $createdByBehalfOf, modifiedByBehalfOf: $modifiedByBehalfOf)';
  }

  @override
  bool operator ==(covariant RoleModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        listEquals(other.titles, titles) &&
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
        titles.hashCode ^
        tags.hashCode ^
        status.hashCode ^
        createdAt.hashCode ^
        modifiedAt.hashCode ^
        createdBy.hashCode ^
        modifiedBy.hashCode ^
        createdByBehalfOf.hashCode ^
        modifiedByBehalfOf.hashCode;
  }
}
