import 'package:json_annotation/json_annotation.dart';

@JsonEnum(alwaysCreate: true)
enum SortDirection {
  asc,
  desc;
}
