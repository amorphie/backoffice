/*
 * neo_bank
 *
 * Created on 19/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

enum NeoBoButtonEnableState {
  disabled,
  enabledWithoutOnClick,
  enabled,
  ;

  static const Map<String, NeoBoButtonEnableState> _jsonValues = {
    'disabled': NeoBoButtonEnableState.disabled,
    'enabledWithoutOnClick': NeoBoButtonEnableState.enabledWithoutOnClick,
    'enabled': NeoBoButtonEnableState.enabled,
  };

  static NeoBoButtonEnableState fromJson(String json) {
    return _jsonValues[json] ?? NeoBoButtonEnableState.enabled;
  }
}
