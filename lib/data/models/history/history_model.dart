// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../helpers/exporter.dart';

class HistoryModel {
  String? id;
  String name;
  String fromState;
  String toState;
  String? formSchema;
  List<HistoryEventsModel>? events;
  HistorySubmitDataModel? submitData;
  HistoryResponseDataModel? responseData;
  DateTime calledAt;
  String? completedAt;
  String calledBy;
  HistoryModel({
    this.id,
    required this.name,
    required this.fromState,
    required this.toState,
    this.formSchema,
    this.events,
    this.submitData,
    this.responseData,
    required this.calledAt,
    this.completedAt,
    required this.calledBy,
  });

  HistoryModel copyWith({
    String? id,
    String? name,
    String? fromState,
    String? toState,
    String? formSchema,
    List<HistoryEventsModel>? events,
    HistorySubmitDataModel? submitData,
    HistoryResponseDataModel? responseData,
    DateTime? calledAt,
    String? completedAt,
    String? calledBy,
  }) {
    return HistoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      fromState: fromState ?? this.fromState,
      toState: toState ?? this.toState,
      formSchema: formSchema ?? this.formSchema,
      events: events ?? this.events,
      submitData: submitData ?? this.submitData,
      responseData: responseData ?? this.responseData,
      calledAt: calledAt ?? this.calledAt,
      completedAt: completedAt ?? this.completedAt,
      calledBy: calledBy ?? this.calledBy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'fromState': fromState,
      'toState': toState,
      'formSchema': formSchema,
      'events': events?.map((x) => x.toMap()).toList(),
      'submitData': submitData?.toMap(),
      'responseData': responseData?.toMap(),
      'calledAt': calledAt.toIso8601String(),
      'completedAt': completedAt,
      'calledBy': calledBy,
    };
  }

  factory HistoryModel.fromMap(Map<String, dynamic> map) {
    return HistoryModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] as String,
      fromState: map['fromState'] as String,
      toState: map['toState'] as String,
      formSchema: map['formSchema'] != null ? map['formSchema'] as String : null,
      events: map['events'] != null
          ? List<HistoryEventsModel>.from(
              (map['events']).map<HistoryEventsModel?>(
                (x) => HistoryEventsModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      submitData: map['submitData'] != null ? HistorySubmitDataModel.fromMap(map['submitData'] as Map<String, dynamic>) : null,
      responseData: map['responseData'] != null ? HistoryResponseDataModel.fromMap(map['responseData'] as Map<String, dynamic>) : null,
      calledAt: DateTime.parse(map['calledAt']),
      completedAt: map['completedAt'] != null ? map['completedAt'] as String : null,
      calledBy: map['calledBy'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryModel.fromJson(String source) => HistoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HistoryModel(id: $id, name: $name, fromState: $fromState, toState: $toState, formSchema: $formSchema, events: $events, submitData: $submitData, responseData: $responseData, calledAt: $calledAt, completedAt: $completedAt, calledBy: $calledBy)';
  }

  @override
  bool operator ==(covariant HistoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.fromState == fromState &&
        other.toState == toState &&
        other.formSchema == formSchema &&
        listEquals(other.events, events) &&
        other.submitData == submitData &&
        other.responseData == responseData &&
        other.calledAt == calledAt &&
        other.completedAt == completedAt &&
        other.calledBy == calledBy;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        fromState.hashCode ^
        toState.hashCode ^
        formSchema.hashCode ^
        events.hashCode ^
        submitData.hashCode ^
        responseData.hashCode ^
        calledAt.hashCode ^
        completedAt.hashCode ^
        calledBy.hashCode;
  }
}
