import 'package:json_annotation/json_annotation.dart';

@JsonEnum(alwaysCreate: true)
enum DashboardType {
  counters,
  chart,
  tab,
  list;
}
