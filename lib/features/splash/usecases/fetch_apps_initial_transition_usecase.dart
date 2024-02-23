/*
 * neo_bank
 *
 * Created on 9/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:get_it/get_it.dart';
import 'package:neo_core/core/navigation/models/neo_navigation_type.dart';
import 'package:neo_core/core/navigation/models/signalr_transition_data.dart';
import 'package:neo_core/core/network/managers/neo_network_manager.dart';
import 'package:neo_core/core/workflow_form/neo_workflow_manager.dart';

class FetchAppsInitialTransitionUseCase {
  static SignalrTransitionData? _initialTransitionData;

  Future<SignalrTransitionData?> call() async {
    NeoWorkflowManager.resetInstanceId();

    if (_initialTransitionData != null) {
      return _initialTransitionData;
    }
    try {
      final response = await NeoWorkflowManager(GetIt.I<NeoNetworkManager>()).initWorkflow(
        workflowName: "amorphie-mobile-login",
      );

      return _initialTransitionData ??= SignalrTransitionData(
        navigationPath: response["init-page-name"],
        navigationType: NeoNavigationType.pushAsRoot,
        pageId: response["state"],
        viewSource: response["view-source"],
        initialData: {},
        isBackNavigation: false,
        transitionId: response["transition"].first["transition"],
      );
    } catch (e) {
      return null;
    }
  }
}
