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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_button/bloc/neo_button_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_button/i_neo_button.dart';
import 'package:backoffice/reusable_widgets/neo_card_selection/model/neo_card_selection_item_data.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/bottom_sheet/bloc/neo_dropdown_bottom_sheet_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/util/neo_util.dart';

class NeoCardSelectionDropdownItemButton extends INeoButton {
  final NeoCardSelectionItemData itemData;
  const NeoCardSelectionDropdownItemButton({
    required this.itemData,
    super.key,
    super.transitionId,
    super.startWorkflow,
  });

  @override
  Widget Function(BuildContext context, NeoButtonState state) get childBuilder => (context, state) => _buildCardItemButton(context);

  Widget _buildCardItemButton(BuildContext context) {
    return ListTile(
      leading: NeoIcon(
        iconUrn: itemData.cardImageUrn.orEmpty,
        height: NeoDimens.px44,
        width: NeoDimens.px64,
      ),
      title: Text(itemData.cardName.orEmpty, style: NeoTextStyles.bodySixteenMedium),
      onTap: () {
        context.read<NeoDropdownBottomSheetBloc>().add(NeoDropdownBottomSheetEventSelectItem(itemData));
        startTransition(context);
      },
    );
  }
}
