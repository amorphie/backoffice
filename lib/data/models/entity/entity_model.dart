// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:admin/data/models/entity/layouts/display_layout_model.dart';

import 'layouts/create_layout_model.dart';
import 'layouts/delete_layout_model.dart';
import 'layouts/search_layout_model.dart';
import 'layouts/update_layout_model.dart';

class EntityModel {
  String? name;
  SearchLayout? search;
  CreateLayout? create;
  UpdateLayout? update;
  DeleteLayout? delete;
  DisplayLayoutModel? display;

  EntityModel({
    this.name,
    this.search,
    this.create,
    this.update,
    this.delete,
    this.display,
  });

  EntityModel copyWith({
    String? name,
    SearchLayout? search,
    CreateLayout? create,
    UpdateLayout? update,
    DeleteLayout? delete,
    DisplayLayoutModel? display,
  }) {
    return EntityModel(
      name: name ?? this.name,
      search: search ?? this.search,
      create: create ?? this.create,
      update: update ?? this.update,
      delete: delete ?? this.delete,
      display: display ?? this.display,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'search': search?.toMap(),
      'create': create?.toMap(),
      'update': update?.toMap(),
      'delete': delete?.toMap(),
      'display': display?.toMap(),
    };
  }

  factory EntityModel.fromMap(Map<String, dynamic> map) {
    return EntityModel(
      name: map['name'] != null ? map['name'] as String : null,
      search: map['search'] != null ? SearchLayout.fromMap(map['search'] as Map<String, dynamic>) : null,
      create: map['create'] != null ? CreateLayout.fromMap(map['create'] as Map<String, dynamic>) : null,
      update: map['update'] != null ? UpdateLayout.fromMap(map['update'] as Map<String, dynamic>) : null,
      delete: map['delete'] != null ? DeleteLayout.fromMap(map['delete'] as Map<String, dynamic>) : null,
      display: map['display'] != null ? DisplayLayoutModel.fromMap(map['display'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EntityModel.fromJson(String source) => EntityModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EntityModel(name: $name, search: $search, create: $create, update: $update, delete: $delete, display: $display)';
  }

  @override
  bool operator ==(covariant EntityModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.search == search && other.create == create && other.update == update && other.delete == delete && other.display == display;
  }

  @override
  int get hashCode {
    return name.hashCode ^ search.hashCode ^ create.hashCode ^ update.hashCode ^ delete.hashCode ^ display.hashCode;
  }
}
