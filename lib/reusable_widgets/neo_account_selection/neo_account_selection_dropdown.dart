/*
 * 
 * neo_bank
 * 
 * Created on 19/01/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_account_selection/bloc/neo_account_selection_dropdown_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_account_selection/network/neo_account_selection_dropdown_network_manager.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/adapters/neo_account_selection_dropdown_adapter.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/neo_dropdown.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NeoAccountSelectionDropdown extends StatelessWidget {
  final String dataKey;
  final EdgeInsetsDirectional padding;

  const NeoAccountSelectionDropdown({
    required this.dataKey,
    this.padding = EdgeInsetsDirectional.zero,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NeoAccountSelectionDropdownBloc(networkManager: NeoAccountSelectionDropdownNetworkManager())..add(NeoAccountSelectionDropdownEventFetchAccountList()),
      child: BlocConsumer<NeoAccountSelectionDropdownBloc, NeoAccountSelectionDropdownState>(
        builder: (context, state) {
          return _buildComponent(context, state).padding(padding);
        },
        listener: (BuildContext context, NeoAccountSelectionDropdownState state) {
          if (state is NeoAccountSelectionDropdownStateLoaded && state.accountList.length == 1) {
            _selectItem(context, state.accountList.first.formData);
          }
        },
      ),
    );
  }

  Widget _buildComponent(BuildContext context, NeoAccountSelectionDropdownState state) {
    return Skeletonizer(
      enabled: state is NeoAccountSelectionDropdownStateLoading,
      child: _buildDropdown(context, state),
    );
  }

  //TODO: Handle other states if necessary
  Widget _buildDropdown(BuildContext context, NeoAccountSelectionDropdownState state) {
    switch (state) {
      case NeoAccountSelectionDropdownStateLoaded _:
        return NeoDropdown(
          adapter: NeoAccountSelectionDropdownAdapter(
            items: state.accountList,
            onItemSelected: (selectedItemFormData) {
              _selectItem(context, selectedItemFormData);
            },
          ),
        );
      case NeoAccountSelectionDropdownStateLoading _:
        return const SizedBox.shrink();
      case NeoAccountSelectionDropdownStateError _:
        return const SizedBox.shrink();
    }
  }

  void _selectItem(BuildContext context, dynamic formData) {
    context.read<WorkflowFormBloc>().add(WorkflowFormEventAddAllParameters({dataKey: formData}));
  }
}
