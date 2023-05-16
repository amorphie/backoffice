// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CreateLayout {
  String workflow;
  CreateLayout({
    required this.workflow,
  });

  CreateLayout copyWith({
    String? workflow,
  }) {
    return CreateLayout(
      workflow: workflow ?? this.workflow,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'workflow': workflow,
    };
  }

  factory CreateLayout.fromMap(Map<String, dynamic> map) {
    return CreateLayout(
      workflow: map['workflow'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateLayout.fromJson(String source) => CreateLayout.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CreateLayout(workflow: $workflow)';

  @override
  bool operator ==(covariant CreateLayout other) {
    if (identical(this, other)) return true;

    return other.workflow == workflow;
  }

  @override
  int get hashCode => workflow.hashCode;
}
