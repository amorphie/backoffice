// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:admin/data/models/entity/enums/display_tab_type.dart';

import 'title_model.dart';

class DisplayTabModel {
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
  String? filter_value;
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
    this.filter_value,
    this.items,
  });

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
    String? filter_value,
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
      filter_value: filter_value ?? this.filter_value,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type.toMap(),
      'entity': entity,
      'order': order,
      'id': id,
      'url': url,
      'template': template?.toMap(),
      'title': title.toMap(),
      'source': source,
      'data': data,
      'layout': layout,
      'filter': filter,
      'filter_value': filter_value,
      'items': items?.map((x) => x.toMap()).toList(),
    };
  }

  factory DisplayTabModel.fromMap(Map<String, dynamic> map) {
    return DisplayTabModel(
      type: DisplayTabType.fromMap(map['type']),
      entity: map['entity'] != null ? map['entity'] as String : null,
      order: map['order'] as int,
      id: map['id'] != null ? map['id'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      template: map['template'] != null ? TitleModel.fromMap(map['template'] as Map<String, dynamic>) : null,
      title: TitleModel.fromMap(map['title'] as Map<String, dynamic>),
      source: map['source'] != null ? map['source'] as String : null,
      data: map['data'] != null ? map['data'] as String : null,
      layout: map['layout'] != null ? map['layout'] as String : null,
      filter: map['filter'] != null ? map['filter'] as String : null,
      filter_value: map['filter_value'] != null ? map['filter_value'] as String : null,
      items: map['items'] != null
          ? List<DisplayTabModel>.from(
              (map['items']).map<DisplayTabModel?>(
                (x) => DisplayTabModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DisplayTabModel.fromJson(String source) => DisplayTabModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DisplayTabModel(type: $type, entity: $entity, order: $order, id: $id, url: $url, template: $template, title: $title, layout: $layout, filter: $filter, filter_value: $filter_value, items: $items)';
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
        other.filter_value == filter_value &&
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
        filter_value.hashCode ^
        items.hashCode;
  }
}
