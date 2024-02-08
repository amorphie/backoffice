// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'neo_bo_title_model.dart';

class NeoBoSearchColumn {
  String data;
  NeoBoTitleModel title;
  int sort;
  NeoBoSearchColumn({
    required this.data,
    required this.title,
    required this.sort,
  });

  NeoBoSearchColumn copyWith({
    String? data,
    NeoBoTitleModel? title,
    int? sort,
  }) {
    return NeoBoSearchColumn(
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

  factory NeoBoSearchColumn.fromMap(Map<String, dynamic> map) {
    return NeoBoSearchColumn(
      data: map['data'] as String,
      title: NeoBoTitleModel().fromMap(map['title'] as Map<String, dynamic>),
      sort: map['sort'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory NeoBoSearchColumn.fromJson(String source) => NeoBoSearchColumn.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SearchColumn(data: $data, title: $title, sort: $sort)';

  @override
  bool operator ==(covariant NeoBoSearchColumn other) {
    if (identical(this, other)) return true;

    return other.data == data && other.title == title && other.sort == sort;
  }

  @override
  int get hashCode => data.hashCode ^ title.hashCode ^ sort.hashCode;
}
