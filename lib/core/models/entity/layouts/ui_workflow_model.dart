// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ui_workflow_model.g.dart';

@JsonSerializable()
class UIWorkflowModel extends Equatable {
  String entity;
  String? name;
  String? firstTransition;
  String recordIdData;
  String? entityNameData;
  String? workflowNameData;
  bool history;
  bool stateManager;
  bool runningWorkflows;
  bool availableWorkflows;
  UIWorkflowModel({
    required this.entity,
    this.name,
    this.recordIdData = "id",
    this.entityNameData,
    this.firstTransition,
    this.workflowNameData,
    this.history = true,
    this.stateManager = true,
    this.runningWorkflows = true,
    this.availableWorkflows = true,
  });

  factory UIWorkflowModel.fromJson(Map<String, dynamic> json) => _$UIWorkflowModelFromJson(json);
  Map<String, dynamic> toJson() => _$UIWorkflowModelToJson(this);
  @override
  List<Object?> get props {
    return [
      entity,
      name,
      recordIdData,
      entityNameData,
      workflowNameData,
      history,
      stateManager,
      runningWorkflows,
      availableWorkflows,
    ];
  }

  factory UIWorkflowModel.init() => UIWorkflowModel(entity: "");

  UIWorkflowModel copyWith({
    String? entity,
    String? name,
    String? recordIdData,
    String? entityNameData,
    String? workflowNameData,
    bool? history,
    bool? stateManager,
    bool? runningWorkflows,
    bool? availableWorkflows,
  }) {
    return UIWorkflowModel(
      entity: entity ?? this.entity,
      name: name ?? this.name,
      recordIdData: recordIdData ?? this.recordIdData,
      entityNameData: entityNameData ?? this.entityNameData,
      workflowNameData: workflowNameData ?? this.workflowNameData,
      history: history ?? this.history,
      stateManager: stateManager ?? this.stateManager,
      runningWorkflows: runningWorkflows ?? this.runningWorkflows,
      availableWorkflows: availableWorkflows ?? this.availableWorkflows,
    );
  }

  @override
  String toString() {
    return 'UIWorkflowModel(entity: $entity, name: $name, recordIdData: $recordIdData, entityNameData: $entityNameData, workflowNameData: $workflowNameData, history: $history, stateManager: $stateManager, runningWorkflows: $runningWorkflows, availableWorkflows: $availableWorkflows)';
  }

  @override
  bool operator ==(covariant UIWorkflowModel other) {
    if (identical(this, other)) return true;

    return other.entity == entity &&
        other.name == name &&
        other.recordIdData == recordIdData &&
        other.entityNameData == entityNameData &&
        other.workflowNameData == workflowNameData &&
        other.history == history &&
        other.stateManager == stateManager &&
        other.runningWorkflows == runningWorkflows &&
        other.availableWorkflows == availableWorkflows;
  }

  @override
  int get hashCode {
    return entity.hashCode ^
        name.hashCode ^
        recordIdData.hashCode ^
        entityNameData.hashCode ^
        workflowNameData.hashCode ^
        history.hashCode ^
        stateManager.hashCode ^
        runningWorkflows.hashCode ^
        availableWorkflows.hashCode;
  }
}
