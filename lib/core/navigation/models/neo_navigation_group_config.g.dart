// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_navigation_group_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeoNavigationGroupConfig _$NeoNavigationGroupConfigFromJson(
        Map<String, dynamic> json) =>
    NeoNavigationGroupConfig(
      groupList: (json['navigation-groups'] as List<dynamic>?)
              ?.map((e) =>
                  NeoNavigationGroupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
