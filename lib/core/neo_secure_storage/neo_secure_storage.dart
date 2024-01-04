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

class _Constants {
  static const StorageCipherAlgorithm storageCipherAlgorithm = StorageCipherAlgorithm.AES_GCM_NoPadding;
  static const String sharedPrefKeyProfileImage = "shared_pref_key_profile_image";
  static const String sharedPrefKeyCustomerNameAndSurname = "shared_pref_key_customer_name_and_surname";
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
    return await _storage?.read(key: _Constants.sharedPrefKeyProfileImage);
  }

  Future<void> deleteProfileImage() async {
    await _storage?.delete(key: _Constants.sharedPrefKeyProfileImage);
  }

  Future<void> setCustomerNameAndSurname(String name, String surname) async {
    await _storage?.write(key: _Constants.sharedPrefKeyCustomerNameAndSurname, value: "$name $surname");
  }

  Future<String?> getCustomerNameAndSurname() async {
    return await _storage?.read(key: _Constants.sharedPrefKeyCustomerNameAndSurname);
  }

  Future<void> deleteCustomerNameAndSurname() async {
    await _storage?.delete(key: _Constants.sharedPrefKeyCustomerNameAndSurname);
  }
}
