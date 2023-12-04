// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../ui/helpers/exporter.dart';

class MenuModel {
  List<MenuItemModel> items;
  MenuModel({
    required this.items,
  });

  MenuModel copyWith({
    List<MenuItemModel>? items,
  }) {
    return MenuModel(
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory MenuModel.fromMap(Map<String, dynamic> map) {
    return MenuModel(
      items: List<MenuItemModel>.from(
        (map['items']).map<MenuItemModel>(
          (x) => MenuItemModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuModel.fromJson(String source) => MenuModel.fromMap(json.decode(source) as Map<String, dynamic>);

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
