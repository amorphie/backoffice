// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:admin/data/models/dashboard/dashboard_chart_type.dart';
import 'package:flutter/foundation.dart';

import 'package:admin/data/models/dashboard/dashboard_counter_list_item_model.dart';

class DashboardDataModel {
  String url;
  ChartType? chartType;
  List<DashboardCounterListItemModel> list;

  DashboardDataModel({
    required this.url,
    this.chartType,
    required this.list,
  });
  DashboardDataModel copyWith({
    String? url,
    ChartType? type,
    List<DashboardCounterListItemModel>? list,
  }) {
    return DashboardDataModel(
      url: url ?? this.url,
      chartType: chartType ?? this.chartType,
      list: list ?? this.list,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'chartType': chartType?.toMap(),
      'list': list.map((x) => x.toMap()).toList(),
    };
  }

  factory DashboardDataModel.fromMap(Map<String, dynamic> map) {
    return DashboardDataModel(
      url: map['url'] as String,
      chartType: map['chartType'] != null ? ChartType.fromMap(map['chartType']) : null,
      list: List<DashboardCounterListItemModel>.from(
        (map['list']).map<DashboardCounterListItemModel>(
          (x) => DashboardCounterListItemModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory DashboardDataModel.fromJson(String source) => DashboardDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

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
