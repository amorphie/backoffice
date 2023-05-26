// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:admin/data/models/entity/enums/filter_type.dart';
import 'package:admin/data/models/entity/enums/filter_widget.dart';

class FilterLayout {
  String data;
  FilterType type;
  FilterWidget widget;
  FilterLayout({
    required this.data,
    required this.type,
    required this.widget,
  });

  FilterLayout copyWith({
    String? data,
    FilterType? type,
    FilterWidget? widget,
  }) {
    return FilterLayout(
      data: data ?? this.data,
      type: type ?? this.type,
      widget: widget ?? this.widget,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
      'type': type.toMap(),
      'widget': widget.toMap(),
    };
  }

  factory FilterLayout.fromMap(Map<String, dynamic> map) {
    return FilterLayout(
      data: map['data'] as String,
      type: FilterType.fromMap(map['type']),
      widget: FilterWidget.fromMap(map['widget']),
    );
  }

  String toJson() => json.encode(toMap());

  factory FilterLayout.fromJson(String source) => FilterLayout.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FilterLayout(data: $data, type: $type, widget: $widget)';

  @override
  bool operator ==(covariant FilterLayout other) {
    if (identical(this, other)) return true;

    return other.data == data && other.type == type && other.widget == widget;
  }

  @override
  int get hashCode => data.hashCode ^ type.hashCode ^ widget.hashCode;
}
