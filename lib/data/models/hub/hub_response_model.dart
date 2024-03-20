import 'package:admin/ui/helpers/exporter.dart';

class HubResponseModel {
  String id;
  String source;
  String type;
  String subject;
  HubDataModel data;
  HubResponseModel({
    required this.id,
    required this.source,
    required this.type,
    required this.subject,
    required this.data,
  });

  HubResponseModel copyWith({
    String? id,
    String? source,
    String? type,
    String? subject,
    HubDataModel? data,
  }) {
    return HubResponseModel(
      id: id ?? this.id,
      source: source ?? this.source,
      type: type ?? this.type,
      subject: subject ?? this.subject,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'source': source,
      'type': type,
      'subject': subject,
      'data': data.toMap(),
    };
  }

  factory HubResponseModel.fromMap(Map<String, dynamic> map) {
    return HubResponseModel(
      id: map['id'] as String,
      source: map['source'] as String,
      type: map['type'] as String,
      subject: map['subject'] as String,
      data: HubDataModel.fromMap(map['data'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory HubResponseModel.fromJson(String source) => HubResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HubResponseModel(id: $id, source: $source, type: $type, subject: $subject, data: $data)';
  }

  @override
  bool operator ==(covariant HubResponseModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.source == source && other.type == type && other.subject == subject && other.data == data;
  }

  @override
  int get hashCode {
    return id.hashCode ^ source.hashCode ^ type.hashCode ^ subject.hashCode ^ data.hashCode;
  }
}
