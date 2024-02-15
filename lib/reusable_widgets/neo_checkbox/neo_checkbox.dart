import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_checkbox/model/neo_checkbox_item_model.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';

class NeoCheckbox extends StatefulWidget {
  final NeoCheckboxItemModel itemModel;
  final double checkboxSpacing;
  final EdgeInsetsDirectional padding;

  const NeoCheckbox({
    required this.itemModel,
    this.checkboxSpacing = NeoDimens.px8,
    this.padding = EdgeInsetsDirectional.zero,
    super.key,
  });

  @override
  State<NeoCheckbox> createState() => _NeoCheckboxState();
}

class _NeoCheckboxState extends State<NeoCheckbox> {
  late bool isSelected = widget.itemModel.initialValue;

  @override
  void initState() {
    super.initState();
    _onValueChange(context, isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: NeoDimens.px20,
          width: NeoDimens.px20,
          child: Checkbox(
            value: isSelected,
            fillColor: MaterialStateColor.resolveWith(
              (states) => isSelected ? NeoColors.bgDarker : Colors.transparent,
            ),
            onChanged: (checkboxValue) {
              _onValueChange(context, checkboxValue.orFalse);
            },
          ),
        ).padding(EdgeInsetsDirectional.only(end: widget.checkboxSpacing)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.itemModel.title.isNotNull)
              NeoText(
                widget.itemModel.title,
                style: NeoTextStyles.labelFourteenMedium,
              ),
            if (widget.itemModel.subtext.isNotNull)
              NeoText(
                widget.itemModel.subtext,
                style: isSelected ? NeoTextStyles.labelFourteenSemibold.copyWith(color: NeoColors.textSecondary) : NeoTextStyles.bodyTwelveMedium,
              ).paddingOnly(top: widget.itemModel.title.isNotNull ? NeoDimens.px4 : NeoDimens.px0),
          ],
        ),
      ],
    ).padding(widget.padding);
  }

  void _onValueChange(BuildContext context, bool value) {
    if (widget.itemModel.dataKey.isNotNull) {
      try {
        context.read<WorkflowFormBloc>().add(WorkflowFormEventAddAllParameters({widget.itemModel.dataKey: value}));
      } catch (e) {
        // No-op
      }
    }
    setState(() {
      isSelected = value;
    });
  }
}
