// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'workflow_instance_view_model.g.dart';

@JsonSerializable()
class WorkflowInstanceViewModel {
  String name;
  String type;
  String language;
  String navigation;
  String data;
  String body;
  WorkflowInstanceViewModel({
    required this.name,
    required this.type,
    required this.language,
    required this.navigation,
    required this.data,
    required this.body,
  });

  factory WorkflowInstanceViewModel.init() => WorkflowInstanceViewModel(
        name: "",
        type: "",
        language: "",
        navigation: "",
        data: "",
        body: "",
      );

  factory WorkflowInstanceViewModel.fromJson(Map<String, dynamic> json) => _$WorkflowInstanceViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkflowInstanceViewModelToJson(this);
}
