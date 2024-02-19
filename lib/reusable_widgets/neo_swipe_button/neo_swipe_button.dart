/*
 * Neobank.Client
 *
 * Created on 23/11/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/dependency_injection/dependency_injection.dart';
import 'package:backoffice/reusable_widgets/neo_button/bloc/neo_button_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_button/i_neo_button.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/reusable_widgets/neo_swipe_button/bloc/neo_swipe_button_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_swipe_button/widgets/gradiant_circular_loading_indicator.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';
import 'package:neo_core/neo_core.dart';

part 'widgets/_neo_swipe_button_content.dart';

class NeoSwipeButton extends StatelessWidget {
  final String? transitionId;
  final String? widgetEventKey;
  final bool startWorkflow;
  final String? labelText;
  final String? loadingLabelText;
  final EdgeInsetsDirectional? padding;
  final Map<String, dynamic> transitionParams;
  final bool formValidationRequired;

  const NeoSwipeButton({
    this.transitionId,
    this.widgetEventKey,
    this.startWorkflow = false,
    super.key,
    this.labelText,
    this.loadingLabelText,
    this.padding,
    this.formValidationRequired = false,
    this.transitionParams = const {},
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NeoSwipeButtonBloc(),
      child: _NeoTransitionSwipeButton(
        transitionId: transitionId,
        widgetEventKey: widgetEventKey,
        startWorkflow: startWorkflow,
        labelText: labelText.orEmpty,
        loadingLabelText: loadingLabelText,
        padding: padding,
        transitionParams: transitionParams,
        formValidationRequired: formValidationRequired,
      ),
    );
  }
}

class _NeoTransitionSwipeButton extends INeoButton {
  final String? loadingLabelText;
  final Map<String, dynamic> transitionParams;

  const _NeoTransitionSwipeButton({
    super.transitionId,
    super.widgetEventKey,
    super.startWorkflow,
    this.loadingLabelText,
    super.labelText,
    super.padding,
    super.formValidationRequired,
    this.transitionParams = const {},
  });

  @override
  Widget Function(BuildContext, NeoButtonState) get childBuilder => (context, state) {
        return BlocListener<NeoSwipeButtonBloc, NeoSwipeButtonState>(
          listener: (context, state) {
            if (state.isLoading) {
              startTransition(context);
            }
          },
          child: _NeoSwipeButtonContent(
            labelText: labelText,
            loadingLabelText: loadingLabelText,
            padding: padding,
          ),
        );
      };

  @override
  Future startTransition(BuildContext context, {Map<String, dynamic>? transitionBody}) {
    if (formValidationRequired) {
      final isFormValid = context.read<WorkflowFormBloc>().formKey.currentState?.validate() ?? false;
      if (!isFormValid) {
        getIt.get<NeoWidgetEventBus>().addEvent(NeoWidgetEvent(eventId: NeoWidgetEventKeys.neoSwipeButtonStopLoading.name));
      }
    }
    return super.startTransition(context, transitionBody: transitionBody);
  }

  @override
  Map<String, dynamic> getDefaultTransitionParams(BuildContext context) => {...super.getDefaultTransitionParams(context), ...transitionParams};
}
