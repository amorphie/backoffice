// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:admin/data/models/workflow/altmodels/available_workflows.dart';
import 'package:admin/data/models/workflow/altmodels/running_workflows.dart';
import 'package:admin/data/models/workflow/altmodels/statemanager.dart';

class WorkflowModel {
  StateManagerModel stateManager;
  List<AvailableWorkflowModel>? availableWorkflows;
  List<RunningWorkflowsModel>? runningWorkflows;
  WorkflowModel({
    required this.stateManager,
    this.availableWorkflows,
    this.runningWorkflows,
  });

  factory WorkflowModel.init() {
    return WorkflowModel(stateManager: StateManagerModel());
  }

  WorkflowModel copyWith({
    StateManagerModel? stateManager,
    List<AvailableWorkflowModel>? availableWorkflows,
    List<RunningWorkflowsModel>? runningWorkflows,
  }) {
    return WorkflowModel(
      stateManager: stateManager ?? this.stateManager,
      availableWorkflows: availableWorkflows ?? this.availableWorkflows,
      runningWorkflows: runningWorkflows ?? this.runningWorkflows,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'stateManager': stateManager.toMap(),
      'availableWorkflows': availableWorkflows?.map((x) => x.toMap()).toList(),
      'runningWorkflows': runningWorkflows?.map((x) => x.toMap()).toList(),
    };
  }

  factory WorkflowModel.fromMap(Map<String, dynamic> map) {
    return WorkflowModel(
      stateManager: StateManagerModel.fromMap(map['stateManager'] as Map<String, dynamic>),
      availableWorkflows: map['availableWorkflows'] != null
          ? List<AvailableWorkflowModel>.from(
              (map['availableWorkflows']).map<AvailableWorkflowModel?>(
                (x) => AvailableWorkflowModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      runningWorkflows: map['runningWorkflows'] != null
          ? List<RunningWorkflowsModel>.from(
              (map['runningWorkflows']).map<RunningWorkflowsModel?>(
                (x) => RunningWorkflowsModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkflowModel.fromJson(String source) => WorkflowModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'WorkflowModel(stateManager: $stateManager, availableWorkflows: $availableWorkflows, runningWorkflows: $runningWorkflows)';

  @override
  bool operator ==(covariant WorkflowModel other) {
    if (identical(this, other)) return true;

    return other.stateManager == stateManager && listEquals(other.availableWorkflows, availableWorkflows) && listEquals(other.runningWorkflows, runningWorkflows);
  }

  @override
  int get hashCode => stateManager.hashCode ^ availableWorkflows.hashCode ^ runningWorkflows.hashCode;
}
