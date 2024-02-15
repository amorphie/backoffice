/*
 * neo_bank
 *
 * Created on 2/2/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_divider/neo_divider.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:backoffice/util/wf_data_bus_key.dart';
import 'package:backoffice/workflow_widgets/wf_transaction_summary_list/models/wf_transaction_summary_item_model.dart';
import 'package:backoffice/workflow_widgets/wf_transaction_summary_list/models/wf_transaction_summary_list_ui_model.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';

class WfTransactionSummaryList extends StatelessWidget {
  WfTransactionSummaryList({
    Color? titleColor,
    Color? valueColor,
    Color? dividerColor,
    this.titleStyle = "bodyTwelveMedium",
    this.valueStyle = "bodyFourteenSemibold",
    this.dividerHeight = 1.0,
    this.padding = const EdgeInsetsDirectional.all(NeoDimens.px16),
    super.key,
  })  : titleColor = titleColor ?? NeoColors.textPlaceholder,
        valueColor = valueColor ?? NeoColors.textDefault,
        dividerColor = dividerColor ?? NeoColors.borderMediumLight;

  List<WfTransactionSummaryItemModel> getItemList(BuildContext context) {
    return WfTransactionSummaryListUiModel.fromJson(
      context.read<WorkflowFormBloc>().formData[WfDataBusKey.transactionSummaryListUiModel],
    ).itemList;
  }

  final String titleStyle;
  final Color titleColor;
  final String valueStyle;
  final Color valueColor;
  final double dividerHeight;
  final Color dividerColor;
  final EdgeInsetsDirectional padding;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: NeoColors.baseWhite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _getContentWidgetList(context),
      ).padding(padding),
    );
  }

  List<Widget> _getContentWidgetList(BuildContext context) {
    final widgetList = <Widget>[];
    final itemList = getItemList(context);
    itemList.forEachIndexed((index, item) {
      final isFirstItem = index == 0;
      final isLastItem = index == itemList.length - 1;
      widgetList
        ..add(
          NeoText(item.title, style: NeoTextStyles.fromString(titleStyle).apply(color: titleColor)).paddingOnly(top: isFirstItem ? 0 : NeoDimens.px16),
        )
        ..add(
          NeoText(item.value, style: NeoTextStyles.fromString(valueStyle).apply(color: valueColor)).paddingOnly(top: NeoDimens.px4, bottom: isLastItem ? 0 : NeoDimens.px16),
        );
      if (!isLastItem) {
        widgetList.add(NeoDivider(height: dividerHeight, color: dividerColor));
      }
    });
    return widgetList;
  }
}
