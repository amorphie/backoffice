// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:admin/data/models/formio/altmodels/available_workflows.dart';
import 'package:admin/data/models/formio/altmodels/running_workflows.dart';
import 'package:admin/data/models/formio/altmodels/statemanager.dart';

class FormioModel {
  StateManagerModel stateManager;
  List<RunningWorkflowsModel> availableWorkflows;
  List<AvailableWorkflowModel> runningWorkflows;
  FormioModel({
    required this.stateManager,
    required this.availableWorkflows,
    required this.runningWorkflows,
  });

  FormioModel copyWith({
    StateManagerModel? stateManager,
    List<RunningWorkflowsModel>? availableWorkflows,
    List<AvailableWorkflowModel>? runningWorkflows,
  }) {
    return FormioModel(
      stateManager: stateManager ?? this.stateManager,
      availableWorkflows: availableWorkflows ?? this.availableWorkflows,
      runningWorkflows: runningWorkflows ?? this.runningWorkflows,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'stateManager': stateManager.toMap(),
      'availableWorkflows': availableWorkflows.map((x) => x.toMap()).toList(),
      'runningWorkflows': runningWorkflows.map((x) => x.toMap()).toList(),
    };
  }

  factory FormioModel.fromMap(Map<String, dynamic> map) {
    return FormioModel(
      stateManager: StateManagerModel.fromMap(
          map['stateManager'] as Map<String, dynamic>),
      availableWorkflows: List<RunningWorkflowsModel>.from(
        (map['availableWorkflows'] as List<int>).map<RunningWorkflowsModel>(
          (x) => RunningWorkflowsModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      runningWorkflows: List<AvailableWorkflowModel>.from(
        (map['runningWorkflows'] as List<int>).map<AvailableWorkflowModel>(
          (x) => AvailableWorkflowModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory FormioModel.fromJson(String source) =>
      FormioModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'FormioModel(stateManager: $stateManager, availableWorkflows: $availableWorkflows, runningWorkflows: $runningWorkflows)';

  @override
  bool operator ==(covariant FormioModel other) {
    if (identical(this, other)) return true;

    return other.stateManager == stateManager &&
        listEquals(other.availableWorkflows, availableWorkflows) &&
        listEquals(other.runningWorkflows, runningWorkflows);
  }

  @override
  int get hashCode =>
      stateManager.hashCode ^
      availableWorkflows.hashCode ^
      runningWorkflows.hashCode;
}
