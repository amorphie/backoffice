/*
 * 
 * neo_bank
 * 
 * Created on 17/01/2024.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:backoffice/core/localization/models/localization_key.dart';

abstract class _Constants {
  static DateTime summerStartDay = DateTime(DateTime.now().year, 5, 15);
  static DateTime winterStartDay = DateTime(DateTime.now().year, 10, 15);

  static const morningStartHour = 5;
  static const afternoonStartHour = 11;
  static const afternoonEndHour = 18;
  static const eveningStartHour = 19;
  static const eveningEndHour = 22;
  static const nightStartHourSummer = 23;
}

class GetGreetingsMessageUsecase {
  String call() {
    final now = DateTime.now();
    final int hour = now.hour;

    if (now.isAfter(_Constants.summerStartDay) && now.isBefore(_Constants.winterStartDay)) {
      if (hour >= _Constants.morningStartHour && hour < _Constants.afternoonStartHour) {
        return LocalizationKey.profileAndSettingsMainMorningEntranceText.loc();
      } else if (hour >= _Constants.afternoonStartHour && hour < _Constants.eveningStartHour) {
        return LocalizationKey.profileAndSettingsMainAfternoonEntranceText.loc();
      } else if (hour >= _Constants.eveningStartHour && hour < _Constants.nightStartHourSummer) {
        return LocalizationKey.profileAndSettingsMainEveningEntranceText.loc();
      } else {
        return LocalizationKey.profileAndSettingsMainNightEntranceText.loc();
      }
    } else {
      if (hour >= _Constants.morningStartHour && hour < _Constants.afternoonStartHour) {
        return LocalizationKey.profileAndSettingsMainMorningEntranceText.loc();
      } else if (hour >= _Constants.afternoonStartHour && hour < _Constants.afternoonEndHour) {
        return LocalizationKey.profileAndSettingsMainAfternoonEntranceText.loc();
      } else if (hour >= _Constants.afternoonEndHour && hour < _Constants.eveningEndHour) {
        return LocalizationKey.profileAndSettingsMainEveningEntranceText.loc();
      } else {
        return LocalizationKey.profileAndSettingsMainNightEntranceText.loc();
      }
    }
  }
}
