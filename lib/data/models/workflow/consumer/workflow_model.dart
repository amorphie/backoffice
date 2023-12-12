// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../ui/helpers/exporter.dart';

part 'workflow_model.g.dart';

@JsonSerializable()
class WorkflowModel {
  @JsonKey(includeIfNull: false)
  StateManager? stateManager;
  @JsonKey(includeIfNull: false)
  List<StateManager>? runningWorkflows;
  @JsonKey(includeIfNull: false)
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

  factory WorkflowModel.fromJson(Map<String, dynamic> json) => _$WorkflowModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkflowModelToJson(this);

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
