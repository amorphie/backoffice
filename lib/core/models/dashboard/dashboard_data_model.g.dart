// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardDataModel _$DashboardDataModelFromJson(Map<String, dynamic> json) =>
    DashboardDataModel(
      url: json['url'] as String,
      chartType: $enumDecodeNullable(_$ChartTypeEnumMap, json['chartType']),
      list: (json['list'] as List<dynamic>)
          .map((e) =>
              DashboardCounterListItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DashboardDataModelToJson(DashboardDataModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'chartType': _$ChartTypeEnumMap[instance.chartType],
      'list': instance.list,
    };

const _$ChartTypeEnumMap = {
  ChartType.pie: 'pie',
  ChartType.line: 'line',
  ChartType.bar: 'bar',
};
