// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_navigation_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeoNavigationGroupModel _$NeoNavigationGroupModelFromJson(
        Map<String, dynamic> json) =>
    NeoNavigationGroupModel(
      key: json['key'] as String? ?? '',
      itemList: (json['items'] as List<dynamic>?)
              ?.map((e) => NeoNavigationGroupItemModel.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );
