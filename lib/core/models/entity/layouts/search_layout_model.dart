// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../layout_helpers/filter_layout_model.dart';
import '../layout_helpers/search_column_model.dart';
import '../layout_helpers/sort/sort_layout_model.dart';

part 'search_layout_model.g.dart';

@JsonSerializable()
class SearchLayout extends Equatable {
  int defaultPageSize;
  int defaultPageNumber;
  bool search;
  List<FilterLayout>? filter;
  List<SearchColumn> columns;
  String? subDataField;
  bool? endpointSuffix;
  String url;
  String titleTemplate;
  SortLayoutModel? sort;

  SearchLayout({
    this.defaultPageSize = 100,
    this.defaultPageNumber = 0,
    this.search = false,
    this.filter,
    this.sort,
    required this.columns,
    this.subDataField,
    this.endpointSuffix,
    required this.url,
    required this.titleTemplate,
  });

  factory SearchLayout.fromJson(Map<String, dynamic> json) => _$SearchLayoutFromJson(json);
  Map<String, dynamic> toJson() => _$SearchLayoutToJson(this);
  @override
  List<Object?> get props => [defaultPageSize, defaultPageNumber, search, filter, columns, subDataField, endpointSuffix, url, sort, titleTemplate];

  factory SearchLayout.init() => SearchLayout(columns: const [], url: "", titleTemplate: "");

  SearchLayout copyWith({
    int? defaultPageSize,
    int? defaultPageNumber,
    bool? search,
    List<FilterLayout>? filter,
    List<SearchColumn>? columns,
    String? subDataField,
    bool? endpointSuffix,
    String? url,
    String? titleTemplate,
    SortLayoutModel? sort,
  }) {
    return SearchLayout(
      defaultPageSize: defaultPageSize ?? this.defaultPageSize,
      defaultPageNumber: defaultPageNumber ?? this.defaultPageNumber,
      search: search ?? this.search,
      filter: filter ?? this.filter,
      columns: columns ?? this.columns,
      subDataField: subDataField ?? this.subDataField,
      endpointSuffix: endpointSuffix ?? this.endpointSuffix,
      url: url ?? this.url,
      titleTemplate: titleTemplate ?? this.titleTemplate,
      sort: sort ?? this.sort,
    );
  }

  @override
  String toString() {
    return 'SearchLayout(defaultPageSize: $defaultPageSize, defaultPageNumber: $defaultPageNumber, search: $search, filter: $filter, columns: $columns, subDataField: $subDataField, endpointSuffix: $endpointSuffix, url: $url, titleTemplate: $titleTemplate)';
  }

  @override
  bool operator ==(covariant SearchLayout other) {
    if (identical(this, other)) return true;

    return other.defaultPageSize == defaultPageSize &&
        other.defaultPageNumber == defaultPageNumber &&
        other.search == search &&
        listEquals(other.filter, filter) &&
        listEquals(other.columns, columns) &&
        other.subDataField == subDataField &&
        other.endpointSuffix == endpointSuffix &&
        other.url == url &&
        other.sort == sort &&
        other.titleTemplate == titleTemplate;
  }

  @override
  int get hashCode {
    return defaultPageSize.hashCode ^
        defaultPageNumber.hashCode ^
        search.hashCode ^
        filter.hashCode ^
        columns.hashCode ^
        subDataField.hashCode ^
        endpointSuffix.hashCode ^
        url.hashCode ^
        sort.hashCode ^
        titleTemplate.hashCode;
  }
}
