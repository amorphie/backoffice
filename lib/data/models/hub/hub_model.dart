// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../helpers/exporter.dart';

class HubModel {
  String userId;
  String recordId;
  String eventInfo;
  String? entityName;
  String instanceId;
  dynamic data;
  DateTime time;
  String state;
  String transition;
  num baseStatus;
  HubNavigationPageModel? page;
  String? message;
  dynamic additionalData;
  String workflowName;

  HubModel({
    required this.userId,
    required this.recordId,
    required this.eventInfo,
    this.entityName,
    required this.instanceId,
    required this.data,
    required this.time,
    required this.state,
    required this.transition,
    required this.baseStatus,
    this.page,
    this.message,
    this.additionalData,
    required this.workflowName,
  });

  HubModel copyWith({
    String? userId,
    String? recordId,
    String? eventInfo,
    String? entityName,
    String? instanceId,
    dynamic data,
    DateTime? time,
    String? state,
    String? transition,
    num? baseStatus,
    HubNavigationPageModel? page,
    String? message,
    dynamic additionalData,
    String? workflowName,
  }) {
    return HubModel(
      userId: userId ?? this.userId,
      recordId: recordId ?? this.recordId,
      eventInfo: eventInfo ?? this.eventInfo,
      entityName: entityName ?? this.entityName,
      instanceId: instanceId ?? this.instanceId,
      data: data ?? this.data,
      time: time ?? this.time,
      state: state ?? this.state,
      transition: transition ?? this.transition,
      baseStatus: baseStatus ?? this.baseStatus,
      page: page ?? this.page,
      message: message ?? this.message,
      additionalData: additionalData ?? this.additionalData,
      workflowName: workflowName ?? this.workflowName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'UserId': userId,
      'recordId': recordId,
      'eventInfo': eventInfo,
      'entityName': entityName,
      'instanceId': instanceId,
      'data': data,
      'time': time.toIso8601String(),
      'state': state,
      'transition': transition,
      'baseStatus': baseStatus,
      'page': page?.toMap(),
      'message': message,
      'additionalData': additionalData,
      'workflowName': workflowName,
    };
  }

  factory HubModel.fromMap(Map<String, dynamic> map) {
    try {
      return HubModel(
        userId: map['UserId'] as String,
        recordId: map['recordId'] as String,
        eventInfo: map['eventInfo'] as String,
        instanceId: map['instanceId'] as String,
        entityName: map['entityName'],
        data: map['data'] as dynamic,
        time: DateTime.parse(map['time']),
        state: map['state'] as String,
        transition: map['transition'] as String,
        baseStatus: map['baseStatus'] as num,
        page: map['page'] != null ? HubNavigationPageModel.fromMap(map['page']) : null,
        message: map["message"] != null ? map["message"] : null,
        additionalData: map["additionalData"] != null ? map["additionalData"] : null,
        workflowName: map["workflowName"] != null ? map["workflowName"] : null,
      );
    } catch (e) {
      return HubModel(
        userId: map['UserId'] as String,
        recordId: map['recordId'] as String,
        eventInfo: map['eventInfo'] as String,
        entityName: map['entityName'],
        instanceId: map['instanceId'] as String,
        data: map['data'] as dynamic,
        time: DateTime.parse(map['time']),
        state: map['state'] as String,
        transition: map['transition'] as String,
        baseStatus: map['baseStatus'] as num,
        page: map['page'] != null ? HubNavigationPageModel.fromMap(map['page']) : null,
        message: map["message"] != null ? map["message"] : null,
        additionalData: map["additionalData"] != null ? map["additionalData"] : null,
        workflowName: map["workflowName"] != null ? map["workflowName"] : null,
      );
    }
  }

  String toJson() => json.encode(toMap());

  factory HubModel.fromJson(String source) => HubModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HubModel(UserId: $userId, recordId: $recordId, eventInfo: $eventInfo, entityName: $entityName, instanceId: $instanceId, data: $data, time: $time, state: $state, transition: $transition, baseStatus: $baseStatus, page: $page)';
  }

  @override
  bool operator ==(covariant HubModel other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.recordId == recordId &&
        other.eventInfo == eventInfo &&
        other.instanceId == instanceId &&
        other.entityName == entityName &&
        other.data == data &&
        other.time == time &&
        other.state == state &&
        other.transition == transition &&
        other.baseStatus == baseStatus &&
        other.page == page;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        recordId.hashCode ^
        eventInfo.hashCode ^
        instanceId.hashCode ^
        entityName.hashCode ^
        data.hashCode ^
        time.hashCode ^
        state.hashCode ^
        transition.hashCode ^
        baseStatus.hashCode ^
        page.hashCode;
  }
}
