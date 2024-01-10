// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../enums/display_tab_type.dart';
import 'title_model.dart';

part 'display_tab_model.g.dart';

@JsonSerializable()
class DisplayTabModel extends Equatable {
  DisplayTabType type;
  String? entity;
  int order;
  String? id;
  String? url;
  TitleModel? template;
  TitleModel title;
  String? source;
  String? data;
  String? layout;
  String? filter;
  @JsonKey(name: 'filter-value')
  String? filterValue;
  List<DisplayTabModel>? items;

  DisplayTabModel({
    required this.type,
    this.entity,
    required this.order,
    this.id,
    this.url,
    this.template,
    required this.title,
    this.source,
    this.data,
    this.layout,
    this.filter,
    this.filterValue,
    this.items,
  });

  factory DisplayTabModel.fromJson(Map<String, dynamic> json) => _$DisplayTabModelFromJson(json);
  Map<String, dynamic> toJson() => _$DisplayTabModelToJson(this);
  @override
  List<Object?> get props {
    return [
      type,
      entity,
      order,
      id,
      url,
      template,
      title,
      source,
      data,
      layout,
      filter,
      filterValue,
      items,
    ];
  }

  DisplayTabModel copyWith({
    DisplayTabType? type,
    String? entity,
    int? order,
    String? id,
    String? url,
    TitleModel? template,
    TitleModel? title,
    String? source,
    String? data,
    String? layout,
    String? filter,
    String? filterValue,
    List<DisplayTabModel>? items,
  }) {
    return DisplayTabModel(
      type: type ?? this.type,
      entity: entity ?? this.entity,
      order: order ?? this.order,
      id: id ?? this.id,
      url: url ?? this.url,
      template: template ?? this.template,
      title: title ?? this.title,
      source: source ?? this.source,
      data: data ?? this.data,
      layout: layout ?? this.layout,
      filter: filter ?? this.filter,
      filterValue: filterValue ?? this.filterValue,
      items: items ?? this.items,
    );
  }

  @override
  String toString() {
    return 'DisplayTabModel(type: $type, entity: $entity, order: $order, id: $id, url: $url, template: $template, title: $title, layout: $layout, filter: $filter, filter_value: $filterValue, items: $items)';
  }

  @override
  bool operator ==(covariant DisplayTabModel other) {
    if (identical(this, other)) return true;

    return other.type == type &&
        other.entity == entity &&
        other.order == order &&
        other.id == id &&
        other.url == url &&
        other.template == template &&
        other.title == title &&
        other.source == source &&
        other.data == data &&
        other.layout == layout &&
        other.filter == filter &&
        other.filterValue == filterValue &&
        listEquals(other.items, items);
  }

  @override
  int get hashCode {
    return type.hashCode ^
        entity.hashCode ^
        order.hashCode ^
        id.hashCode ^
        url.hashCode ^
        template.hashCode ^
        title.hashCode ^
        layout.hashCode ^
        filter.hashCode ^
        filterValue.hashCode ^
        items.hashCode;
  }
}
