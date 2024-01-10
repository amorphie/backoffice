// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuItemModel _$MenuItemModelFromJson(Map<String, dynamic> json) =>
    MenuItemModel(
      type: $enumDecode(_$MenuItemTypeEnumMap, json['type']),
      title: json['title'] == null
          ? null
          : TitleModel.fromJson(json['title'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => MenuItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      entity: json['entity'] as String?,
      searchLayout:
          $enumDecodeNullable(_$UISearchLayoutEnumMap, json['search-layout']) ??
              UISearchLayout.none,
      displayLayout: $enumDecodeNullable(
              _$UIDisplayLayoutEnumMap, json['display-layout']) ??
          UIDisplayLayout.none,
      query: json['query'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MenuItemModelToJson(MenuItemModel instance) =>
    <String, dynamic>{
      'type': _$MenuItemTypeEnumMap[instance.type]!,
      'title': instance.title,
      'items': instance.items,
      'entity': instance.entity,
      'search-layout': _$UISearchLayoutEnumMap[instance.searchLayout]!,
      'display-layout': _$UIDisplayLayoutEnumMap[instance.displayLayout]!,
      'query': instance.query,
    };

const _$MenuItemTypeEnumMap = {
  MenuItemType.none: 'none',
  MenuItemType.profile: 'profile',
  MenuItemType.workflow: 'workflow',
  MenuItemType.entity: 'entity',
  MenuItemType.group: 'group',
  MenuItemType.divider: 'divider',
  MenuItemType.query: 'query',
};

const _$UISearchLayoutEnumMap = {
  UISearchLayout.full: 'full',
  UISearchLayout.none: 'none',
};

const _$UIDisplayLayoutEnumMap = {
  UIDisplayLayout.compact: 'compact',
  UIDisplayLayout.none: 'none',
};
