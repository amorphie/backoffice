import '../../../ui/helpers/exporter.dart';

class HubDataModel {
  String userId;
  String recordId;
  String eventInfo;
  String instanceId;
  String entityName;
  dynamic data;
  DateTime time;
  String state;
  String transition;
  num baseStatus;
  HubNavigationPageModel? page;
  String? message;
  dynamic additionalData;
  String workflowName;
  String viewSource;
  bool requireData;
  String buttonType;
  HubDataModel({
    required this.userId,
    required this.recordId,
    required this.eventInfo,
    required this.instanceId,
    required this.entityName,
    required this.data,
    required this.time,
    required this.state,
    required this.transition,
    required this.baseStatus,
    this.page,
    this.message,
    this.additionalData,
    required this.workflowName,
    required this.viewSource,
    required this.requireData,
    required this.buttonType,
  });

  HubDataModel copyWith({
    String? userId,
    String? recordId,
    String? eventInfo,
    String? instanceId,
    String? entityName,
    dynamic data,
    DateTime? time,
    String? state,
    String? transition,
    num? baseStatus,
    HubNavigationPageModel? page,
    String? message,
    dynamic additionalData,
    String? workflowName,
    String? viewSource,
    bool? requireData,
    String? buttonType,
  }) {
    return HubDataModel(
      userId: userId ?? this.userId,
      recordId: recordId ?? this.recordId,
      eventInfo: eventInfo ?? this.eventInfo,
      instanceId: instanceId ?? this.instanceId,
      entityName: entityName ?? this.entityName,
      data: data ?? this.data,
      time: time ?? this.time,
      state: state ?? this.state,
      transition: transition ?? this.transition,
      baseStatus: baseStatus ?? this.baseStatus,
      page: page ?? this.page,
      message: message ?? this.message,
      additionalData: additionalData ?? this.additionalData,
      workflowName: workflowName ?? this.workflowName,
      viewSource: viewSource ?? this.viewSource,
      requireData: requireData ?? this.requireData,
      buttonType: buttonType ?? this.buttonType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'recordId': recordId,
      'eventInfo': eventInfo,
      'instanceId': instanceId,
      'entityName': entityName,
      'data': data,
      'time': time.toIso8601String(),
      'state': state,
      'transition': transition,
      'baseStatus': baseStatus,
      'page': page?.toMap(),
      'message': message,
      'additionalData': additionalData,
      'workflowName': workflowName,
      'viewSource': viewSource,
      'requireData': requireData,
      'buttonType': buttonType,
    };
  }

  factory HubDataModel.fromMap(Map<String, dynamic> map) {
    return HubDataModel(
      userId: map['userId'] as String,
      recordId: map['recordId'] as String,
      eventInfo: map['eventInfo'] as String,
      instanceId: map['instanceId'] != null ? map['instanceId'] as String : "",
      entityName: map['entityName'] as String,
      data: map['data'] as dynamic,
      time: DateTime.parse(map['time']),
      state: map['state'] as String,
      transition: map['transition'] as String,
      baseStatus: map['baseStatus'] as num,
      page: map['page'] != null ? HubNavigationPageModel.fromMap(map['page'] as Map<String, dynamic>) : null,
      message: map['message'] != null ? map['message'] as String : null,
      additionalData: map['additionalData'] as dynamic,
      workflowName: map['workflowName'] as String,
      viewSource: map['viewSource'] as String,
      requireData: map['requireData'] as bool,
      buttonType: map['buttonType'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HubDataModel.fromJson(String source) => HubDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HubDataModel(userId: $userId, recordId: $recordId, eventInfo: $eventInfo, instanceId: $instanceId, entityName: $entityName, data: $data, time: $time, state: $state, transition: $transition, baseStatus: $baseStatus, page: $page, message: $message, additionalData: $additionalData, workflowName: $workflowName, viewSource: $viewSource, requireData: $requireData, buttonType: $buttonType)';
  }

  @override
  bool operator ==(covariant HubDataModel other) {
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
        other.page == page &&
        other.message == message &&
        other.additionalData == additionalData &&
        other.workflowName == workflowName &&
        other.viewSource == viewSource &&
        other.requireData == requireData &&
        other.buttonType == buttonType;
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
        page.hashCode ^
        message.hashCode ^
        additionalData.hashCode ^
        workflowName.hashCode ^
        viewSource.hashCode ^
        requireData.hashCode ^
        buttonType.hashCode;
  }
}
