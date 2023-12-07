import '../../../../ui/helpers/exporter.dart';
import '../layout_helpers/sort/sort_layout_model.dart';

class SearchLayout {
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

  factory SearchLayout.init() => SearchLayout(columns: [], url: "", titleTemplate: "");

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'defaultPageSize': defaultPageSize,
      'defaultPageNumber': defaultPageNumber,
      'search': search,
      'filter': filter?.map((x) => x.toMap()).toList(),
      'columns': columns.map((x) => x.toMap()).toList(),
      'subDataField': subDataField,
      'endpointSuffix': endpointSuffix,
      'url': url,
      'titleTemplate': titleTemplate,
      'sort': sort?.toMap(),
    };
  }

  factory SearchLayout.fromMap(Map<String, dynamic> map) {
    return SearchLayout(
      defaultPageSize: map['defaultPageSize'] != null ? map['defaultPageSize'] as int : 100,
      defaultPageNumber: map['defaultPageNumber'] != null ? map['defaultPageNumber'] as int : 0,
      search: map['search'] != null ? map['search'] as bool : false,
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
      subDataField: map['subDataField'] != null ? map['subDataField'] as String : null,
      endpointSuffix: map['endpointSuffix'] != null ? map['endpointSuffix'] as bool : null,
      sort: map['sort'] != null ? SortLayoutModel.fromMap(map['sort']) : null,
      url: map['url'] as String,
      titleTemplate: map['titleTemplate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchLayout.fromJson(String source) => SearchLayout.fromMap(json.decode(source) as Map<String, dynamic>);

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
