// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:admin/data/models/entity/layout_helpers/tab_model.dart';
import 'package:admin/data/models/entity/layout_helpers/title_model.dart';

class DisplayLayoutModel {
  TitleModel? summaryTemplate;
  TitleModel? detailTemplate;
  bool? history;
  bool? stateManager;
  bool? runningWorkflows;
  bool? availableWorkflows;
  List<DisplayTabModel>? tabs;
  DisplayLayoutModel({
    this.summaryTemplate,
    this.detailTemplate,
    this.history,
    this.stateManager,
    this.runningWorkflows,
    this.availableWorkflows,
    this.tabs,
  });

  DisplayLayoutModel copyWith({
    TitleModel? summaryTemplate,
    TitleModel? detailTemplate,
    bool? history,
    bool? stateManager,
    bool? runningWorkflows,
    bool? availableWorkflows,
    List<DisplayTabModel>? tabs,
  }) {
    return DisplayLayoutModel(
      summaryTemplate: summaryTemplate ?? this.summaryTemplate,
      detailTemplate: detailTemplate ?? this.detailTemplate,
      history: history ?? this.history,
      stateManager: stateManager ?? this.stateManager,
      runningWorkflows: runningWorkflows ?? this.runningWorkflows,
      availableWorkflows: availableWorkflows ?? this.availableWorkflows,
      tabs: tabs ?? this.tabs,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'summaryTemplate': summaryTemplate?.toMap(),
      'detailTemplate': detailTemplate?.toMap(),
      'history': history,
      'stateManager': stateManager,
      'runningWorkflows': runningWorkflows,
      'availableWorkflows': availableWorkflows,
      'tabs': tabs?.map((x) => x.toMap()).toList(),
    };
  }

  factory DisplayLayoutModel.fromMap(Map<String, dynamic> map) {
    return DisplayLayoutModel(
      summaryTemplate: map['summaryTemplate'] != null ? TitleModel.fromMap(map['summaryTemplate'] as Map<String, dynamic>) : null,
      detailTemplate: map['detailTemplate'] != null ? TitleModel.fromMap(map['detailTemplate'] as Map<String, dynamic>) : null,
      history: map['history'] != null ? map['history'] as bool : null,
      stateManager: map['stateManager'] != null ? map['stateManager'] as bool : null,
      runningWorkflows: map['runningWorkflows'] != null ? map['runningWorkflows'] as bool : null,
      availableWorkflows: map['availableWorkflows'] != null ? map['availableWorkflows'] as bool : null,
      tabs: map['tabs'] != null
          ? List<DisplayTabModel>.from(
              (map['tabs']).map<DisplayTabModel?>(
                (x) => DisplayTabModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DisplayLayoutModel.fromJson(String source) => DisplayLayoutModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DisplayLayoutModel( summaryTemplate: $summaryTemplate, detailTemplate: $detailTemplate, history: $history, stateManager: $stateManager, runningWorkflows: $runningWorkflows, availableWorkflows: $availableWorkflows, tabs: $tabs)';
  }

  @override
  bool operator ==(covariant DisplayLayoutModel other) {
    if (identical(this, other)) return true;

    return other.summaryTemplate == summaryTemplate &&
        other.detailTemplate == detailTemplate &&
        other.history == history &&
        other.stateManager == stateManager &&
        other.runningWorkflows == runningWorkflows &&
        other.availableWorkflows == availableWorkflows &&
        listEquals(other.tabs, tabs);
  }

  @override
  int get hashCode {
    return summaryTemplate.hashCode ^
        detailTemplate.hashCode ^
        history.hashCode ^
        stateManager.hashCode ^
        runningWorkflows.hashCode ^
        availableWorkflows.hashCode ^
        tabs.hashCode;
  }
}
