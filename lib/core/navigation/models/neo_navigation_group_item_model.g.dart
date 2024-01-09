// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_navigation_group_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeoNavigationGroupItemModel _$NeoNavigationGroupItemModelFromJson(
        Map<String, dynamic> json) =>
    NeoNavigationGroupItemModel(
      displayName: json['display'] as String? ?? '',
      iconUrn: json['icon'] as String? ?? '',
      priority: json['priority'] as int? ?? 0,
      key: json['key'] as String? ?? '',
      action: json['action'] as String? ?? '',
      navigationPath: json['navigation-path'] as String? ?? '',
      audience: json['audience'] == null
          ? []
          : parseAudienceFromJson(json['audience'] as List),
      isNew: json['is-new'] as bool? ?? false,
      filter: json['filter'] as Map<String, dynamic>? ?? {},
      parameters: (json['parameters'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          [],
    );
