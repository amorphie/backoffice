import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin/core/localization/bloc/localization_bloc.dart';
import 'package:admin/core/localization/language.dart';

class LanguageSelectionDialog {
  Future show(BuildContext context) async {
    final localizationBloc = context.read<LocalizationBloc>();
    unawaited(
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select Language'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  localizationBloc.add(const LocalizationEventChangeLanguage(Language.turkish));
                  Navigator.of(context).pop();
                },
                child: const Text('Turkish'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  localizationBloc.add(const LocalizationEventChangeLanguage(Language.english));
                  Navigator.of(context).pop();
                },
                child: const Text('English'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  localizationBloc.add(const LocalizationEventChangeLanguage(Language.arabic));
                  Navigator.of(context).pop();
                },
                child: const Text('Arabic'),
              ),
            ],
          );
        },
      ),
    );
  }
}
