/*
 * 
 * Neobank.Client
 * 
 * Created on 27/11/2023.
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
import 'package:backoffice/core/base/dropdown/base_dropdown_item_data.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown_form_field/model/neo_dropdown_form_field_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown_form_field/model/neo_dropdown_type.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown_form_field/usecases/display_list_tile_bottom_sheet.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';

class NeoDropdownFormField extends StatefulWidget {
  final List<BaseDropdownItemData> itemList;
  final NeoDropdownType dropdownType;
  final String labelText;
  final String? bottomSheetTitle;
  final String? dataKey;
  final String? hint;
  final NeoDropdownFormFieldDisplayMode displayMode;
  final bool isHighlighted;
  final String? validationErrorMessage;
  final EdgeInsetsDirectional padding;

  const NeoDropdownFormField({
    required this.itemList,
    required this.dropdownType,
    this.labelText = "",
    this.bottomSheetTitle,
    this.dataKey,
    this.hint,
    this.validationErrorMessage,
    this.displayMode = NeoDropdownFormFieldDisplayMode.defaultMode,
    this.isHighlighted = false,
    this.padding = EdgeInsetsDirectional.zero,
    Key? key,
  }) : super(key: key);

  @override
  State<NeoDropdownFormField> createState() => _NeoDropdownFormFieldState();
}

class _NeoDropdownFormFieldState extends State<NeoDropdownFormField> {
  late List<BaseDropdownItemData> itemList = widget.itemList;
  BaseDropdownItemData? currentItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _displayBottomSheetAndHandleSelectionResult(context),
      child: IgnorePointer(
        child: DropdownButtonFormField<BaseDropdownItemData>(
          value: currentItem,
          items: itemList.map((e) => DropdownMenuItem<BaseDropdownItemData>(value: e, child: Text(e.displayData))).toList(),
          onChanged: (BaseDropdownItemData? value) {},
          style: widget.isHighlighted ? NeoTextStyles.labelFourteenMedium : NeoTextStyles.labelFourteenMedium.apply(color: NeoColors.textPlaceholder),
          validator: (_) => currentItem.isNull ? widget.validationErrorMessage : null,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          hint: NeoText(
            widget.hint,
            style: NeoTextStyles.labelFourteenMedium.copyWith(color: NeoColors.textPlaceholder),
          ),
          icon: NeoIcon(
            iconUrn: NeoAssets.chevronDown.urn,
            width: NeoDimens.px16,
            height: NeoDimens.px16,
            color: widget.isHighlighted ? NeoColors.textDefault : NeoColors.textPlaceholder,
          ).paddingOnly(start: NeoDimens.px8),
          borderRadius: BorderRadius.circular(NeoRadius.px8),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: NeoDimens.px16, vertical: NeoDimens.px2),
            border: _buildInputBorder(),
            labelText: widget.labelText.isBlank ? null : widget.labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        ),
      ),
    ).padding(widget.padding);
  }

  InputBorder _buildInputBorder() {
    switch (widget.displayMode) {
      case NeoDropdownFormFieldDisplayMode.defaultMode:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(NeoRadius.px8),
          borderSide: const BorderSide(color: NeoColors.borderMediumDark),
        );
      case NeoDropdownFormFieldDisplayMode.noBorder:
        return InputBorder.none;
    }
  }

  Future<void> _displayBottomSheetAndHandleSelectionResult(BuildContext context) async {
    switch (widget.dropdownType) {
      case NeoDropdownType.securityQuestion:
        currentItem = await const DisplayListTileBottomSheet().call(context, widget.bottomSheetTitle, itemList) ?? currentItem;
    }

    if (currentItem != null) {
      itemList.selectItem(currentItem!);
      if (widget.dataKey.isNotNull) {
        // ignore: use_build_context_synchronously
        context.read<WorkflowFormBloc>().add(
              WorkflowFormEventUpdateTextFormField(key: widget.dataKey.orEmpty, value: currentItem?.formData ?? ""),
            );
      }
    }

    setState(() {});
  }
}
