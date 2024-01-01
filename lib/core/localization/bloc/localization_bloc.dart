/*
 * neo_bank
 *
 * Created on 4/10/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_core/neo_core.dart';

import '../language.dart';

part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  static Language? _currentLanguage;

  static Language? get currentLanguage => _currentLanguage;

  final _secureStorage = NeoCoreSecureStorage();

  LocalizationBloc() : super(LocalizationState(Language.defaultLanguage)) {
    on<LocalizationEventInit>((_, emitter) => _init());
    on<LocalizationEventChangeLanguage>(_mapLanguageChangedToState);
    on<LocalizationEventSwitchLanguage>(_mapSwitchLanguage);
  }

  _init() async {
    final language = await _getStoredLanguage();
    _currentLanguage = language;
    add(LocalizationEventChangeLanguage(language));
  }

  _mapLanguageChangedToState(LocalizationEventChangeLanguage event, Emitter<LocalizationState> emit) async {
    final targetLanguage = event.language;
    await _secureStorage.setLanguageCode(targetLanguage.languageCode);
    _currentLanguage = targetLanguage;
    emit(LocalizationState(targetLanguage));
  }

  _mapSwitchLanguage(LocalizationEventSwitchLanguage event, Emitter<LocalizationState> emit) async {
    final targetLanguage = LocalizationBloc.currentLanguage == Language.english ? Language.turkish : Language.english;
    await _secureStorage.setLanguageCode(targetLanguage.languageCode);
    _currentLanguage = targetLanguage;
    emit(LocalizationState(targetLanguage));
  }

  Future<Language> _getStoredLanguage() async {
    final storedLanguageCode = await _secureStorage.getLanguageCode();
    if (storedLanguageCode != null) {
      return Language.fromString(storedLanguageCode);
    } else {
      return Language.defaultLanguage;
    }
  }
}
