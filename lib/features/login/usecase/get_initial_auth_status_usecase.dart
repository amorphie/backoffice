/*
 * 
 * neo_bank
 * 
 * Created on 27/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'dart:async';

import 'package:backoffice/core/neo_secure_storage/neo_secure_storage.dart';
import 'package:backoffice/features/login/data/neo_auth_status.dart';

class GetInitialAuthStatusUseCase {
  Future<NeoAuthStatus> call() async {
    final secureStorage = NeoSecureStorage();
    final authStatus = await secureStorage.getAuthStatus();

    // If currently saved auth status is two factor auth, drop it to one factor auth.
    if (authStatus == NeoAuthStatus.twoFactorAuth) {
      await secureStorage.setAuthStatus(NeoAuthStatus.oneFactorAuth);
      return NeoAuthStatus.oneFactorAuth;
    } else {
      return authStatus;
    }
  }
}
