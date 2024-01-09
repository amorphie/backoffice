part of 'workflow_component_tree_builder_bloc.dart';

sealed class WorkflowComponentTreeBuilderEvent extends Equatable {
  const WorkflowComponentTreeBuilderEvent();
}

class WorkflowComponentTreeBuilderEventFetchComponents extends WorkflowComponentTreeBuilderEvent {
  final String source;
  final String pageId;

  const WorkflowComponentTreeBuilderEventFetchComponents({required this.source, required this.pageId});

  @override
  List<Object?> get props => [source, pageId];
}
