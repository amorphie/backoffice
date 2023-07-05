// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'history_workflow_model.dart';

class HistoryDetailModel {
  HistoryWorkflowModel? stateManager;
  List<HistoryWorkflowModel>? runningWorkflows;
  List<HistoryWorkflowModel>? completedWorkflows;
  HistoryDetailModel({
    this.stateManager,
    this.runningWorkflows,
    this.completedWorkflows,
  });

  HistoryDetailModel copyWith({
    HistoryWorkflowModel? stateManager,
    List<HistoryWorkflowModel>? runningWorkflows,
    List<HistoryWorkflowModel>? completedWorkflows,
  }) {
    return HistoryDetailModel(
      stateManager: stateManager ?? this.stateManager,
      runningWorkflows: runningWorkflows ?? this.runningWorkflows,
      completedWorkflows: completedWorkflows ?? this.completedWorkflows,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'stateManager': stateManager?.toMap(),
      'runningWorkflows': runningWorkflows?.map((x) => x.toMap()).toList(),
      'completedWorkflows': completedWorkflows?.map((x) => x.toMap()).toList(),
    };
  }

  factory HistoryDetailModel.fromMap(Map<String, dynamic> map) {
    return HistoryDetailModel(
      stateManager: map['stateManager'] != null ? HistoryWorkflowModel.fromMap(map['stateManager'] as Map<String, dynamic>) : null,
      runningWorkflows: map['runningWorkflows'] != null
          ? List<HistoryWorkflowModel>.from(
              (map['runningWorkflows'] as List<dynamic>).map<HistoryWorkflowModel?>(
                (x) => HistoryWorkflowModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      completedWorkflows: map['completedWorkflows'] != null
          ? List<HistoryWorkflowModel>.from(
              (map['completedWorkflows'] as List<dynamic>).map<HistoryWorkflowModel?>(
                (x) => HistoryWorkflowModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryDetailModel.fromJson(String source) => HistoryDetailModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'HistoryDetailModel(stateManager: $stateManager, runningWorkflows: $runningWorkflows, completedWorkflows: $completedWorkflows)';

  @override
  bool operator ==(covariant HistoryDetailModel other) {
    if (identical(this, other)) return true;

    return other.stateManager == stateManager && listEquals(other.runningWorkflows, runningWorkflows) && listEquals(other.completedWorkflows, completedWorkflows);
  }

  @override
  int get hashCode => stateManager.hashCode ^ runningWorkflows.hashCode ^ completedWorkflows.hashCode;
}
