/*
 * neo_bank
 *
 * Created on 18/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/core_widgets/workflow_component_tree_builder/network/workflow_components_network_manager.dart';
import 'package:backoffice/core/core_widgets/workflow_component_tree_builder/workflow_component_tree_builder.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';

class NeoWorkflowPage extends StatelessWidget {
  const NeoWorkflowPage({
    required this.source,
    required this.pageId,
    this.initialData = const {},
    Key? key,
  }) : super(key: key);

  final String source;
  final String pageId;
  final Map<String, dynamic> initialData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkflowFormBloc()..add(WorkflowFormEventAddAllParameters(initialData)),
      child: BlocBuilder<WorkflowFormBloc, WorkflowFormState>(
        builder: (context, state) {
          return Form(
            key: context.read<WorkflowFormBloc>().formKey,
            child: Material(
              child: WorkflowComponentTreeBuilder(
                componentsNetworkManager: WorkflowComponentsNetworkManager(),
                source: source,
                pageId: pageId,
              ),
            ),
          );
        },
      ),
    );
  }
}
