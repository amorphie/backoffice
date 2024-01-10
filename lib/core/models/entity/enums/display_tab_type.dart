import 'package:json_annotation/json_annotation.dart';

@JsonEnum(alwaysCreate: true)
enum DisplayTabType {
  none,
  render,
  search,
  formio,
  html,
  url,
  image,
  pdf,
  splitRow,
  splitColumn;

  bool get isNone => this == DisplayTabType.none;
  bool get isPdf => this == DisplayTabType.pdf;
  bool get isRender => this == DisplayTabType.render;
  bool get isHtml => this == DisplayTabType.html;
  bool get isSearch => this == DisplayTabType.search;
  bool get isFormio => this == DisplayTabType.formio;
  bool get isSplitRow => this == DisplayTabType.splitRow;
  bool get isSplitColumn => this == DisplayTabType.splitColumn;

  bool get isSplit => isSplitColumn || isSplitRow;
}
