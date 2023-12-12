import '../../../../ui/helpers/exporter.dart';

part 'transition_model.g.dart';

@JsonSerializable()
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

  factory TransitionModel.fromJson(Map<String, dynamic> json) => _$TransitionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransitionModelToJson(this);
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
