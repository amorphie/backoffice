// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'layouts/display_layout_model.dart';
import 'layouts/search_layout_model.dart';
import 'layouts/ui_workflow_model.dart';

part 'entity_model.g.dart';

@JsonSerializable()
class EntityModel extends Equatable {
  String name;
  UIWorkflowModel workflow;
  SearchLayout search;
  DisplayLayoutModel? display;
  EntityModel({
    required this.name,
    required this.workflow,
    required this.search,
    this.display,
  });

  factory EntityModel.fromJson(Map<String, dynamic> json) => _$EntityModelFromJson(json);
  Map<String, dynamic> toJson() => _$EntityModelToJson(this);
  @override
  List<Object?> get props => [name, workflow, search, display];

  factory EntityModel.init() => EntityModel(name: "", workflow: UIWorkflowModel.init(), search: SearchLayout.init());
  bool get hasFilter => search.filter != null;

  EntityModel copyWith({
    String? name,
    UIWorkflowModel? workflow,
    SearchLayout? search,
    DisplayLayoutModel? display,
  }) {
    return EntityModel(
      name: name ?? this.name,
      workflow: workflow ?? this.workflow,
      search: search ?? this.search,
      display: display ?? this.display,
    );
  }

  @override
  String toString() {
    return 'EntityModel(name: $name, workflow: $workflow, search: $search, display: $display)';
  }

  @override
  bool operator ==(covariant EntityModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.workflow == workflow && other.search == search && other.display == display;
  }

  @override
  int get hashCode {
    return name.hashCode ^ workflow.hashCode ^ search.hashCode ^ display.hashCode;
  }
}
