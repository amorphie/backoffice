// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class TagModel {
  final String? tagName;
  final String? url;
  final int? ttl;
  final List<String>? tag;
  TagModel({
    required this.tagName,
    this.url,
    this.ttl,
    this.tag,
  });

  factory TagModel.init() {
    return TagModel(tagName: "tag", ttl: 0, url: "", tag: []);
  }

  TagModel copyWith({
    String? tagName,
    String? url,
    int? ttl,
    List<String>? tag,
  }) {
    return TagModel(
      tagName: tagName ?? this.tagName,
      url: url ?? this.url,
      ttl: ttl ?? this.ttl,
      tag: tag ?? this.tag,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tagName': tagName,
      'url': url,
      'ttl': ttl,
      'tag': tag,
    };
  }

  factory TagModel.fromMap(Map<String, dynamic> map) {
    return TagModel(
      tagName: (map['tagName'] as String?) ?? "",
      url: (map['url'] as String?) ?? "",
      ttl: (map['ttl'] as int?) ?? 0,
      tag: map['tag'] != null
          ? List<String>.from((map['tag'] as List<String>))
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory TagModel.fromJson(String source) =>
      TagModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TagModel(tagName: $tagName, url: $url, ttl: $ttl, tag: $tag)';
  }

  @override
  bool operator ==(covariant TagModel other) {
    if (identical(this, other)) return true;

    return other.tagName == tagName &&
        other.url == url &&
        other.ttl == ttl &&
        listEquals(other.tag, tag);
  }

  @override
  int get hashCode {
    return tagName.hashCode ^ url.hashCode ^ ttl.hashCode ^ tag.hashCode;
  }
}
