/*
 * neo_ui
 *
 * Created on 22/11/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:backoffice/core/navigation/models/neo_navigation_group_item_model.dart';
import 'package:backoffice/core/navigation/models/neo_navigation_group_model.dart';
import 'package:backoffice/core/navigation/models/neo_navigation_item_audience.dart';

part 'neo_navigation_group_config.g.dart';

@JsonSerializable(createToJson: false)
class NeoNavigationGroupConfig {
  @JsonKey(name: "navigation-groups", defaultValue: [])
  final List<NeoNavigationGroupModel> groupList;

  NeoNavigationGroupConfig({required this.groupList});

  factory NeoNavigationGroupConfig.fromJson(Map<String, dynamic> json) => _$NeoNavigationGroupConfigFromJson(json);

  NeoNavigationGroupModel getNavigationGroupByKey(String key) {
    return groupList.firstWhereOrNull((navigationGroup) => navigationGroup.key == key) ?? NeoNavigationGroupModel(key: key, itemList: []);
  }

  Future<bool> isLoginRequired(String navigationPath) async {
    final navigationItem = groupList.map((element) => element.itemList).reduce((value, element) => value + element).firstWhereOrNull(
          (element) => element.navigationPath.isNotEmpty && navigationPath.contains(element.navigationPath),
        );
    if (navigationItem == null) {
      return true;
    }
    final twoFactorAuthRequirement = navigationItem.audience.contains(NeoNavigationItemAudience.twoFactorAuth);
    final isAvailableBy2FA = await navigationItem.isAvailableBy2FA;
    return twoFactorAuthRequirement && isAvailableBy2FA;
  }
}
