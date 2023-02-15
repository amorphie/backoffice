// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class RoleGroupModel {
  final String id;
  final String title;
  final List<String>? tags;
  final String? status;
  final DateTime? createdAt;
  final DateTime? modifiedAt;
  final String? createdBy;
  final String? modifiedBy;
  final String? createdByBehalfOf;
  final String? modifiedByBehalfOf;
  RoleGroupModel({
    required this.id,
    required this.title,
    this.tags,
    this.status,
    this.createdAt,
    this.modifiedAt,
    this.createdBy,
    this.modifiedBy,
    this.createdByBehalfOf,
    this.modifiedByBehalfOf,
  });

  RoleGroupModel copyWith({
    String? id,
    String? title,
    List<String>? tags,
    String? status,
    DateTime? createdAt,
    DateTime? modifiedAt,
    String? createdBy,
    String? modifiedBy,
    String? createdByBehalfOf,
    String? modifiedByBehalfOf,
  }) {
    return RoleGroupModel(
      id: id ?? this.id,
      title: title ?? this.title,
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
      'title': title,
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

  factory RoleGroupModel.fromMap(Map<String, dynamic> map) {
    return RoleGroupModel(
      id: map['id'] as String,
      title: map['title'] as String,
      tags: map['tags'] != null
          ? List<String>.from((map['tags'] as List<String>))
          : null,
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

  factory RoleGroupModel.fromJson(String source) =>
      RoleGroupModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RoleGroupModel(id: $id, title: $title, tags: $tags, status: $status, createdAt: $createdAt, modifiedAt: $modifiedAt, createdBy: $createdBy, modifiedBy: $modifiedBy, createdByBehalfOf: $createdByBehalfOf, modifiedByBehalfOf: $modifiedByBehalfOf)';
  }

  @override
  bool operator ==(covariant RoleGroupModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
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
        title.hashCode ^
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
