import 'package:admin/core/localization/language.dart';
import 'package:json_annotation/json_annotation.dart';

import 'bloc/localization_bloc.dart';

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
    switch (language) {
      case Language.turkish:
        return tr;
      case Language.arabic:
        return ar;
      case Language.english:
        return en;
    }
  }
}
