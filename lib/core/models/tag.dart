// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserTags {
  int id;
  String tag;
  UserTags({
    required this.id,
    required this.tag,
  });

  UserTags copyWith({
    int? id,
    String? tag,
  }) {
    return UserTags(
      id: id ?? this.id,
      tag: tag ?? this.tag,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'tag': tag,
    };
  }

  factory UserTags.fromMap(Map<String, dynamic> map) {
    return UserTags(
      id: map['id'] as int,
      tag: map['tag'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserTags.fromJson(String source) =>
      UserTags.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserTags(id: $id, tag: $tag)';

  @override
  bool operator ==(covariant UserTags other) {
    if (identical(this, other)) return true;

    return other.id == id && other.tag == tag;
  }

  @override
  int get hashCode => id.hashCode ^ tag.hashCode;
}
