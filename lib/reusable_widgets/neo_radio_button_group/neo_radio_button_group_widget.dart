/*
 * Neobank.Client
 *
 * Created on 24/01/2024.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_divider/neo_divider.dart';
import 'package:backoffice/reusable_widgets/neo_radio_button_group/model/neo_radio_button_item_model.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/constants/neo_colors.dart';
import 'package:backoffice/util/constants/neo_dimens.dart';
import 'package:backoffice/util/constants/neo_text_styles.dart';
import 'package:backoffice/util/extensions/neo_extensions.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';

class NeoRadioButtonGroupWidget extends StatefulWidget {
  final List<NeoRadioButtonItemModel> items;
  final EdgeInsetsDirectional padding;
  final String dataKey;
  final int selectedOption;

  const NeoRadioButtonGroupWidget({
    required this.items,
    required this.dataKey,
    this.padding = EdgeInsetsDirectional.zero,
    int selectedOption = 0,
    super.key,
  }) : selectedOption = selectedOption < 0
            ? 0
            : selectedOption > items.length - 1
                ? items.length - 1
                : selectedOption;

  @override
  State<NeoRadioButtonGroupWidget> createState() => _NeoRadioButtonGroupWidgetState();
}

class _NeoRadioButtonGroupWidgetState extends State<NeoRadioButtonGroupWidget> {
  int selectedOption = 0;
  @override
  void initState() {
    super.initState();
    selectedOption = widget.selectedOption;
    _onValueChange(context);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> radioButtonGroup = [];
    for (int index = 0; index < widget.items.length; index++) {
      radioButtonGroup.add(_buildRadioButton(index, context));
      if (index != widget.items.length - 1) {
        radioButtonGroup.add(const NeoDivider());
      }
    }
    return Column(
      children: radioButtonGroup,
    ).padding(widget.padding);
  }

  Widget _buildRadioButton(int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectedOption = index;
        _onValueChange(context);
        setState(() {});
      },
      child: Row(
        children: [
          SizedBox(
            height: NeoDimens.px20,
            width: NeoDimens.px20,
            child: Radio(
              value: index,
              groupValue: selectedOption,
              fillColor: MaterialStateColor.resolveWith(
                (states) => NeoColors.bgDarker,
              ),
              onChanged: (value) {},
            ),
          ).padding(
            const EdgeInsetsDirectional.only(end: NeoDimens.px8, bottom: NeoDimens.px20, top: NeoDimens.px20),
          ),
          Expanded(
            child: NeoText(
              widget.items[index].title,
              style: NeoTextStyles.bodyFourteenMedium,
            ),
          ),
        ],
      ),
    );
  }

  void _onValueChange(BuildContext context) {
    try {
      context.read<WorkflowFormBloc>().add(WorkflowFormEventAddAllParameters({widget.dataKey: widget.items[selectedOption].dataKey}));
    } catch (e) {
      // No-op
    }
  }
}
