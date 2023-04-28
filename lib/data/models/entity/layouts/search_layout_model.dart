// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../layout_helpers/filter_layout_model.dart';
import '../layout_helpers/search_column_model.dart';

class SearchLayout {
  String listUrl;
  String searchQuery;
  int defaultPageSize;
  int defaultPageNumber;

  bool search;
  List<FilterLayout>? filter;
  List<SearchColumn> columns;
  SearchLayout({
    required this.listUrl,
    required this.search,
    this.filter,
    this.searchQuery = "searchText",
    this.defaultPageSize = 100,
    this.defaultPageNumber = 0,
    required this.columns,
  });

  SearchLayout copyWith({
    String? listUrl,
    String? searchQuery,
    int? defaultPageSize,
    int? defaultPageNumber,
    bool? search,
    List<FilterLayout>? filter,
    List<SearchColumn>? columns,
  }) {
    return SearchLayout(
      listUrl: listUrl ?? this.listUrl,
      searchQuery: searchQuery ?? this.searchQuery,
      defaultPageSize: defaultPageSize ?? this.defaultPageSize,
      defaultPageNumber: defaultPageNumber ?? this.defaultPageNumber,
      search: search ?? this.search,
      filter: filter ?? this.filter,
      columns: columns ?? this.columns,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'list_url': listUrl,
      'search_query': searchQuery,
      'default_page_size': defaultPageSize,
      'default_page_number': defaultPageNumber,
      'search': search,
      'filter': filter?.map((x) => x.toMap()).toList(),
      'columns': columns.map((x) => x.toMap()).toList(),
    };
  }

  factory SearchLayout.fromMap(Map<String, dynamic> map) {
    return SearchLayout(
      listUrl: map['list_url'] as String,
      searchQuery: map["search_query"] != null ? map["search_query"] : null,
      defaultPageSize: map["default_page_size"] != null ? map["default_page_size"] : null,
      defaultPageNumber: map["default_page_number"] != null ? map["default_page_number"] : null,
      search: map['search'] as bool,
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
    return 'SearchLayout(listUrl: $listUrl, searchQuery: $searchQuery, defaultPageSize: $defaultPageSize, defaultPageNumber: $defaultPageNumber, search: $search, filter: $filter, columns: $columns)';
  }

  @override
  bool operator ==(covariant SearchLayout other) {
    if (identical(this, other)) return true;

    return other.listUrl == listUrl &&
        other.searchQuery == searchQuery &&
        other.defaultPageSize == defaultPageSize &&
        other.defaultPageNumber == defaultPageNumber &&
        other.search == search &&
        listEquals(other.filter, filter) &&
        listEquals(other.columns, columns);
  }

  @override
  int get hashCode {
    return listUrl.hashCode ^ searchQuery.hashCode ^ defaultPageSize.hashCode ^ defaultPageNumber.hashCode ^ search.hashCode ^ filter.hashCode ^ columns.hashCode;
  }
}
