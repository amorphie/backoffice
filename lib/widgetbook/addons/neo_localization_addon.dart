import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

// ignore_for_file: deprecated_member_use
class NeoLocalizationAddon extends WidgetbookAddon<Locale> {
  NeoLocalizationAddon({
    required this.locales,
    required this.localizationsDelegates,
    required Locale initialLocale,
    this.onChanged,
  })  : assert(locales.isNotEmpty, 'locales cannot be empty'),
        assert(locales.contains(initialLocale), 'initialLocale must be in locales'),
        super(name: 'Locale', initialSetting: initialLocale);

  final List<Locale> locales;
  final List<LocalizationsDelegate<dynamic>> localizationsDelegates;
  final void Function(Locale)? onChanged;

  @override
  List<Field> get fields {
    return [
      ListField<Locale>(
        name: 'name',
        values: locales,
        initialValue: initialSetting,
        labelBuilder: (locale) => locale.toLanguageTag(),
        onChanged: (context, locale) {
          if (locale != null) {
            onChanged?.call(locale);
          }
        },
      ),
    ];
  }

  @override
  Locale valueFromQueryGroup(Map<String, String> group) {
    return valueOf('name', group)!;
  }

  @override
  Widget buildUseCase(
    BuildContext context,
    Widget child,
    Locale setting,
  ) {
    return Localizations(
      locale: setting,
      delegates: localizationsDelegates,
      child: child,
    );
  }
}
