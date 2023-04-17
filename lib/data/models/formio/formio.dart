// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:admin/data/models/formio/altmodels/available_workflows.dart';
import 'package:admin/data/models/formio/altmodels/running_workflows.dart';
import 'package:admin/data/models/formio/altmodels/statemanager.dart';

class FormioModel {
  StateManagerModel stateManagerModel;
  List<RunningWorkflowsModel> runningWorkflowsModel;
  List<AvailableWorkflowModel> availableWorkflowsModel;
  FormioModel({
    required this.stateManagerModel,
    required this.runningWorkflowsModel,
    required this.availableWorkflowsModel,
  });

  FormioModel copyWith({
    StateManagerModel? stateManagerModel,
    List<RunningWorkflowsModel>? runningWorkflowsModel,
    List<AvailableWorkflowModel>? availableWorkflowsModel,
  }) {
    return FormioModel(
      stateManagerModel: stateManagerModel ?? this.stateManagerModel,
      runningWorkflowsModel:
          runningWorkflowsModel ?? this.runningWorkflowsModel,
      availableWorkflowsModel:
          availableWorkflowsModel ?? this.availableWorkflowsModel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'stateManagerModel': stateManagerModel.toMap(),
      'runningWorkflowsModel':
          runningWorkflowsModel.map((x) => x.toMap()).toList(),
      'availableWorkflowsModel':
          availableWorkflowsModel.map((x) => x.toMap()).toList(),
    };
  }

  factory FormioModel.fromMap(Map<String, dynamic> map) {
    return FormioModel(
      stateManagerModel: StateManagerModel.fromMap(
          map['stateManagerModel'] as Map<String, dynamic>),
      runningWorkflowsModel: List<RunningWorkflowsModel>.from(
        (map['runningWorkflowsModel'] as List<int>).map<RunningWorkflowsModel>(
          (x) => RunningWorkflowsModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      availableWorkflowsModel: List<AvailableWorkflowModel>.from(
        (map['availableWorkflowsModel'] as List<int>)
            .map<AvailableWorkflowModel>(
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
      'FormioModel(stateManagerModel: $stateManagerModel, runningWorkflowsModel: $runningWorkflowsModel, availableWorkflowsModel: $availableWorkflowsModel)';

  @override
  bool operator ==(covariant FormioModel other) {
    if (identical(this, other)) return true;

    return other.stateManagerModel == stateManagerModel &&
        listEquals(other.runningWorkflowsModel, runningWorkflowsModel) &&
        listEquals(other.availableWorkflowsModel, availableWorkflowsModel);
  }

  @override
  int get hashCode =>
      stateManagerModel.hashCode ^
      runningWorkflowsModel.hashCode ^
      availableWorkflowsModel.hashCode;
}
