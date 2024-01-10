// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../layout_helpers/display_tab_model.dart';
import '../layout_helpers/title_model.dart';

part 'display_layout_model.g.dart';

@JsonSerializable()
class DisplayLayoutModel extends Equatable {
  TitleModel? summaryTemplate;
  TitleModel? detailTemplate;
  List<DisplayTabModel>? tabs;
  DisplayLayoutModel({
    this.summaryTemplate,
    this.detailTemplate,
    this.tabs,
  });

  factory DisplayLayoutModel.fromJson(Map<String, dynamic> json) => _$DisplayLayoutModelFromJson(json);
  Map<String, dynamic> toJson() => _$DisplayLayoutModelToJson(this);
  @override
  List<Object?> get props => [summaryTemplate, detailTemplate, tabs];

  DisplayLayoutModel copyWith({
    TitleModel? summaryTemplate,
    TitleModel? detailTemplate,
    List<DisplayTabModel>? tabs,
  }) {
    return DisplayLayoutModel(
      summaryTemplate: summaryTemplate ?? this.summaryTemplate,
      detailTemplate: detailTemplate ?? this.detailTemplate,
      tabs: tabs ?? this.tabs,
    );
  }

  @override
  String toString() {
    return 'DisplayLayoutModel( summaryTemplate: $summaryTemplate, detailTemplate: $detailTemplate, tabs: $tabs)';
  }

  @override
  bool operator ==(covariant DisplayLayoutModel other) {
    if (identical(this, other)) return true;

    return other.summaryTemplate == summaryTemplate && other.detailTemplate == detailTemplate && listEquals(other.tabs, tabs);
  }

  @override
  int get hashCode {
    return summaryTemplate.hashCode ^ detailTemplate.hashCode ^ tabs.hashCode;
  }
}
