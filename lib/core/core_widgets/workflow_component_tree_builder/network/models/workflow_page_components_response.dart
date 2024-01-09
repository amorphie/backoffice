import 'package:json_annotation/json_annotation.dart';

part 'workflow_page_components_response.g.dart';

@JsonSerializable(createToJson: false)
class WorkflowPageComponentsResponse {
  @JsonKey(name: "stateManager", defaultValue: {})
  final Map<String, dynamic> stateManager;

  factory WorkflowPageComponentsResponse.fromJson(Map<String, dynamic> json) =>
      _$WorkflowPageComponentsResponseFromJson(json);

  WorkflowPageComponentsResponse({
    required this.stateManager,
  });
}
