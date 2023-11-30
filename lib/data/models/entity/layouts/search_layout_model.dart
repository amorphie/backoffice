// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../helpers/exporter.dart';

class SearchLayout {
  int defaultPageSize;
  int defaultPageNumber;

  bool search;
  List<FilterLayout>? filter;
  List<SearchColumn> columns;
  String? subDataField;
  bool? endpointSuffix;
  SearchLayout({
    required this.search,
    this.filter,
    this.subDataField,
    this.endpointSuffix,
    this.defaultPageSize = 100,
    this.defaultPageNumber = 0,
    required this.columns,
  });

  SearchLayout copyWith({
    int? defaultPageSize,
    int? defaultPageNumber,
    bool? search,
    String? subDataField,
    bool? endpointSuffix,
    List<FilterLayout>? filter,
    List<SearchColumn>? columns,
  }) {
    return SearchLayout(
      defaultPageSize: defaultPageSize ?? this.defaultPageSize,
      defaultPageNumber: defaultPageNumber ?? this.defaultPageNumber,
      search: search ?? this.search,
      filter: filter ?? this.filter,
      columns: columns ?? this.columns,
      subDataField: subDataField ?? this.subDataField,
      endpointSuffix: endpointSuffix ?? this.endpointSuffix,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'defaultPageSize': defaultPageSize,
      'defaultPageNumber': defaultPageNumber,
      'search': search,
      'subDataField': subDataField,
      'endpointSuffix': endpointSuffix,
      'filter': filter?.map((x) => x.toMap()).toList(),
      'columns': columns.map((x) => x.toMap()).toList(),
    };
  }

  factory SearchLayout.fromMap(Map<String, dynamic> map) {
    return SearchLayout(
      defaultPageSize: map["defaultPageSize"] != null ? map["defaultPageSize"] : null,
      defaultPageNumber: map["defaultPageNumber"] != null ? map["defaultPageNumber"] : null,
      search: map['search'] as bool,
      subDataField: map['subDataField'] != null ? map['subDataField'] as String : null,
      endpointSuffix: map['endpointSuffix'] != null ? map['endpointSuffix'] as bool : null,
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
    return 'SearchLayout(defaultPageSize: $defaultPageSize, defaultPageNumber: $defaultPageNumber, search: $search, filter: $filter, columns: $columns, subDataField: $subDataField, endpointSuffix: $endpointSuffix)';
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
        other.endpointSuffix == endpointSuffix;
  }

  @override
  int get hashCode {
    return defaultPageSize.hashCode ^ defaultPageNumber.hashCode ^ search.hashCode ^ filter.hashCode ^ columns.hashCode ^ subDataField.hashCode ^ endpointSuffix.hashCode;
  }
}
