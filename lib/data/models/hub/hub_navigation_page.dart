// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HubNavigationPageModel {
  String operation;
  String type;
  int timeout;
  _LangModel? pageRoute;
  HubNavigationPageModel({
    required this.operation,
    required this.type,
    required this.timeout,
    this.pageRoute,
  });

  HubNavigationPageModel copyWith({
    String? operation,
    String? type,
    int? timeout,
    _LangModel? pageRoute,
  }) {
    return HubNavigationPageModel(
      operation: operation ?? this.operation,
      type: type ?? this.type,
      timeout: timeout ?? this.timeout,
      pageRoute: pageRoute ?? this.pageRoute,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'operation': operation,
      'type': type,
      'timeout': timeout,
      'pageRoute': pageRoute?.toMap(),
    };
  }

  factory HubNavigationPageModel.fromMap(Map<String, dynamic> map) {
    return HubNavigationPageModel(
      operation: map['operation'].toString(),
      type: map['type'].toString(),
      timeout: map['timeout'] as int,
      pageRoute: map['pageRoute'] != null ? _LangModel.fromMap(map['pageRoute'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HubNavigationPageModel.fromJson(String source) => HubNavigationPageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HubNavigationPageModel(operation: $operation, type: $type, timeout: $timeout, pageRoute: $pageRoute)';
  }

  @override
  bool operator ==(covariant HubNavigationPageModel other) {
    if (identical(this, other)) return true;

    return other.operation == operation && other.type == type && other.timeout == timeout && other.pageRoute == pageRoute;
  }

  @override
  int get hashCode {
    return operation.hashCode ^ type.hashCode ^ timeout.hashCode ^ pageRoute.hashCode;
  }
}

class _LangModel {
  String language;
  String label;
  _LangModel({
    required this.language,
    required this.label,
  });

  _LangModel copyWith({
    String? language,
    String? label,
  }) {
    return _LangModel(
      language: language ?? this.language,
      label: label ?? this.label,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'language': language,
      'label': label,
    };
  }

  factory _LangModel.fromMap(Map<String, dynamic> map) {
    return _LangModel(
      language: map['language'] as String,
      label: map['label'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory _LangModel.fromJson(String source) => _LangModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => '_LangModel(language: $language, label: $label)';

  @override
  bool operator ==(covariant _LangModel other) {
    if (identical(this, other)) return true;

    return other.language == language && other.label == label;
  }

  @override
  int get hashCode => language.hashCode ^ label.hashCode;
}
