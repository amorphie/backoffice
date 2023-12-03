import 'dart:convert';

class UIWorkflowModel {
  String entity;
  String? name;
  String recordIdData;
  bool history;
  bool stateManager;
  bool runningWorkflows;
  bool availableWorkflows;
  UIWorkflowModel({
    required this.entity,
    this.name,
    this.recordIdData = "id",
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
    bool? history,
    bool? stateManager,
    bool? runningWorkflows,
    bool? availableWorkflows,
  }) {
    return UIWorkflowModel(
      entity: entity ?? this.entity,
      name: name ?? this.name,
      recordIdData: recordIdData ?? this.recordIdData,
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
      recordIdData: map['recordIdData'] != null ? map['recordIdData'] as String : "id",
      history: map['history'] != null ? map['history'] as bool : true,
      stateManager: map['stateManager'] != null ? map['stateManager'] as bool : true,
      runningWorkflows: map['runningWorkflows'] != null ? map['runningWorkflows'] as bool : true,
      availableWorkflows: map['availableWorkflows'] != null ? map['availableWorkflows'] as bool : true,
    );
  }

  String toJson() => json.encode(toMap());

  factory UIWorkflowModel.fromJson(String source) => UIWorkflowModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UIWorkflowModel(entity: $entity, name: $name, recordIdData: $recordIdData, history: $history, stateManager: $stateManager, runningWorkflows: $runningWorkflows, availableWorkflows: $availableWorkflows)';
  }

  @override
  bool operator ==(covariant UIWorkflowModel other) {
    if (identical(this, other)) return true;

    return other.entity == entity &&
        other.name == name &&
        other.recordIdData == recordIdData &&
        other.history == history &&
        other.stateManager == stateManager &&
        other.runningWorkflows == runningWorkflows &&
        other.availableWorkflows == availableWorkflows;
  }

  @override
  int get hashCode {
    return entity.hashCode ^ name.hashCode ^ recordIdData.hashCode ^ history.hashCode ^ stateManager.hashCode ^ runningWorkflows.hashCode ^ availableWorkflows.hashCode;
  }
}
