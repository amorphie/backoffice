import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/core_widgets/neo_component_tree_builder/neo_component_tree_builder.dart';
import 'package:backoffice/core/network/components_network_manager.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';

class NeoComponentPage extends StatelessWidget {
  const NeoComponentPage({required this.pageId, Key? key}) : super(key: key);

  final String pageId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkflowFormBloc(),
      child: BlocBuilder<WorkflowFormBloc, WorkflowFormState>(
        builder: (context, state) {
          return Form(
            key: context.read<WorkflowFormBloc>().formKey,
            child: NeoComponentTreeBuilder(
              componentsNetworkManager: ComponentsNetworkManager(),
              pageId: pageId,
            ),
          );
        },
      ),
    );
  }
}
