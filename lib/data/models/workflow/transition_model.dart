import '../../../ui/helpers/exporter.dart';

class TransitionModel {
  String name;
  String title;
  String form;
  TransitionType type;

  TransitionModel({
    required this.name,
    required this.title,
    required this.form,
    required this.type,
  });

  TransitionModel copyWith({
    String? name,
    String? title,
    String? form,
    TransitionType? type,
  }) {
    return TransitionModel(
      name: name ?? this.name,
      title: title ?? this.title,
      form: form ?? this.form,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'title': title,
      'form': form,
      'type': type.name,
    };
  }

  factory TransitionModel.fromMap(Map<String, dynamic> map) {
    return TransitionModel(
      name: map['name'] as String,
      title: map['title'] as String,
      form: map['form'] as String,
      type: TransitionType.fromMap(map["type"] ?? ""),
    );
  }

  String toJson() => json.encode(toMap());

  factory TransitionModel.fromJson(String source) => TransitionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TransitionModel(name: $name, title: $title, form: $form)';

  @override
  bool operator ==(covariant TransitionModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.title == title && other.form == form;
  }

  @override
  int get hashCode => name.hashCode ^ title.hashCode ^ form.hashCode;
}
