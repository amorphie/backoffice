// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class TagModel {
  final String id;
  final String tagName;
  final IconData edit;

  TagModel({
    required this.id,
    required this.tagName,
    required this.edit,
  });

  factory TagModel.init() {
    return TagModel(id: "Ozan Deniz", tagName: "tag", edit: Icons.edit);
  }

  TagModel copyWith({
    String? id,
    String? tagName,
    IconData? edit,
  }) {
    return TagModel(
      id: id ?? this.id,
      tagName: tagName ?? this.tagName,
      edit: edit ?? this.edit,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'tagName': tagName,
      'edit': edit.codePoint,
    };
  }

  factory TagModel.fromMap(Map<String, dynamic> map) {
    return TagModel(
      id: map['id'] as String,
      tagName: map['tagName'] as String,
      edit: IconData(map['edit'] as int, fontFamily: 'MaterialIcons'),
    );
  }

  String toJson() => json.encode(toMap());

  factory TagModel.fromJson(String source) =>
      TagModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TagModel(id: $id, tagName: $tagName, edit: $edit)';

  @override
  bool operator ==(covariant TagModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.tagName == tagName && other.edit == edit;
  }

  @override
  int get hashCode => id.hashCode ^ tagName.hashCode ^ edit.hashCode;
}
