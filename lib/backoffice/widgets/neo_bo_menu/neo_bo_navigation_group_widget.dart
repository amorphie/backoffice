/*
 * neo_bank
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
import 'package:get_it/get_it.dart';
import 'package:backoffice/core/navigation/models/neo_navigation_group_config.dart';
import 'package:backoffice/core/navigation/models/neo_navigation_group_item_model.dart';
import 'package:backoffice/core/navigation/models/neo_navigation_group_model.dart';
import 'package:backoffice/reusable_widgets/neo_navigation_group_widget/usecases/display_neo_navigation_group_bottom_sheet.dart';
import 'package:backoffice/util/neo_util.dart';

import 'widgets/neo_bo_navigation_group_item_widget.dart';

class NeoBackofficeNavigationGroupWidget extends StatelessWidget {
  NeoBackofficeNavigationGroupWidget({
    required this.navigationGroupKey,
    this.titleText = "",
    this.showMoreText = "",
    this.itemCountToDisplay = 3,
    this.padding = const EdgeInsetsDirectional.all(NeoDimens.px16),
    Key? key,
  })  : neoNavigationGroupConfig = GetIt.I<NeoNavigationGroupConfig>(),
        super(key: key);

  final NeoNavigationGroupConfig neoNavigationGroupConfig;
  final String titleText;
  final String showMoreText;
  final String navigationGroupKey;
  final int itemCountToDisplay;
  final EdgeInsetsDirectional padding;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NeoNavigationGroupItemModel>>(
      future: neoNavigationGroupConfig.getNavigationGroupByKey(navigationGroupKey).getItemListToDisplay(),
      builder: (context, snapshot) {
        final itemList = snapshot.hasData ? (snapshot.data ?? []) : [];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(titleText, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                InkWell(
                  onTap: () => DisplayNeoNavigationGroupBottomSheet()(
                    context: context,
                    navigationGroupKey: navigationGroupKey,
                  ),
                  child: Text(
                    showMoreText,
                    style: TextStyle(fontWeight: FontWeight.bold, color: NeoColors.textSuccess),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...itemList.map(
                  (itemModel) => NeoBackofficeNavigationGroupItemWidget(model: itemModel).paddingSymmetric(horizontal: NeoDimens.px12, vertical: NeoDimens.px4),
                ),
              ],
            ).paddingOnly(top: NeoDimens.px8),
          ],
        ).padding(padding);
      },
    );
  }
}
