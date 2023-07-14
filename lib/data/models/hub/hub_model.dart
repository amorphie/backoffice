// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HubModel {
  String userId;
  String recordId;
  String eventInfo;
  String instanceId;
  dynamic data;
  DateTime time;
  String state;
  String transition;
  num baseStatus;
  String? page;
  HubModel({
    required this.userId,
    required this.recordId,
    required this.eventInfo,
    required this.instanceId,
    required this.data,
    required this.time,
    required this.state,
    required this.transition,
    required this.baseStatus,
    this.page,
  });

  HubModel copyWith({
    String? userId,
    String? recordId,
    String? eventInfo,
    String? instanceId,
    dynamic data,
    DateTime? time,
    String? state,
    String? transition,
    num? baseStatus,
    String? page,
  }) {
    return HubModel(
      userId: userId ?? this.userId,
      recordId: recordId ?? this.recordId,
      eventInfo: eventInfo ?? this.eventInfo,
      instanceId: instanceId ?? this.instanceId,
      data: data ?? this.data,
      time: time ?? this.time,
      state: state ?? this.state,
      transition: transition ?? this.transition,
      baseStatus: baseStatus ?? this.baseStatus,
      page: page ?? this.page,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'UserId': userId,
      'recordId': recordId,
      'eventInfo': eventInfo,
      'instanceId': instanceId,
      'data': data,
      'time': time.toIso8601String(),
      'state': state,
      'transition': transition,
      'baseStatus': baseStatus,
      'page': page,
    };
  }

  factory HubModel.fromMap(Map<String, dynamic> map) {
    return HubModel(
      userId: map['UserId'] as String,
      recordId: map['recordId'] as String,
      eventInfo: map['eventInfo'] as String,
      instanceId: map['instanceId'] as String,
      data: map['data'] as dynamic,
      time: DateTime.parse(map['time']),
      state: map['state'] as String,
      transition: map['transition'] as String,
      baseStatus: map['baseStatus'] as num,
      page: map['page'] != null ? map['page'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HubModel.fromJson(String source) => HubModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HubModel(UserId: $userId, recordId: $recordId, eventInfo: $eventInfo, instanceId: $instanceId, data: $data, time: $time, state: $state, transition: $transition, baseStatus: $baseStatus, page: $page)';
  }

  @override
  bool operator ==(covariant HubModel other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.recordId == recordId &&
        other.eventInfo == eventInfo &&
        other.instanceId == instanceId &&
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
        data.hashCode ^
        time.hashCode ^
        state.hashCode ^
        transition.hashCode ^
        baseStatus.hashCode ^
        page.hashCode;
  }
}
