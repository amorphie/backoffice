// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class TagModel {
  final String id;
  final String tagName;
  final IconData edit;
  final String url;
  final int ttl;
  final DateTime? createdDate;
  final DateTime? lastModifiedDate;

  TagModel({
    required this.id,
    required this.tagName,
    required this.edit,
    required this.url,
    required this.ttl,
    this.createdDate,
    this.lastModifiedDate,
  });

  factory TagModel.init() {
    return TagModel(
      id: "Ozan Deniz",
      tagName: "tag",
      edit: Icons.edit,
      ttl: 0,
      url: "",
    );
  }

  TagModel copyWith({
    String? id,
    String? tagName,
    IconData? edit,
    String? url,
    int? ttl,
    DateTime? createdDate,
    DateTime? lastModifiedDate,
  }) {
    return TagModel(
      id: id ?? this.id,
      tagName: tagName ?? this.tagName,
      edit: edit ?? this.edit,
      url: url ?? this.url,
      ttl: ttl ?? this.ttl,
      createdDate: createdDate ?? this.createdDate,
      lastModifiedDate: lastModifiedDate ?? this.lastModifiedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'tagName': tagName,
      'edit': edit.codePoint,
      'url': url,
      'ttl': ttl,
      'createdDate': createdDate?.millisecondsSinceEpoch,
      'lastModifiedDate': lastModifiedDate?.millisecondsSinceEpoch,
    };
  }

  factory TagModel.fromMap(Map<String, dynamic> map) {
    return TagModel(
      id: map['id'] as String,
      tagName: map['tagName'] as String,
      edit: IconData(map['edit'] as int, fontFamily: 'MaterialIcons'),
      url: map['url'] as String,
      ttl: map['ttl'] as int,
      createdDate: map['createdDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdDate'] as int)
          : null,
      lastModifiedDate: map['lastModifiedDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['lastModifiedDate'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TagModel.fromJson(String source) =>
      TagModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TagModel(id: $id, tagName: $tagName, edit: $edit, url: $url, ttl: $ttl, createdDate: $createdDate, lastModifiedDate: $lastModifiedDate)';
  }

  @override
  bool operator ==(covariant TagModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.tagName == tagName &&
        other.edit == edit &&
        other.url == url &&
        other.ttl == ttl &&
        other.createdDate == createdDate &&
        other.lastModifiedDate == lastModifiedDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        tagName.hashCode ^
        edit.hashCode ^
        url.hashCode ^
        ttl.hashCode ^
        createdDate.hashCode ^
        lastModifiedDate.hashCode;
  }
}
