/*
 * neo_bank
 *
 * Created on 4/12/2023.
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

part 'neo_navigation_group_model.g.dart';

@JsonSerializable(createToJson: false)
class NeoNavigationGroupModel {
  @JsonKey(name: "key", defaultValue: "")
  final String key;

  @JsonKey(name: "items", defaultValue: [])
  final List<NeoNavigationGroupItemModel> itemList;

  NeoNavigationGroupModel({
    required this.key,
    required this.itemList,
  });

  factory NeoNavigationGroupModel.fromJson(Map<String, dynamic> json) => _$NeoNavigationGroupModelFromJson(json);
}

extension NeoNavigationGroupModelExtension on NeoNavigationGroupModel {
  Future<List<NeoNavigationGroupItemModel>> getItemListToDisplay() async {
    final sortedList = itemList.sorted((a, b) => a.priority.compareTo(b.priority)).reversed.toList();
    final filteredList = await Stream.fromIterable(sortedList).asyncMap((item) async {
      return (await item.isAvailableByAudience) && (await item.isAvailableByFilter) ? item : null;
    }).toList();
    return filteredList.whereNotNull().toList();
  }
}
