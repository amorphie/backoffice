/*
 * 
 * neo_bank
 * 
 * Created on 28/11/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:backoffice/core/dependency_injection/dependency_injection.dart';
import 'package:backoffice/core/mixins/neo_transitional.dart';
import 'package:backoffice/core/navigation/neo_navigation_helper.dart';
import 'package:backoffice/reusable_widgets/neo_button/bloc/neo_button_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_button/model/neo_button_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_button/model/neo_button_enable_state.dart';
import 'package:backoffice/reusable_widgets/neo_button/model/neo_button_size.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/bus/neo_bus.dart';
import 'package:neo_core/core/navigation/models/signalr_transition_data.dart';
import 'package:neo_core/core/widgets/neo_transition_listener/bloc/neo_transition_listener_bloc.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';

abstract class INeoButton extends StatelessWidget with NeoTransitional {
  const INeoButton({
    this.transitionId,
    this.widgetEventKey,
    this.labelText = "",
    this.iconLeftUrn,
    this.iconRightUrn,
    this.size = NeoButtonSize.medium,
    this.displayMode = NeoButtonDisplayMode.primary,
    this.enableState = NeoButtonEnableState.enabled,
    this.startWorkflow = false,
    this.autoTriggerTransition = true,
    this.formValidationRequired = false,
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  final String? transitionId;
  final String? widgetEventKey;
  final bool startWorkflow;
  final bool autoTriggerTransition;
  final String labelText;
  final String? iconLeftUrn;
  final String? iconRightUrn;
  final NeoButtonSize size;
  final NeoButtonDisplayMode displayMode;
  final NeoButtonEnableState enableState;
  final bool formValidationRequired;
  final EdgeInsetsDirectional? padding;

  @override
  @visibleForOverriding
  Map<String, dynamic> getDefaultTransitionParams(BuildContext context) => {};

  abstract final Widget Function(BuildContext, NeoButtonState) childBuilder;

  @nonVirtual
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NeoButtonBloc()..add(NeoButtonEventInitial(enableState: enableState)),
      child: BlocConsumer<NeoButtonBloc, NeoButtonState>(
        listener: (context, state) {
          if (state.navigationData.isNotNull) {
            _handleNavigation(context, state.navigationData!);
          }
        },
        builder: (context, state) => childBuilder(context, state),
      ),
    );
  }

  /// This method checks form validation status if required. After validation, it triggers;
  /// - If [transitionId] is provided => Workflow transition
  /// - Else if [widgetEventKey] is provided => Local [NeoWidgetEventBus] event using widgetEventKey as event key
  ///   and current date as event value.
  @override
  Future startTransition(BuildContext context, {Map<String, dynamic>? transitionBody}) async {
    if (formValidationRequired) {
      final isFormValid = context.read<WorkflowFormBloc>().formKey.currentState?.validate() ?? false;
      if (!isFormValid) {
        return;
      }
    }
    if (context.read<NeoButtonBloc>().state.enableState != NeoButtonEnableState.enabled) {
      return;
    }
    if (!transitionId.isNullOrBlank && autoTriggerTransition) {
      final neoButtonBloc = context.read<NeoButtonBloc>();
      final neoTransitionListenerBloc = context.read<NeoTransitionListenerBloc>();
      final transitionBodyWithParams = (transitionBody ?? _getFormParametersIfExist(context))..addAll(getDefaultTransitionParams(context));

      if (startWorkflow) {
        final initWorkflowResponse = await neoTransitionListenerBloc.initWorkflow(transitionId.orEmpty);
        neoButtonBloc.add(NeoButtonEventInitWorkflow(initResponse: initWorkflowResponse));
      } else {
        neoTransitionListenerBloc.add(
          NeoTransitionListenerEventPostTransition(
            transitionName: transitionId.orEmpty,
            body: transitionBodyWithParams,
          ),
        );
      }
    }
    if (!widgetEventKey.isNullOrBlank) {
      getIt.get<NeoWidgetEventBus>().addEvent(NeoWidgetEvent(eventId: widgetEventKey!, data: DateTime.now()));
    }
  }

  Map<String, dynamic> _getFormParametersIfExist(BuildContext context) {
    Map<String, dynamic> data = {};
    try {
      data = context.read<WorkflowFormBloc>().formData;
    } on Exception catch (_) {
      // no-op
    }
    return data;
  }

  void _handleNavigation(BuildContext context, SignalrTransitionData navigationData) {
    getIt.get<NeoNavigationHelper>().navigateWithTransition(transitionData: navigationData);
  }
}
