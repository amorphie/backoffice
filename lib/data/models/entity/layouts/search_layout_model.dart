// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../layout_helpers/filter_layout_model.dart';
import '../layout_helpers/search_column_model.dart';

class SearchLayout {
  String listUrl;
  String searchUrl;
  List<FilterLayout>? filter;
  List<SearchColumn> columns;
  SearchLayout({
    required this.listUrl,
    required this.searchUrl,
    this.filter,
    required this.columns,
  });

  SearchLayout copyWith({
    String? listUrl,
    String? searchUrl,
    List<FilterLayout>? filter,
    List<SearchColumn>? columns,
  }) {
    return SearchLayout(
      listUrl: listUrl ?? this.listUrl,
      searchUrl: searchUrl ?? this.searchUrl,
      filter: filter ?? this.filter,
      columns: columns ?? this.columns,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'list_url': listUrl,
      'search_url': searchUrl,
      'filter': filter?.map((x) => x.toMap()).toList(),
      'columns': columns.map((x) => x.toMap()).toList(),
    };
  }

  factory SearchLayout.fromMap(Map<String, dynamic> map) {
    return SearchLayout(
      listUrl: map['list_url'] as String,
      searchUrl: map['search_url'] as String,
      filter: map['filter'] != null
          ? List<FilterLayout>.from(
              (map['filter']).map<FilterLayout?>(
                (x) => FilterLayout.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      columns: List<SearchColumn>.from(
        (map['columns']).map<SearchColumn>(
          (x) => SearchColumn.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchLayout.fromJson(String source) => SearchLayout.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SearchLayout(listUrl: $listUrl, searchUrl: $searchUrl, filter: $filter, columns: $columns)';
  }

  @override
  bool operator ==(covariant SearchLayout other) {
    if (identical(this, other)) return true;

    return other.listUrl == listUrl && other.searchUrl == searchUrl && listEquals(other.filter, filter) && listEquals(other.columns, columns);
  }

  @override
  int get hashCode {
    return listUrl.hashCode ^ searchUrl.hashCode ^ filter.hashCode ^ columns.hashCode;
  }
}
