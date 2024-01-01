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
import 'package:admin/core/dependency_injection/dependency_injection.dart';
import 'package:admin/core/mixins/neo_transitional.dart';
import 'package:admin/ui/reusable_widgets/neo_button/bloc/neo_button_bloc.dart';
import 'package:admin/ui/reusable_widgets/neo_button/model/neo_button_display_mode.dart';
import 'package:admin/ui/reusable_widgets/neo_button/model/neo_button_size.dart';
import 'package:admin/core/util/neo_util.dart';
import 'package:neo_core/core/bus/neo_bus.dart';
import 'package:neo_core/core/navigation/models/signalr_transition_data.dart';
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
    this.enabled = true,
    this.startWorkflow = false,
    this.formValidationRequired = false,
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  final String? transitionId;
  final String? widgetEventKey;
  final bool startWorkflow;
  final String labelText;
  final String? iconLeftUrn;
  final String? iconRightUrn;
  final NeoButtonSize size;
  final NeoButtonDisplayMode displayMode;
  final bool enabled;
  final bool formValidationRequired;
  final EdgeInsetsDirectional? padding;

  @override
  @visibleForOverriding
  Map<String, dynamic> get defaultTransitionParams => {};

  abstract final Widget Function(BuildContext, NeoButtonState) childBuilder;

  @nonVirtual
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NeoButtonBloc()..add(NeoButtonEventInitial(enabled: enabled)),
      child: BlocConsumer<NeoButtonBloc, NeoButtonState>(
        listener: (context, state) {
          if (state.navigationData.isNotNull) {}
        },
        builder: (context, state) {
          return wrapWithTransitionListener(context: context, child: childBuilder(context, state));
        },
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
    if (!transitionId.isNullOrBlank) {
      context.read<NeoButtonBloc>().add(
            NeoButtonEventStartTransition(
              startWorkflow: startWorkflow,
              transitionId: transitionId.orEmpty,
              transitionBody: (transitionBody ?? _getFormParametersIfExist(context))..addAll(defaultTransitionParams),
            ),
          );
    } else if (!widgetEventKey.isNullOrBlank) {
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

  // void _handleNavigation(BuildContext context, SignalrTransitionData navigationData) {
  //   NeoNavigationHelper().navigateWithTransition(context: context, transitionData: navigationData);
  // }
}
