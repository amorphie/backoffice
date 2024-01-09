/*
 * neo_bank
 *
 * Created on 29/11/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

class NeoCachedParameterManager {
  final Map<String, dynamic> _data = {};

  void write(String key, dynamic value) {
    _data[key] = value;
  }

  dynamic read(String key) {
    return _data[key];
  }

  void removeKey(String key) {
    _data.remove(key);
  }

  void clear() {
    _data.clear();
  }
}
