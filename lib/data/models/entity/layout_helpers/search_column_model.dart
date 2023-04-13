// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'title_model.dart';

class SearchColumn {
  String data;
  TitleModel title;
  int sort;
  SearchColumn({
    required this.data,
    required this.title,
    required this.sort,
  });

  SearchColumn copyWith({
    String? data,
    TitleModel? title,
    int? sort,
  }) {
    return SearchColumn(
      data: data ?? this.data,
      title: title ?? this.title,
      sort: sort ?? this.sort,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
      'title': title.toMap(),
      'sort': sort,
    };
  }

  factory SearchColumn.fromMap(Map<String, dynamic> map) {
    return SearchColumn(
      data: map['data'] as String,
      title: TitleModel.fromMap(map['title'] as Map<String, dynamic>),
      sort: map['sort'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchColumn.fromJson(String source) => SearchColumn.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SearchColumn(data: $data, title: $title, sort: $sort)';

  @override
  bool operator ==(covariant SearchColumn other) {
    if (identical(this, other)) return true;

    return other.data == data && other.title == title && other.sort == sort;
  }

  @override
  int get hashCode => data.hashCode ^ title.hashCode ^ sort.hashCode;
}
