// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DeleteLayout {
  String url;

  DeleteLayout({
    required this.url,
  });

  DeleteLayout copyWith({
    String? url,
  }) {
    return DeleteLayout(
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
    };
  }

  factory DeleteLayout.fromMap(Map<String, dynamic> map) {
    return DeleteLayout(
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeleteLayout.fromJson(String source) => DeleteLayout.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DeleteLayout(url: $url)';

  @override
  bool operator ==(covariant DeleteLayout other) {
    if (identical(this, other)) return true;

    return other.url == url;
  }

  @override
  int get hashCode => url.hashCode;
}
