part of 'workflow_component_tree_builder_bloc.dart';

sealed class WorkflowComponentTreeBuilderState extends Equatable {
  const WorkflowComponentTreeBuilderState();
}

class WorkflowComponentTreeBuilderStateLoading extends WorkflowComponentTreeBuilderState {
  @override
  List<Object> get props => [];
}

class WorkflowComponentTreeBuilderStateLoaded extends WorkflowComponentTreeBuilderState {
  final Map<String, dynamic> componentsMap;

  const WorkflowComponentTreeBuilderStateLoaded({required this.componentsMap});

  @override
  List<Object> get props => [componentsMap];
}

class WorkflowComponentTreeBuilderStateError extends WorkflowComponentTreeBuilderState {
  final String errorMessage;

  const WorkflowComponentTreeBuilderStateError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class WorkflowFormioBuilderStateLoaded extends WorkflowComponentTreeBuilderState {
  final String formioData;
  final String transitionId;
  const WorkflowFormioBuilderStateLoaded({required this.formioData, required this.transitionId});

  @override
  List<Object> get props => [formioData, transitionId];
}

class WorkflowHtmlBuilderStateLoaded extends WorkflowComponentTreeBuilderState {
  final String htmlData;

  const WorkflowHtmlBuilderStateLoaded({required this.htmlData});

  @override
  List<Object> get props => [htmlData];
}
