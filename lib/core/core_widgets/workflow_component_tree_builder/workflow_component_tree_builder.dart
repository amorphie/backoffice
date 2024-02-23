import 'package:backoffice/backoffice/core/bo_transition_type_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/core/core_widgets/workflow_component_tree_builder/bloc/workflow_component_tree_builder_bloc.dart';
import 'package:backoffice/core/core_widgets/workflow_component_tree_builder/network/workflow_components_network_manager.dart';
import 'package:backoffice/core/pages/usecases/get_error_widget_usecase.dart';

import '../../../backoffice/features/bo_transition_page/bo_transition_page.dart';
import '../../../backoffice/widgets/neo_web_view/neo_web_view.dart';

class WorkflowComponentTreeBuilder extends StatelessWidget {
  final WorkflowComponentsNetworkManager componentsNetworkManager;
  final String source;
  final String pageId;
  final Widget? loadingWidget;
  final Widget? errorWidget;

  const WorkflowComponentTreeBuilder({
    required this.componentsNetworkManager,
    required this.source,
    required this.pageId,
    this.loadingWidget,
    this.errorWidget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkflowComponentTreeBuilderBloc, WorkflowComponentTreeBuilderState>(
      bloc: WorkflowComponentTreeBuilderBloc(componentsNetworkManager)
        ..add(WorkflowComponentTreeBuilderEventInit(source: source, pageId: pageId))
        ..add(WorkflowComponentTreeBuilderEventFetchComponents()),
      builder: (context, state) {
        switch (state) {
          case WorkflowComponentTreeBuilderStateLoading _:
            return loadingWidget ?? _defaultLoadingWidget;
          case WorkflowFormioBuilderStateLoaded _:
            return BackofficeTransitionPage(
              type: BoTransitionType.Formio,
              data: state.formioData,
              transitionId: pageId,
            );
          case WorkflowHtmlBuilderStateLoaded _:
            return BackofficeTransitionPage(
              type: BoTransitionType.Html,
              data: state.htmlData,
              transitionId: pageId,
            );

          case WorkflowComponentTreeBuilderStateLoaded _:
            return JsonWidgetData.fromDynamic(state.componentsMap).build(context: context);
          case WorkflowComponentTreeBuilderStateError _:
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
