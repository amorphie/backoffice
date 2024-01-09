import 'package:json_annotation/json_annotation.dart';
import 'package:backoffice/core/localization/bloc/localization_bloc.dart';
import 'package:backoffice/core/localization/language.dart';

part 'localizable_text.g.dart';

@JsonSerializable(createToJson: false)
class LocalizableText {
  @JsonKey(name: "tr-TR", defaultValue: "")
  final String tr;

  @JsonKey(name: "en-EN", defaultValue: "")
  final String en;

  @JsonKey(name: "ar-AR", defaultValue: "")
  final String ar;

  const LocalizableText({required this.tr, required this.en, required this.ar});

  factory LocalizableText.fromJson(Map<String, dynamic> json) => _$LocalizableTextFromJson(json);

  String localize() {
    final currentLanguage = LocalizationBloc.currentLanguage;
    return _getLocalizedText(currentLanguage ?? Language.defaultLanguage);
  }

  String _getLocalizedText(Language language) {
    return switch (language) {
      Language.turkish => tr,
      Language.arabic => ar,
      Language.english => en,
    };
  }
}
