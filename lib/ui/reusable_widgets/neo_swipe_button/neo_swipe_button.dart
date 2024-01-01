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
import 'package:admin/ui/reusable_widgets/neo_button/bloc/neo_button_bloc.dart';
import 'package:admin/ui/reusable_widgets/neo_button/i_neo_button.dart';
import 'package:admin/ui/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:admin/ui/reusable_widgets/neo_swipe_button/bloc/neo_swipe_button_bloc.dart';
import 'package:admin/ui/reusable_widgets/neo_swipe_button/widgets/gradiant_circular_loading_indicator.dart';
import 'package:admin/core/util/neo_util.dart';

part 'widgets/_neo_swipe_button_content.dart';

class NeoSwipeButton extends StatelessWidget {
  final String? transitionId;
  final String? widgetEventKey;
  final bool startWorkflow;
  final String? labelText;
  final String? loadingLabelText;
  final EdgeInsetsDirectional? padding;
  final Map<String, dynamic> transitionParams;

  const NeoSwipeButton({
    this.transitionId,
    this.widgetEventKey,
    this.startWorkflow = false,
    super.key,
    this.labelText,
    this.loadingLabelText,
    this.padding,
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
  void onTransitionError(BuildContext context, String errorMessage) {
    context.read<NeoSwipeButtonBloc>().add(NeoSwipeButtonEventShowError(message: errorMessage));
  }

  @override
  Map<String, dynamic> get defaultTransitionParams => {...super.defaultTransitionParams, ...transitionParams};
}
