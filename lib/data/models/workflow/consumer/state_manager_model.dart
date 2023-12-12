// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../ui/helpers/exporter.dart';
part 'state_manager_model.g.dart';

@JsonSerializable()
class StateManager {
  String name;
  String title;
  @JsonKey(includeIfNull: false)
  List<TransitionModel>? transitions;
  @JsonKey(includeIfNull: false)
  String? status;
  @JsonKey(defaultValue: false)
  bool? isPublicForm;
  @JsonKey(includeIfNull: false)
  String? publicForm;

  StateManager({
    required this.name,
    required this.title,
    this.transitions,
    this.status,
    this.isPublicForm,
    this.publicForm,
  });

  factory StateManager.fromJson(Map<String, dynamic> json) => _$StateManagerFromJson(json);

  Map<String, dynamic> toJson() => _$StateManagerToJson(this);

  StateManager copyWith({
    String? name,
    String? title,
    List<TransitionModel>? transitions,
    String? status,
    bool? isPublicForm,
    String? publicForm,
  }) {
    return StateManager(
      name: name ?? this.name,
      title: title ?? this.title,
      transitions: transitions ?? this.transitions,
      status: status ?? this.status,
      isPublicForm: isPublicForm ?? this.isPublicForm,
      publicForm: publicForm ?? this.publicForm,
    );
  }

  @override
  String toString() {
    return 'StateManager(name: $name, title: $title, transitions: $transitions, status: $status, isPublicForm: $isPublicForm, publicForm: $publicForm)';
  }

  @override
  bool operator ==(covariant StateManager other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.title == title &&
        listEquals(other.transitions, transitions) &&
        other.status == status &&
        other.isPublicForm == isPublicForm &&
        other.publicForm == publicForm;
  }

  @override
  int get hashCode {
    return name.hashCode ^ title.hashCode ^ transitions.hashCode ^ status.hashCode ^ isPublicForm.hashCode ^ publicForm.hashCode;
  }
}
