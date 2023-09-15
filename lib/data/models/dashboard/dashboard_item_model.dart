// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:admin/data/models/entity/layout_helpers/title_model.dart';

import 'dashboard_data_model.dart';
import 'dashboard_type.dart';

class DashboardItemModel {
  DashboardType type;
  String? entity;
  String? dataUrl;
  DashboardDataModel? data;
  TitleModel? title;
  List<DashboardItemModel>? items;
  int count;
  DashboardItemModel({required this.type, this.entity, this.dataUrl, this.data, this.title, this.items, this.count = 5});

  DashboardItemModel copyWith({
    DashboardType? type,
    String? entity,
    String? dataUrl,
    DashboardDataModel? data,
    TitleModel? title,
    List<DashboardItemModel>? items,
    int? count,
  }) {
    return DashboardItemModel(
      type: type ?? this.type,
      entity: entity ?? this.entity,
      dataUrl: dataUrl ?? this.dataUrl,
      data: data ?? this.data,
      title: title ?? this.title,
      items: items ?? this.items,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type.toMap(),
      'entity': entity,
      'data-url"': dataUrl,
      'data': data?.toMap(),
      'title': title?.toMap(),
      'items': items?.map((x) => x.toMap()).toList(),
      'count': count
    };
  }

  factory DashboardItemModel.fromMap(Map<String, dynamic> map) {
    return DashboardItemModel(
      type: DashboardType.fromMap(map['type']),
      entity: map['entity'] != null ? map['entity'] as String : null,
      dataUrl: map['data-url'] != null ? map['data-url'] as String : null,
      data: map['data'] != null ? DashboardDataModel.fromMap(map['data'] as Map<String, dynamic>) : null,
      title: map['title'] != null ? TitleModel.fromMap(map['title'] as Map<String, dynamic>) : null,
      items: map['items'] != null
          ? List<DashboardItemModel>.from(
              (map['items']).map<DashboardItemModel?>(
                (x) => DashboardItemModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      count: map['count'] != null ? map['count'] as int : 5,
    );
  }

  String toJson() => json.encode(toMap());

  factory DashboardItemModel.fromJson(String source) => DashboardItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DashboardItemModel(type: $type, entity: $entity, dataUrl: $dataUrl, data: $data, title: $title, items: $items)';
  }

  @override
  bool operator ==(covariant DashboardItemModel other) {
    if (identical(this, other)) return true;

    return other.type == type && other.entity == entity && other.dataUrl == dataUrl && other.data == data && other.title == title && listEquals(other.items, items);
  }

  @override
  int get hashCode {
    return type.hashCode ^ entity.hashCode ^ dataUrl.hashCode ^ data.hashCode ^ title.hashCode ^ items.hashCode;
  }
}
