// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../layout_helpers/form_column_model.dart';

class UpdateLayout {
  String url;
  String dataUrl;
  List<FormColumns> columns;
  UpdateLayout({
    required this.url,
    required this.dataUrl,
    required this.columns,
  });

  UpdateLayout copyWith({
    String? url,
    String? dataUrl,
    List<FormColumns>? columns,
  }) {
    return UpdateLayout(
      url: url ?? this.url,
      dataUrl: dataUrl ?? this.dataUrl,
      columns: columns ?? this.columns,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'data_url': dataUrl,
      'columns': columns.map((x) => x.toMap()).toList(),
    };
  }

  factory UpdateLayout.fromMap(Map<String, dynamic> map) {
    return UpdateLayout(
      url: map['url'] as String,
      dataUrl: map['data_url'] as String,
      columns: List<FormColumns>.from(
        (map['columns']).map<FormColumns>(
          (x) => FormColumns.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateLayout.fromJson(String source) => UpdateLayout.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UpdateLayout(url: $url, dataUrl: $dataUrl, columns: $columns)';

  @override
  bool operator ==(covariant UpdateLayout other) {
    if (identical(this, other)) return true;

    return other.url == url && other.dataUrl == dataUrl && listEquals(other.columns, columns);
  }

  @override
  int get hashCode => url.hashCode ^ dataUrl.hashCode ^ columns.hashCode;
}
