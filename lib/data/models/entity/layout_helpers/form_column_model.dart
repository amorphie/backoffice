// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'title_model.dart';

class FormColumns {
  String field;
  String type;
  TitleModel title;
  int sort;
  int layout;
  String? data;
  String? display;
  FormColumns({
    required this.field,
    required this.type,
    required this.title,
    required this.sort,
    required this.layout,
    this.data,
    this.display,
  });

  FormColumns copyWith({
    String? field,
    String? type,
    TitleModel? title,
    int? sort,
    int? layout,
    String? data,
    String? display,
  }) {
    return FormColumns(
      field: field ?? this.field,
      type: type ?? this.type,
      title: title ?? this.title,
      sort: sort ?? this.sort,
      layout: layout ?? this.layout,
      data: data ?? this.data,
      display: display ?? this.display,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'field': field,
      'type': type,
      'title': title.toMap(),
      'sort': sort,
      'layout': layout,
      'data': data,
      'display': display,
    };
  }

  factory FormColumns.fromMap(Map<String, dynamic> map) {
    return FormColumns(
      field: map['field'] as String,
      type: map['type'] as String,
      title: TitleModel.fromMap(map['title'] as Map<String, dynamic>),
      sort: map['sort'] ?? 1,
      layout: map['layout'] ?? 1,
      data: map['data'] != null ? map['data'] as String : null,
      display: map['display'] != null ? map['display'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FormColumns.fromJson(String source) => FormColumns.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FormColumns(field: $field, type: $type, title: $title, sort: $sort, layout: $layout, data: $data, display: $display)';
  }

  @override
  bool operator ==(covariant FormColumns other) {
    if (identical(this, other)) return true;

    return other.field == field && other.type == type && other.title == title && other.sort == sort && other.layout == layout && other.data == data && other.display == display;
  }

  @override
  int get hashCode {
    return field.hashCode ^ type.hashCode ^ title.hashCode ^ sort.hashCode ^ layout.hashCode ^ data.hashCode ^ display.hashCode;
  }
}
