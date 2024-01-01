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

import 'package:admin/core/util/neo_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:neo_core/core/util/neo_core_app_constants.dart';
import 'package:neo_core/core/widgets/neo_transition_listener/neo_transition_listener_widget.dart';

mixin NeoTransitional on Widget {
  String? get transitionId;

  @visibleForOverriding
  Map<String, dynamic> get defaultTransitionParams => {};

  Widget wrapWithTransitionListener({required BuildContext context, required Widget child}) {
    if (transitionId.isNullOrBlank) {
      return child;
    }
    final appConstants = GetIt.I<NeoCoreAppConstants>();
    return NeoTransitionListenerWidget(
      transitionId: transitionId.orEmpty,
      signalRServerUrl: appConstants.workflowHubUrl,
      signalRMethodName: appConstants.workflowMethodName,
      onPageNavigation: (navigationData) {},
      onError: (errorMessage) => onTransitionError(context, errorMessage),
      child: child,
    );
  }

  /// Triggered when there is an error from SignalR
  @visibleForOverriding
  void onTransitionError(BuildContext context, String errorMessage);

  Future startTransition(BuildContext context, {Map<String, dynamic>? transitionBody});
}
