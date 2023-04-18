
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TransitionsModel {
  String? name;
  String? title;
  String? form;
  TransitionsModel({
    this.name,
    this.title,
    this.form,
  });

  TransitionsModel copyWith({
    String? name,
    String? title,
    String? form,
  }) {
    return TransitionsModel(
      name: name ?? this.name,
      title: title ?? this.title,
      form: form ?? this.form,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'title': title,
      'form': form,
    };
  }

  factory TransitionsModel.fromMap(Map<String, dynamic> map) {
    return TransitionsModel(
      name: map['name'] != null ? map['name'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      form: map['form'] != null ? map['form'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransitionsModel.fromJson(String source) =>
      TransitionsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TransitionsModel(name: $name, title: $title, form: $form)';

  @override
  bool operator ==(covariant TransitionsModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.title == title && other.form == form;
  }

  @override
  int get hashCode => name.hashCode ^ title.hashCode ^ form.hashCode;
}
