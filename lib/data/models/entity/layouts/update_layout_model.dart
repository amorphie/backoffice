// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UpdateLayout {
  String workflow;
  String dataUrl;
  UpdateLayout({
    required this.workflow,
    required this.dataUrl,
  });

  UpdateLayout copyWith({
    String? workflow,
    String? dataUrl,
  }) {
    return UpdateLayout(
      workflow: workflow ?? this.workflow,
      dataUrl: dataUrl ?? this.dataUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'workflow': workflow,
      'dataUrl': dataUrl,
    };
  }

  factory UpdateLayout.fromMap(Map<String, dynamic> map) {
    return UpdateLayout(
      workflow: map['workflow'] as String,
      dataUrl: map['dataUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateLayout.fromJson(String source) => UpdateLayout.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UpdateLayout(workflow: $workflow, dataUrl: $dataUrl)';

  @override
  bool operator ==(covariant UpdateLayout other) {
    if (identical(this, other)) return true;

    return other.workflow == workflow && other.dataUrl == dataUrl;
  }

  @override
  int get hashCode => workflow.hashCode ^ dataUrl.hashCode;
}
