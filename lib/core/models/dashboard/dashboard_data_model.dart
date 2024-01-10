// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'dashboard_chart_type.dart';
import 'dashboard_counter_list_item_model.dart';

part 'dashboard_data_model.g.dart';

@JsonSerializable()
class DashboardDataModel extends Equatable {
  String url;
  ChartType? chartType;
  List<DashboardCounterListItemModel> list;

  factory DashboardDataModel.fromJson(Map<String, dynamic> json) => _$DashboardDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$DashboardDataModelToJson(this);
  @override
  List<Object?> get props => [url, chartType, list];

  DashboardDataModel({
    required this.url,
    this.chartType,
    required this.list,
  });
  DashboardDataModel copyWith({
    String? url,
    ChartType? chartType,
    List<DashboardCounterListItemModel>? list,
  }) {
    return DashboardDataModel(
      url: url ?? this.url,
      chartType: chartType ?? this.chartType,
      list: list ?? this.list,
    );
  }

  @override
  String toString() => 'DashboardDataModel(url: $url, type: $chartType, list: $list)';

  @override
  bool operator ==(covariant DashboardDataModel other) {
    if (identical(this, other)) return true;

    return other.url == url && other.chartType == chartType && listEquals(other.list, list);
  }

  @override
  int get hashCode => url.hashCode ^ chartType.hashCode ^ list.hashCode;
}
