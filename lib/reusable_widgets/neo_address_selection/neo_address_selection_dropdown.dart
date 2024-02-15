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
import 'package:backoffice/reusable_widgets/neo_address_selection/bloc/neo_address_selection_dropdown_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_address_selection/network/neo_address_selection_dropdown_network_manager.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/adapters/neo_address_selection_dropdown_adapter.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/neo_dropdown.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NeoAddressSelectionDropdown extends StatelessWidget {
  final String dataKey;
  final EdgeInsetsDirectional padding;

  const NeoAddressSelectionDropdown({
    required this.dataKey,
    this.padding = EdgeInsetsDirectional.zero,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NeoAddressSelectionDropdownBloc(networkManager: NeoAddressSelectionDropdownNetworkManager())..add(NeoAddressSelectionDropdownEventFetchAddressList()),
      child: BlocConsumer<NeoAddressSelectionDropdownBloc, NeoAddressSelectionDropdownState>(
        listener: (BuildContext context, NeoAddressSelectionDropdownState state) {
          if (state is NeoAddressSelectionDropdownStateLoaded && state.addressList.length == 1) {
            context.read<WorkflowFormBloc>().add(
                  WorkflowFormEventAddAllParameters({dataKey: state.addressList.first.formData}),
                );
          }
        },
        builder: (context, state) {
          return padding == EdgeInsetsDirectional.zero ? _buildComponent(context, state) : Padding(padding: padding, child: _buildComponent(context, state));
        },
      ),
    );
  }

  Widget _buildComponent(BuildContext context, NeoAddressSelectionDropdownState state) {
    return Skeletonizer(
      enabled: state is NeoAddressSelectionDropdownStateLoading,
      child: _buildDropdown(context, state),
    );
  }

  //TODO: Handle other states if necessary
  Widget _buildDropdown(BuildContext context, NeoAddressSelectionDropdownState state) {
    switch (state) {
      case NeoAddressSelectionDropdownStateLoaded _:
        return NeoDropdown(
          adapter: NeoAddressSelectionDropdownAdapter(
            items: state.addressList,
            onItemSelected: (selectedItemFormData) {
              context.read<WorkflowFormBloc>().add(
                    WorkflowFormEventAddAllParameters({dataKey: selectedItemFormData}),
                  );
            },
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
