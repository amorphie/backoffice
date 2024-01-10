import 'package:json_annotation/json_annotation.dart';

@JsonEnum(alwaysCreate: true)
enum UISearchLayout {
  full,
  none;
}
