import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/core/core_widgets/neo_component_tree_builder/bloc/neo_component_tree_builder_bloc.dart';
import 'package:backoffice/core/core_widgets/neo_component_tree_builder/network/i_components_network_manager.dart';
import 'package:backoffice/core/pages/usecases/get_error_widget_usecase.dart';

class NeoComponentTreeBuilder extends StatelessWidget {
  final IComponentsNetworkManager componentsNetworkManager;
  final String pageId;
  final Widget? loadingWidget;
  final Widget? errorWidget;

  const NeoComponentTreeBuilder({
    required this.componentsNetworkManager,
    required this.pageId,
    this.loadingWidget,
    this.errorWidget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NeoComponentTreeBuilderBloc, NeoComponentTreeBuilderState>(
      bloc: NeoComponentTreeBuilderBloc(componentsNetworkManager)
        ..add(NeoComponentTreeBuilderEventInit(pageId: pageId))
        ..add(const NeoComponentTreeBuilderEventFetchComponents()),
      builder: (context, state) {
        switch (state) {
          case NeoComponentTreeBuilderStateLoading _:
            return loadingWidget ?? _defaultLoadingWidget;
          case NeoComponentTreeBuilderStateLoaded _:
            return JsonWidgetData.fromDynamic(state.componentsMap).build(context: context);
          case NeoComponentTreeBuilderStateError _:
            return errorWidget ?? _defaultErrorWidget;
        }
      },
    );
  }

  Widget get _defaultLoadingWidget => const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [Center(child: CircularProgressIndicator())],
      );

  Widget get _defaultErrorWidget => GetErrorWidgetUseCase().call(pageId);
}
