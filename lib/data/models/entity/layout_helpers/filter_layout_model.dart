// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:admin/data/models/entity/enums/filter_type.dart';
import 'package:admin/data/models/entity/enums/filter_widget.dart';
import 'package:admin/data/models/entity/layout_helpers/title_model.dart';

class FilterLayout {
  String data;
  FilterType type;
  FilterWidget widget;
  TitleModel title;
  FilterLayout({
    required this.data,
    required this.type,
    required this.widget,
    required this.title,
  });

  FilterLayout copyWith({
    String? data,
    FilterType? type,
    FilterWidget? widget,
    TitleModel? title,
  }) {
    return FilterLayout(
      data: data ?? this.data,
      type: type ?? this.type,
      widget: widget ?? this.widget,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
      'type': type.toMap(),
      'widget': widget.toMap(),
      'title': title.toMap(),
    };
  }

  factory FilterLayout.fromMap(Map<String, dynamic> map) {
    return FilterLayout(
      data: map['data'] as String,
      type: FilterType.fromMap(map['type']),
      widget: FilterWidget.fromMap(map['widget']),
      title: TitleModel.fromMap(map['title'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory FilterLayout.fromJson(String source) => FilterLayout.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FilterLayout(data: $data, type: $type, widget: $widget, title: $title)';
  }

  @override
  bool operator ==(covariant FilterLayout other) {
    if (identical(this, other)) return true;

    return other.data == data && other.type == type && other.widget == widget && other.title == title;
  }

  @override
  int get hashCode {
    return data.hashCode ^ type.hashCode ^ widget.hashCode ^ title.hashCode;
  }
}
