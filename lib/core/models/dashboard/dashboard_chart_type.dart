import 'package:json_annotation/json_annotation.dart';

@JsonEnum(alwaysCreate: true)
enum ChartType {
  pie,
  line,
  bar;
}
