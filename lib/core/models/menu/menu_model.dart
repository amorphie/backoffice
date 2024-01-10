// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'menu_item_model.dart';

part 'menu_model.g.dart';

@JsonSerializable()
class MenuModel extends Equatable {
  List<MenuItemModel> items;
  MenuModel({
    required this.items,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) => _$MenuModelFromJson(json);
  Map<String, dynamic> toJson() => _$MenuModelToJson(this);
  @override
  List<Object?> get props => [items];

  MenuModel copyWith({
    List<MenuItemModel>? items,
  }) {
    return MenuModel(
      items: items ?? this.items,
    );
  }

  @override
  String toString() => 'MenuModel(items: $items)';

  @override
  bool operator ==(covariant MenuModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.items, items);
  }

  @override
  int get hashCode => items.hashCode;
}
