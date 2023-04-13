// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'title_model.dart';

class DisplayTabModel {
  String type;
  String entity;
  int order;
  String id;
  TitleModel? template;
  TitleModel title;
  String? layout;
  String? filter;
  String? filter_value;
  DisplayTabModel({
    required this.type,
    required this.entity,
    required this.order,
    required this.id,
    this.template,
    required this.title,
    this.layout,
    this.filter,
    this.filter_value,
  });

  DisplayTabModel copyWith({
    String? type,
    String? entity,
    int? order,
    String? id,
    TitleModel? template,
    TitleModel? title,
    String? layout,
    String? filter,
    String? filter_value,
  }) {
    return DisplayTabModel(
      type: type ?? this.type,
      entity: entity ?? this.entity,
      order: order ?? this.order,
      id: id ?? this.id,
      template: template ?? this.template,
      title: title ?? this.title,
      layout: layout ?? this.layout,
      filter: filter ?? this.filter,
      filter_value: filter_value ?? this.filter_value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'entity': entity,
      'order': order,
      'id': id,
      'template': template?.toMap(),
      'title': title.toMap(),
      'layout': layout,
      'filter': filter,
      'filter_value': filter_value,
    };
  }

  factory DisplayTabModel.fromMap(Map<String, dynamic> map) {
    return DisplayTabModel(
      type: map['type'] as String,
      entity: map['entity'] as String,
      order: map['order'] as int,
      id: map['id'] ?? "",
      template: map['template'] != null
          ? TitleModel.fromMap(map['template'] as Map<String, dynamic>)
          : null,
      title: TitleModel.fromMap(map['title'] as Map<String, dynamic>),
      layout: map['layout'] != null ? map['layout'] as String : null,
      filter: map['filter'] != null ? map['filter'] as String : null,
      filter_value:
          map['filter-value'] != null ? map['filter-value'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DisplayTabModel.fromJson(String source) =>
      DisplayTabModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DisplayTabModel(type: $type, entity: $entity, order: $order, id: $id, template: $template, title: $title, layout: $layout, filter: $filter, filter_value: $filter_value)';
  }

  @override
  bool operator ==(covariant DisplayTabModel other) {
    if (identical(this, other)) return true;

    return other.type == type &&
        other.entity == entity &&
        other.order == order &&
        other.id == id &&
        other.template == template &&
        other.title == title &&
        other.layout == layout &&
        other.filter == filter &&
        other.filter_value == filter_value;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        entity.hashCode ^
        order.hashCode ^
        id.hashCode ^
        template.hashCode ^
        title.hashCode ^
        layout.hashCode ^
        filter.hashCode ^
        filter_value.hashCode;
  }
}
