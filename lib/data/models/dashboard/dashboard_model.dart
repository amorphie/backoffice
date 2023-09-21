// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:admin/data/models/dashboard/dashboard_item_model.dart';

class DashboardModel {
  List<DashboardItemModel> items;
  DashboardModel({
    required this.items,
  });

  DashboardModel copyWith({
    List<DashboardItemModel>? items,
  }) {
    return DashboardModel(
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory DashboardModel.fromMap(Map<String, dynamic> map) {
    return DashboardModel(
      items: List<DashboardItemModel>.from(
        (map['items']).map<DashboardItemModel>(
          (x) => DashboardItemModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory DashboardModel.fromJson(String source) => DashboardModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DashboardModel(items: $items)';

  @override
  bool operator ==(covariant DashboardModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.items, items);
  }

  @override
  int get hashCode => items.hashCode;
}
