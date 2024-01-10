// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'dashboard_item_model.dart';

part 'dashboard_model.g.dart';

@JsonSerializable()
class DashboardModel extends Equatable {
  List<DashboardItemModel> items;
  DashboardModel({
    required this.items,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) => _$DashboardModelFromJson(json);
  Map<String, dynamic> toJson() => _$DashboardModelToJson(this);
  @override
  List<Object?> get props => [items];

  DashboardModel copyWith({
    List<DashboardItemModel>? items,
  }) {
    return DashboardModel(
      items: items ?? this.items,
    );
  }

  @override
  String toString() => 'DashboardModel(items: $items)';

  @override
  bool operator ==(covariant DashboardModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.items, items);
  }

  @override
  int get hashCode => items.hashCode;
}
