/*
 * 
 * neo_bank
 * 
 * Created on 05/02/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:flutter/material.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/adapters/neo_card_selection_dropdown_adapter.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/neo_dropdown.dart';

class NeoCardSelectionDropdown extends StatelessWidget {
  final String dataKey;
  final EdgeInsetsDirectional padding;
  final String transitionId;

  const NeoCardSelectionDropdown({
    required this.dataKey,
    required this.transitionId,
    this.padding = EdgeInsetsDirectional.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return padding == EdgeInsetsDirectional.zero ? _buildComponent(context) : Padding(padding: padding, child: _buildComponent(context));
  }

  //STOPSHIP: Use dataKey to submit card data to workflow
  Widget _buildComponent(BuildContext context) {
    return NeoDropdown(
      adapter: NeoCardSelectionDropdownAdapter(transitionId: transitionId),
    );
  }
}
