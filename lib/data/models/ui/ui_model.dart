// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:admin/data/models/dashboard/dashboard_model.dart';
import 'package:admin/data/models/menu/menu_model.dart';

class UIModel {
  MenuModel leftSidebar;
  DashboardModel dashboard;
  UIModel({
    required this.leftSidebar,
    required this.dashboard,
  });

  UIModel copyWith({
    MenuModel? leftSidebar,
    DashboardModel? dashboard,
  }) {
    return UIModel(
      leftSidebar: leftSidebar ?? this.leftSidebar,
      dashboard: dashboard ?? this.dashboard,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'left_sidebar': leftSidebar.toMap(),
      'dashboard': dashboard.toMap(),
    };
  }

  factory UIModel.fromMap(Map<String, dynamic> map) {
    return UIModel(
      leftSidebar: MenuModel.fromMap(map['left_sidebar'] as Map<String, dynamic>),
      dashboard: DashboardModel.fromMap(map['dashboard'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UIModel.fromJson(String source) => UIModel.fromMap(json.decode(source) as Map<String, dynamic>);

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
