// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../dashboard/dashboard_model.dart';
import '../menu/menu_model.dart';
part 'ui_model.g.dart';

@JsonSerializable()
class UIModel extends Equatable {
  MenuModel leftSidebar;
  DashboardModel dashboard;
  UIModel({
    required this.leftSidebar,
    required this.dashboard,
  });

  factory UIModel.fromJson(Map<String, dynamic> json) => _$UIModelFromJson(json);
  Map<String, dynamic> toJson() => _$UIModelToJson(this);
  @override
  List<Object?> get props => [leftSidebar, dashboard];

  UIModel copyWith({
    MenuModel? leftSidebar,
    DashboardModel? dashboard,
  }) {
    return UIModel(
      leftSidebar: leftSidebar ?? this.leftSidebar,
      dashboard: dashboard ?? this.dashboard,
    );
  }

  @override
  String toString() => 'UIModel(left_sidebar: $leftSidebar, dashboard: $dashboard)';

  @override
  bool operator ==(covariant UIModel other) {
    if (identical(this, other)) return true;

    return other.leftSidebar == leftSidebar && other.dashboard == dashboard;
  }

  @override
  int get hashCode => leftSidebar.hashCode ^ dashboard.hashCode;
}
