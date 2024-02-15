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

enum NeoButtonEnableState {
  disabled,
  enabledWithoutOnClick,
  enabled,
  ;

  static const Map<String, NeoButtonEnableState> _jsonValues = {
    'disabled': NeoButtonEnableState.disabled,
    'enabledWithoutOnClick': NeoButtonEnableState.enabledWithoutOnClick,
    'enabled': NeoButtonEnableState.enabled,
  };

  static NeoButtonEnableState fromJson(String json) {
    return _jsonValues[json] ?? NeoButtonEnableState.enabled;
  }
}
