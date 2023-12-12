// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../ui/helpers/exporter.dart';

class WorkflowModel {
  StateManager? stateManager;
  List<StateManager>? runningWorkflows;
  List<StateManager>? availableWorkflows;

  bool get isEmpty => stateManagerEmpty && runningWorkflowsEmpty && availableWorkflowsEmpty;

  bool get stateManagerEmpty => stateManager == null;
  bool get runningWorkflowsEmpty => runningWorkflows == null || runningWorkflows!.length == 0;
  bool get availableWorkflowsEmpty => availableWorkflows == null || availableWorkflows!.length == 0;

  WorkflowModel({
    this.stateManager,
    this.runningWorkflows,
    this.availableWorkflows,
  });

  WorkflowModel copyWith({
    StateManager? stateManager,
    List<StateManager>? runningWorkflows,
    List<StateManager>? availableWorkflows,
  }) {
    return WorkflowModel(
      stateManager: stateManager ?? this.stateManager,
      runningWorkflows: runningWorkflows ?? this.runningWorkflows,
      availableWorkflows: availableWorkflows ?? this.availableWorkflows,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'stateManager': stateManager?.toMap(),
      'runningWorkflows': runningWorkflows?.map((x) => x.toMap()).toList(),
      'availableWorkflows': availableWorkflows?.map((x) => x.toMap()).toList(),
    };
  }

  factory WorkflowModel.fromMap(Map<String, dynamic> map) {
    return WorkflowModel(
      stateManager: map['stateManager'] != null ? StateManager.fromMap(map['stateManager'] as Map<String, dynamic>) : null,
      runningWorkflows: map['runningWorkflows'] != null
          ? List<StateManager>.from(
              (map['runningWorkflows']).map<StateManager?>(
                (x) => StateManager.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      availableWorkflows: map['availableWorkflows'] != null
          ? List<StateManager>.from(
              (map['availableWorkflows']).map<StateManager?>(
                (x) => StateManager.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkflowModel.fromJson(String source) => WorkflowModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'WorkflowModel(stateManager: $stateManager, runningWorkflows: $runningWorkflows, availableWorkflows: $availableWorkflows)';

  @override
  bool operator ==(covariant WorkflowModel other) {
    if (identical(this, other)) return true;

    return other.stateManager == stateManager && listEquals(other.runningWorkflows, runningWorkflows) && listEquals(other.availableWorkflows, availableWorkflows);
  }

  @override
  int get hashCode => stateManager.hashCode ^ runningWorkflows.hashCode ^ availableWorkflows.hashCode;
}
