part of 'neo_component_tree_builder_bloc.dart';

sealed class NeoComponentTreeBuilderEvent extends Equatable {
  const NeoComponentTreeBuilderEvent();
}

class NeoComponentTreeBuilderEventInit extends NeoComponentTreeBuilderEvent {
  final String pageId;

  const NeoComponentTreeBuilderEventInit({required this.pageId});

  @override
  List<Object?> get props => [pageId];
}

class NeoComponentTreeBuilderEventFetchComponents extends NeoComponentTreeBuilderEvent {
  const NeoComponentTreeBuilderEventFetchComponents();

  @override
  List<Object?> get props => [];
}
