// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../history/history_detail/alt_models/transition_model.dart';

class HistoryWorkFlowModel {
  String? instanceId;
  String? name;
  List<TransitionModel>? transitions;
  HistoryWorkFlowModel({
    this.instanceId,
    this.name,
    this.transitions,
  });

  HistoryWorkFlowModel copyWith({
    String? instanceId,
    String? name,
    List<TransitionModel>? transitions,
  }) {
    return HistoryWorkFlowModel(
      instanceId: instanceId ?? this.instanceId,
      name: name ?? this.name,
      transitions: transitions ?? this.transitions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'instanceId': instanceId,
      'name': name,
      'transitions': transitions?.map((x) => x.toMap()).toList(),
    };
  }

  factory HistoryWorkFlowModel.fromMap(Map<String, dynamic> map) {
    return HistoryWorkFlowModel(
      instanceId: map['instanceId'] != null ? map['instanceId'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      transitions: map['transitions'] != null
          ? List<TransitionModel>.from(
              (map['transitions'] as List<int>).map<TransitionModel?>(
                (x) => TransitionModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryWorkFlowModel.fromJson(String source) => HistoryWorkFlowModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'HistoryWorkFlowModel(instanceId: $instanceId, name: $name, transitions: $transitions)';

  @override
  bool operator ==(covariant HistoryWorkFlowModel other) {
    if (identical(this, other)) return true;

    return other.instanceId == instanceId && other.name == name && listEquals(other.transitions, transitions);
  }

  @override
  int get hashCode => instanceId.hashCode ^ name.hashCode ^ transitions.hashCode;
}
