// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UIWorkflowModel {
  String entity;
  String? name;
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
    this.workflowNameData,
    this.history = true,
    this.stateManager = true,
    this.runningWorkflows = true,
    this.availableWorkflows = true,
  });
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'entity': entity,
      'name': name,
      'recordIdData': recordIdData,
      'entityNameData': entityNameData,
      'workflowNameData': workflowNameData,
      'history': history,
      'stateManager': stateManager,
      'runningWorkflows': runningWorkflows,
      'availableWorkflows': availableWorkflows,
    };
  }

  factory UIWorkflowModel.fromMap(Map<String, dynamic> map) {
    return UIWorkflowModel(
      entity: map['entity'] as String,
      name: map['name'] != null ? map['name'] as String : null,
      recordIdData: map['recordIdData'] as String,
      entityNameData: map['entityNameData'] != null ? map['entityNameData'] as String : null,
      workflowNameData: map['workflowNameData'] != null ? map['workflowNameData'] as String : null,
      history: map['history'] as bool,
      stateManager: map['stateManager'] as bool,
      runningWorkflows: map['runningWorkflows'] as bool,
      availableWorkflows: map['availableWorkflows'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UIWorkflowModel.fromJson(String source) => UIWorkflowModel.fromMap(json.decode(source) as Map<String, dynamic>);

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
