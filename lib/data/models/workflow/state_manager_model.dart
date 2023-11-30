// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../helpers/exporter.dart';

class StateManager {
  String name;
  String title;
  List<TransitionModel>? transitions;
  String? status;
  bool isPublicForm;
  String? publicForm;
  StateManager({
    required this.name,
    required this.title,
    this.transitions,
    this.status,
    this.isPublicForm = false,
    this.publicForm,
  });

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'title': title,
      'transitions': transitions?.map((x) => x.toMap()).toList(),
      'status': status,
      'isPublicForm': isPublicForm,
      'publicForm': publicForm,
    };
  }

  factory StateManager.fromMap(Map<String, dynamic> map) {
    return StateManager(
      name: map['name'] as String,
      title: map['title'] as String,
      transitions: map['transitions'] != null
          ? List<TransitionModel>.from(
              (map['transitions']).map<TransitionModel?>(
                (x) => TransitionModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      status: map['status'] != null ? map['status'] as String : null,
      isPublicForm: map['isPublicForm'] ?? false,
      publicForm: map['publicForm'] != null ? map['publicForm'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StateManager.fromJson(String source) => StateManager.fromMap(json.decode(source) as Map<String, dynamic>);

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
