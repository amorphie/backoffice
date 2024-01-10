// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../entity/layout_helpers/title_model.dart';
import 'dashboard_data_model.dart';
import 'dashboard_type.dart';

part 'dashboard_item_model.g.dart';

@JsonSerializable()
class DashboardItemModel extends Equatable {
  DashboardType type;
  @JsonKey(required: false)
  String? entity;
  @JsonKey(required: false, name: 'data-url')
  String? dataUrl;
  @JsonKey(required: false)
  DashboardDataModel? data;
  @JsonKey(required: false)
  TitleModel? title;
  @JsonKey(required: false)
  List<DashboardItemModel>? items;
  @JsonKey(defaultValue: 5, required: false)
  int count;

  DashboardItemModel({required this.type, this.entity, this.dataUrl, this.data, this.title, this.items, this.count = 5});

  factory DashboardItemModel.fromJson(Map<String, dynamic> json) => _$DashboardItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$DashboardItemModelToJson(this);

  @override
  List<Object?> get props => [type, entity, dataUrl, data, title, items, count];

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
