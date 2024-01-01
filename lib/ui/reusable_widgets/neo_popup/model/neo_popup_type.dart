/*
 * Neobank.Client
 *
 * Created on 27/11/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

enum NeoPopupType {
  success,
  info,
  warning,
  error;

  static const _jsonValues = {
    'success': NeoPopupType.success,
    'info': NeoPopupType.info,
    'warning': NeoPopupType.warning,
    'error': NeoPopupType.error,
  };

  static NeoPopupType fromJson(String? json) {
    return _jsonValues[json] ?? NeoPopupType.info;
  }
}
