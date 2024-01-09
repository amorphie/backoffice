/*
 * neo_bank
 *
 * Created on 27/11/2023.
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
import 'package:backoffice/reusable_widgets/neo_navigation_group_widget/widgets/neo_navigation_group_item_widget.dart';
import 'package:backoffice/util/neo_util.dart';

abstract class _Constants {
  static const int defaultCrossAxisCount = 3;
}

class DisplayNeoNavigationGroupBottomSheet {
  void call({
    required BuildContext context,
    required String navigationGroupKey,
    int crossAxisCount = _Constants.defaultCrossAxisCount,
  }) {
    final neoNavigationGroupConfig = GetIt.I<NeoNavigationGroupConfig>();

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(NeoDimens.px24))),
      builder: (BuildContext context) {
        return Column(
          children: [
            _buildDragIndicator(),
            FutureBuilder<List<NeoNavigationGroupItemModel>>(
              future: neoNavigationGroupConfig.getNavigationGroupByKey(navigationGroupKey).getItemListToDisplay(),
              builder: (context, snapshot) {
                final itemList = snapshot.hasData ? (snapshot.data ?? []) : <NeoNavigationGroupItemModel>[];
                return _buildNavigationItemsGridView(itemList: itemList, crossAxisCount: crossAxisCount);
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildNavigationItemsGridView({
    required List<NeoNavigationGroupItemModel> itemList,
    required int crossAxisCount,
  }) {
    return Expanded(
      child: GridView.count(
        primary: false,
        crossAxisCount: crossAxisCount,
        padding: const EdgeInsets.all(NeoDimens.px16),
        children: [
          ...itemList.map((itemModel) => NeoNavigationGroupItemWidget(model: itemModel)),
        ],
      ),
    );
  }

  Widget _buildDragIndicator() {
    return Container(
      color: NeoColors.iconDefault.withOpacity(0.1),
      width: 60,
      height: NeoDimens.px4,
    ).paddingOnly(top: NeoDimens.px16);
  }
}
