// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TransitionModel {
  String? name;
  String? fromState;
  String? toState;
  String? calledAt;
  String? calledBy;
  String? fromSchema;
  TransitionModel({
    this.name,
    this.fromState,
    this.toState,
    this.calledAt,
    this.calledBy,
    this.fromSchema,
  });

  TransitionModel copyWith({
    String? name,
    String? fromState,
    String? toState,
    String? calledAt,
    String? calledBy,
    String? fromSchema,
  }) {
    return TransitionModel(
      name: name ?? this.name,
      fromState: fromState ?? this.fromState,
      toState: toState ?? this.toState,
      calledAt: calledAt ?? this.calledAt,
      calledBy: calledBy ?? this.calledBy,
      fromSchema: fromSchema ?? this.fromSchema,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'fromState': fromState,
      'toState': toState,
      'calledAt': calledAt,
      'calledBy': calledBy,
      'fromSchema': fromSchema,
    };
  }

  factory TransitionModel.fromMap(Map<String, dynamic> map) {
    return TransitionModel(
      name: map['name'] != null ? map['name'] as String : null,
      fromState: map['fromState'] != null ? map['fromState'] as String : null,
      toState: map['toState'] != null ? map['toState'] as String : null,
      calledAt: map['calledAt'] != null ? map['calledAt'] as String : null,
      calledBy: map['calledBy'] != null ? map['calledBy'] as String : null,
      fromSchema: map['fromSchema'] != null ? map['fromSchema'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransitionModel.fromJson(String source) => TransitionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TranstionModel(name: $name, fromState: $fromState, toState: $toState, calledAt: $calledAt, calledBy: $calledBy, fromSchema: $fromSchema)';
  }

  @override
  bool operator ==(covariant TransitionModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.fromState == fromState &&
        other.toState == toState &&
        other.calledAt == calledAt &&
        other.calledBy == calledBy &&
        other.fromSchema == fromSchema;
  }

  @override
  int get hashCode {
    return name.hashCode ^ fromState.hashCode ^ toState.hashCode ^ calledAt.hashCode ^ calledBy.hashCode ^ fromSchema.hashCode;
  }
}
