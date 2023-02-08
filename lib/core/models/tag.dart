// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class TagModel {
  final String firstName;
  final String lastName;
  final IconData statu;
  final String tags;
  final IconData edit;

  TagModel({
    required this.firstName,
    required this.lastName,
    required this.statu,
    required this.tags,
    required this.edit,
  });

  factory TagModel.init() {
    return TagModel(
        firstName: "Ozan Deniz",
        lastName: "Demirtas",
        statu: Icons.check,
        tags: "tag",
        edit: Icons.edit);
  }

  TagModel copyWith({
    String? firstName,
    String? lastName,
    IconData? statu,
    String? tags,
    IconData? edit,
  }) {
    return TagModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      statu: statu ?? this.statu,
      tags: tags ?? this.tags,
      edit: edit ?? this.edit,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'statu': statu.codePoint,
      'tags': tags,
      'edit': edit.codePoint,
    };
  }

  factory TagModel.fromMap(Map<String, dynamic> map) {
    return TagModel(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      statu: IconData(map['statu'] as int, fontFamily: 'MaterialIcons'),
      tags: map['tags'] as String,
      edit: IconData(map['edit'] as int, fontFamily: 'MaterialIcons'),
    );
  }

  String toJson() => json.encode(toMap());

  factory TagModel.fromJson(String source) =>
      TagModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TagModel(firstName: $firstName, lastName: $lastName, statu: $statu, tags: $tags, edit: $edit)';
  }

  @override
  bool operator ==(covariant TagModel other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.lastName == lastName &&
        other.statu == statu &&
        other.tags == tags &&
        other.edit == edit;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        statu.hashCode ^
        tags.hashCode ^
        edit.hashCode;
  }
}
