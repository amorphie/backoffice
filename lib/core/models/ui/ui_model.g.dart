// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ui_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UIModel _$UIModelFromJson(Map<String, dynamic> json) => UIModel(
      leftSidebar:
          MenuModel.fromJson(json['leftSidebar'] as Map<String, dynamic>),
      dashboard:
          DashboardModel.fromJson(json['dashboard'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UIModelToJson(UIModel instance) => <String, dynamic>{
      'leftSidebar': instance.leftSidebar,
      'dashboard': instance.dashboard,
    };
