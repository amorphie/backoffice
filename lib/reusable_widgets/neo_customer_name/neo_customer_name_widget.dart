/*
 * 
 * Neobank.Client
 * 
 * Created on 29/01/2024.
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
import 'package:backoffice/core/localization/models/localization_key.dart';
import 'package:backoffice/reusable_widgets/neo_customer_name/bloc/neo_customer_name_widget_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_customer_name/models/neo_customer_name_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_customer_name/network/neo_customer_name_widget_network_manager.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/neo_text_form_field.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NeoCustomerNameWidget extends StatelessWidget {
  final String dataKey;
  final NeoCustomerNameDisplayMode displayMode;
  final EdgeInsetsDirectional padding;

  const NeoCustomerNameWidget({
    required this.dataKey,
    required this.displayMode,
    this.padding = EdgeInsetsDirectional.zero,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NeoCustomerNameWidgetBloc(
        networkManager: NeoCustomerNameWidgetNetworkManager(endpointKey: displayMode.getEndpoint()),
      )..add(NeoCustomerNameWidgetEventFetchCustomerName()),
      child: BlocConsumer<NeoCustomerNameWidgetBloc, NeoCustomerNameWidgetState>(
        builder: (context, state) {
          return _buildComponent(context, state).padding(padding);
        },
        listener: (BuildContext context, NeoCustomerNameWidgetState state) {
          if (state is NeoCustomerNameWidgetStateLoaded) {
            context.read<WorkflowFormBloc>().add(WorkflowFormEventAddAllParameters({dataKey: state.customerName}));
          }
        },
      ),
    );
  }

  Widget _buildComponent(BuildContext context, NeoCustomerNameWidgetState state) {
    return Skeletonizer(
      enabled: state is NeoCustomerNameWidgetStateLoading,
      child: _buildTextField(context, state),
    );
  }

//TODO: Handle other states if necessary
  Widget _buildTextField(BuildContext context, NeoCustomerNameWidgetState state) {
    switch (state) {
      case NeoCustomerNameWidgetStateLoaded _:
        return NeoTextFormField(
          labelText: state.customerName,
          titleText: LocalizationKey.debitCardApplicationNameOnCardLabel.loc(),
          enabled: false,
        );
      case NeoCustomerNameWidgetStateLoading _:
        return const SizedBox.shrink();
      case NeoCustomerNameWidgetStateError _:
        return const SizedBox.shrink();
    }
  }
}
