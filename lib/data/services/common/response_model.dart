// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../helpers/exporter.dart';

class ResponseModel {
  int code;
  bool success;
  String message;
  Map<String, dynamic>? errors;
  dynamic data;
  ResponseModel({
    this.code = 200,
    this.success = true,
    this.message = "",
    this.data,
    this.errors,
  });

  ResponseModel copyWith({
    int? code,
    bool? error,
    String? message,
    dynamic data,
    Map<String, dynamic>? errors,
  }) {
    return ResponseModel(
      code: code ?? this.code,
      success: error ?? this.success,
      errors: errors ?? this.errors,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'error': success,
      'errors': errors,
      'message': message,
      'data': data,
    };
  }

  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    int code = map['code'] as int;

    map.remove("code");
    return ResponseModel(
      code: code,
      success: map['error'] as bool,
      errors: map['errors'] as Map<String, dynamic>,
      message: map['message'] as String,
      data: map,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseModel.fromJson(String source) => ResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResponseModel(code: $code, error: $success, errors:$errors, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResponseModel && other.code == code && other.success == success && other.errors == errors && other.message == message && mapEquals(other.data, data);
  }

  @override
  int get hashCode {
    return code.hashCode ^ success.hashCode ^ message.hashCode ^ data.hashCode ^ errors.hashCode;
  }
}
