// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../enums/filter_type.dart';
import '../enums/filter_widget.dart';
import 'title_model.dart';

part 'filter_layout_model.g.dart';

@JsonSerializable()
class FilterLayout extends Equatable {
  String? data;
  String entity;
  String query;
  FilterType type;
  FilterWidget widget;
  TitleModel title;
  FilterLayout({
    this.data,
    required this.entity,
    required this.query,
    required this.type,
    required this.widget,
    required this.title,
  });

  factory FilterLayout.fromJson(Map<String, dynamic> json) => _$FilterLayoutFromJson(json);
  Map<String, dynamic> toJson() => _$FilterLayoutToJson(this);
  @override
  List<Object?> get props => [data, entity, query, type, widget, title];

  FilterLayout copyWith({
    String? data,
    String? entity,
    String? query,
    FilterType? type,
    FilterWidget? widget,
    TitleModel? title,
  }) {
    return FilterLayout(
      data: data ?? this.data,
      entity: entity ?? this.entity,
      query: query ?? this.query,
      type: type ?? this.type,
      widget: widget ?? this.widget,
      title: title ?? this.title,
    );
  }

  @override
  String toString() {
    return 'FilterLayout(data: $data, entity: $entity, type: $type, widget: $widget, title: $title)';
  }

  @override
  bool operator ==(covariant FilterLayout other) {
    if (identical(this, other)) return true;

    return other.data == data && other.entity == entity && other.type == type && other.widget == widget && other.title == title;
  }

  @override
  int get hashCode {
    return data.hashCode ^ entity.hashCode ^ type.hashCode ^ widget.hashCode ^ title.hashCode;
  }
}
