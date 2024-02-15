/*
 * neo_bank
 *
 * Created on 23/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:backoffice/core/pages/neo_workflow_page.dart';
import 'package:backoffice/reusable_widgets/neo_popup/usecases/base_show_popup_use_case.dart';
import 'package:neo_core/core/navigation/models/signalr_transition_data.dart';

class ShowWorkflowPopupUseCase extends BaseShowPopupUseCase {
  final SignalrTransitionData? transitionData;

  ShowWorkflowPopupUseCase({this.transitionData});

  @override
  Widget build(BuildContext context) {
    return NeoWorkflowPage(
      source: transitionData?.viewSource ?? "",
      pageId: transitionData?.pageId ?? "",
      initialData: transitionData?.initialData ?? {},
      loadingWidget: const SizedBox.shrink(),
    );
  }
}
