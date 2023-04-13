import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'enums/menu_item_type.dart';
import 'enums/ui_display_layout.dart';
import 'enums/ui_search_layout.dart';
import '../entity/layout_helpers/title_model.dart';

class MenuItemModel {
  MenuItemType type;
  TitleModel? title;
  List<MenuItemModel>? items;
  String? entity;
  UISearchLayout searchLayout;
  UIDisplayLayout displayLayout;
  MenuItemModel({
    required this.type,
    this.title,
    this.items,
    this.entity,
    this.searchLayout = UISearchLayout.none,
    this.displayLayout = UIDisplayLayout.none,
  });

  MenuItemModel copyWith({
    MenuItemType? type,
    TitleModel? title,
    List<MenuItemModel>? items,
    String? entity,
    UISearchLayout? searchLayout,
    UIDisplayLayout? displayLayout,
  }) {
    return MenuItemModel(
      type: type ?? this.type,
      title: title ?? this.title,
      items: items ?? this.items,
      entity: entity ?? this.entity,
      searchLayout: searchLayout ?? this.searchLayout,
      displayLayout: displayLayout ?? this.displayLayout,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type.toMap(),
      'title': title?.toMap(),
      'items': items?.map((x) => x.toMap()).toList(),
      'entity': entity,
      'search-layout': searchLayout.toMap(),
      'display-layout': displayLayout.toMap(),
    };
  }

  factory MenuItemModel.fromMap(Map<String, dynamic> map) {
    return MenuItemModel(
      type: MenuItemType.fromMap(map['type'] as String),
      title: map['title'] != null ? TitleModel.fromMap(map['title'] as Map<String, dynamic>) : null,
      items: map['items'] != null
          ? List<MenuItemModel>.from(
              (map['items']).map<MenuItemModel?>(
                (x) => MenuItemModel.fromMap(x),
              ),
            )
          : null,
      entity: map['entity'] != null ? map['entity'] as String : null,
      searchLayout: map['search-layout'] != null ? UISearchLayout.fromMap(map['search-layout']) : UISearchLayout.none,
      displayLayout: map['display-layout'] != null ? UIDisplayLayout.fromMap(map['display-layout']) : UIDisplayLayout.none,
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuItemModel.fromJson(String source) => MenuItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MenuItemModel(type: $type, title: $title, items: $items, entity: $entity, searchLayout: $searchLayout, displayLayout: $displayLayout)';
  }

  @override
  bool operator ==(covariant MenuItemModel other) {
    if (identical(this, other)) return true;

    return other.type == type &&
        other.title == title &&
        listEquals(other.items, items) &&
        other.entity == entity &&
        other.searchLayout == searchLayout &&
        other.displayLayout == displayLayout;
  }

  @override
  int get hashCode {
    return type.hashCode ^ title.hashCode ^ items.hashCode ^ entity.hashCode ^ searchLayout.hashCode ^ displayLayout.hashCode;
  }
}
