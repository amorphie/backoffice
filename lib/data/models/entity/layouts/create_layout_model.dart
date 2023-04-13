// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../layout_helpers/form_column_model.dart';

class CreateLayout {
  String url;
  List<FormColumns> columns;
  CreateLayout({
    required this.url,
    required this.columns,
  });

  CreateLayout copyWith({
    String? url,
    List<FormColumns>? columns,
  }) {
    return CreateLayout(
      url: url ?? this.url,
      columns: columns ?? this.columns,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'columns': columns.map((x) => x.toMap()).toList(),
    };
  }

  factory CreateLayout.fromMap(Map<String, dynamic> map) {
    return CreateLayout(
      url: map['url'] as String,
      columns: List<FormColumns>.from(
        (map['columns']).map<FormColumns>(
          (x) => FormColumns.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateLayout.fromJson(String source) => CreateLayout.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CreateLayout(url: $url, columns: $columns)';

  @override
  bool operator ==(covariant CreateLayout other) {
    if (identical(this, other)) return true;

    return other.url == url && listEquals(other.columns, columns);
  }

  @override
  int get hashCode => url.hashCode ^ columns.hashCode;
}
