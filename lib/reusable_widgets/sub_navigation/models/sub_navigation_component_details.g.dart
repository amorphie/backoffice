// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_navigation_component_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubNavigationComponentDetails _$SubNavigationComponentDetailsFromJson(
        Map<String, dynamic> json) =>
    SubNavigationComponentDetails(
      displayName: json['displayName'] as String,
      icon: json['icon'] as String? ?? '',
      navigateTo: json['page'] as String? ?? '',
      navigationType: $enumDecodeNullable(
              _$NeoNavigationTypeEnumMap, json['navigationType']) ??
          NeoNavigationType.push,
      displayNewBadge: json['new'] as bool? ?? false,
      active: json['active'] as bool? ?? false,
    );

const _$NeoNavigationTypeEnumMap = {
  NeoNavigationType.popUntil: 'pop-until',
  NeoNavigationType.push: 'push',
  NeoNavigationType.pushReplacement: 'push-replacement',
  NeoNavigationType.pushAsRoot: 'push-as-root',
  NeoNavigationType.popup: 'popup',
  NeoNavigationType.bottomSheet: 'bottom-sheet',
  NeoNavigationType.pop: 'pop',
};
