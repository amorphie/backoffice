/*
 * 
 * Neobank.Client
 * 
 * Created on 26/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:backoffice/features/login/data/neo_auth_status.dart';

class _Constants {
  static const StorageCipherAlgorithm storageCipherAlgorithm = StorageCipherAlgorithm.AES_GCM_NoPadding;
  static const String sharedPrefKeyProfileImage = "shared_pref_key_profile_image";
  static const String sharedPrefKeyCurrentTheme = "shared_pref_key_current_theme";
  static const String sharedPrefKeyAuthStatus = "shared_pref_key_auth_status";
}

class NeoSecureStorage {
  static final NeoSecureStorage _singleton = NeoSecureStorage._internal();

  factory NeoSecureStorage() {
    return _singleton;
  }

  NeoSecureStorage._internal();

  FlutterSecureStorage? _storage;

  Future init() async {
    if (_storage != null) {
      return;
    }
    _storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
        storageCipherAlgorithm: _Constants.storageCipherAlgorithm,
      ),
    );
  }

  Future<void> setProfileImage(String base64Image) async {
    await _storage?.write(key: _Constants.sharedPrefKeyProfileImage, value: base64Image);
  }

  Future<String?> getProfileImage() async {
    if (await _storage!.containsKey(key: _Constants.sharedPrefKeyProfileImage)) {
      return await _storage?.read(key: _Constants.sharedPrefKeyProfileImage);
    }
    return null;
  }

  Future<void> deleteProfileImage() async {
    if (await _storage!.containsKey(key: _Constants.sharedPrefKeyProfileImage)) {
      await _storage?.delete(key: _Constants.sharedPrefKeyProfileImage);
    }
  }

  Future<String?> getCurrentTheme() async {
    if (await _storage!.containsKey(key: _Constants.sharedPrefKeyCurrentTheme)) {
      return await _storage?.read(key: _Constants.sharedPrefKeyCurrentTheme);
    }
    return null;
  }

  Future<void> setCurrentTheme(String theme) async {
    await _storage?.write(key: _Constants.sharedPrefKeyCurrentTheme, value: theme);
  }

  Future<NeoAuthStatus> getAuthStatus() async {
    if (await _storage!.containsKey(key: _Constants.sharedPrefKeyAuthStatus)) {
      final authStatusKey = await _storage?.read(key: _Constants.sharedPrefKeyAuthStatus) ?? "";
      return NeoAuthStatus.fromKey(authStatusKey);
    }
    return NeoAuthStatus.notLoggedIn;
  }

  Future<void> setAuthStatus(NeoAuthStatus authStatus) async {
    await _storage?.write(key: _Constants.sharedPrefKeyAuthStatus, value: authStatus.key);
  }
}
