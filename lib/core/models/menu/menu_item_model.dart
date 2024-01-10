// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../entity/layout_helpers/title_model.dart';
import 'enums/menu_item_type.dart';
import 'enums/ui_display_layout.dart';
import 'enums/ui_search_layout.dart';

part 'menu_item_model.g.dart';

@JsonSerializable()
class MenuItemModel extends Equatable {
  MenuItemType type;
  TitleModel? title;
  List<MenuItemModel>? items;
  String? entity;
  @JsonKey(name: 'search-layout')
  UISearchLayout searchLayout;
  @JsonKey(name: 'display-layout')
  UIDisplayLayout displayLayout;
  Map<String, dynamic>? query;
  MenuItemModel({
    required this.type,
    this.title,
    this.items,
    this.entity,
    this.searchLayout = UISearchLayout.none,
    this.displayLayout = UIDisplayLayout.none,
    this.query,
  });
  factory MenuItemModel.fromJson(Map<String, dynamic> json) => _$MenuItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$MenuItemModelToJson(this);
  @override
  List<Object?> get props => [type, title, items, entity, searchLayout, displayLayout, query];

  MenuItemModel copyWith(
      {MenuItemType? type, TitleModel? title, List<MenuItemModel>? items, String? entity, UISearchLayout? searchLayout, UIDisplayLayout? displayLayout, Map<String, dynamic>? query}) {
    return MenuItemModel(
      type: type ?? this.type,
      title: title ?? this.title,
      items: items ?? this.items,
      entity: entity ?? this.entity,
      searchLayout: searchLayout ?? this.searchLayout,
      displayLayout: displayLayout ?? this.displayLayout,
      query: query ?? this.query,
    );
  }

  @override
  String toString() {
    return 'MenuItemModel(type: $type, title: $title, items: $items, entity: $entity, searchLayout: $searchLayout, displayLayout: $displayLayout, query: $query)';
  }

  @override
  bool operator ==(covariant MenuItemModel other) {
    if (identical(this, other)) return true;

    return other.type == type &&
        other.title == title &&
        listEquals(other.items, items) &&
        other.entity == entity &&
        other.searchLayout == searchLayout &&
        other.displayLayout == displayLayout &&
        other.query == query;
  }

  @override
  int get hashCode {
    return type.hashCode ^ title.hashCode ^ items.hashCode ^ entity.hashCode ^ searchLayout.hashCode ^ displayLayout.hashCode ^ query.hashCode;
  }
}
