// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class TagModel {
  final String? name;
  final String? url;
  final int? ttl;
  final List<dynamic>? tags;
  TagModel({
    required this.name,
    this.url,
    this.ttl,
    this.tags,
  });

  factory TagModel.init() {
    return TagModel(name: "tag", ttl: 0, url: "", tags: []);
  }

  TagModel copyWith({
    String? name,
    String? url,
    int? ttl,
    List<dynamic>? tags,
  }) {
    return TagModel(
      name: name ?? this.name,
      url: url ?? this.url,
      ttl: ttl ?? this.ttl,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
      'ttl': ttl,
      'tags': tags,
    };
  }

  factory TagModel.fromMap(Map<String, dynamic> map) {
    return TagModel(
      name: (map['name'] as String?) ?? "",
      url: (map['url'] as String?) ?? "",
      ttl: (map['ttl'] as int?) ?? 0,
      tags: map['tags'] != null
          ? List<dynamic>.from((map['tags'] as List<dynamic>))
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory TagModel.fromJson(String source) =>
      TagModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TagModel(name: $name, url: $url, ttl: $ttl, tags: $tags)';
  }

  @override
  bool operator ==(covariant TagModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.url == url &&
        other.ttl == ttl &&
        listEquals(other.tags, tags);
  }

  @override
  int get hashCode {
    return name.hashCode ^ url.hashCode ^ ttl.hashCode ^ tags.hashCode;
  }

  @override
  // ignore: override_on_non_overriding_member
  List<String> columns = [
    "name",
    "ttl",
    "url",
    "tags",
  ];
}
