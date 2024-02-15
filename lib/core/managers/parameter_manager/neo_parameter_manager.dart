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

import 'package:backoffice/core/managers/parameter_manager/neo_cached_parameter_manager.dart';
import 'package:backoffice/core/managers/parameter_manager/neo_storage_parameter_manager.dart';

abstract class _Constant {
  static const prefixCache = "cache";
  static const prefixStorage = "storage";
  static const urnSplitter = ":";
}

class NeoParameterManager {
  NeoParameterManager({
    NeoStorageParameterManager? neoBackendParameterManager,
    NeoCachedParameterManager? neoCachedParameterManager,
  })  : _neoStorageParameterManager = neoBackendParameterManager ?? NeoStorageParameterManager(),
        _neoCachedParameterManager = neoCachedParameterManager ?? NeoCachedParameterManager();

  final NeoStorageParameterManager _neoStorageParameterManager;
  final NeoCachedParameterManager _neoCachedParameterManager;

  Future<dynamic> read({required String keyUrn}) async {
    final splitResult = keyUrn.split(_Constant.urnSplitter);
    if (splitResult.length < 2) {
      return null;
    }
    final parameterLocation = splitResult[0];

    switch (parameterLocation) {
      case _Constant.prefixCache:
        final parameterPageKey = splitResult[1];
        final parameterKey = splitResult[2];
        final parameterValues = _neoCachedParameterManager.read(parameterPageKey);
        return parameterValues?[parameterKey];
      case _Constant.prefixStorage:
        final parameterKey = splitResult[1];
        return _neoStorageParameterManager.read(parameterKey);
      default:
        return null;
    }
  }

  dynamic readFromCache(String key) {
    return _neoCachedParameterManager.read(key);
  }

  void writeToCache(String key, dynamic value) {
    _neoCachedParameterManager.write(key, value);
  }

  void deleteFromCache(String key) {
    _neoCachedParameterManager.removeKey(key);
  }

  void clearCache() {
    _neoCachedParameterManager.clear();
  }
}
