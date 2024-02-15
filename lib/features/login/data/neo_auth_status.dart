/*
 * neo_bank
 *
 * Created on 12/2/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:collection/collection.dart';

enum NeoAuthStatus {
  notLoggedIn(key: "NL"),
  oneFactorAuth(key: "1FA"),
  twoFactorAuth(key: "2FA");

  final String key;

  const NeoAuthStatus({required this.key});

  static NeoAuthStatus fromKey(String key) {
    return NeoAuthStatus.values.firstWhereOrNull((e) => e.key == key) ?? NeoAuthStatus.notLoggedIn;
  }
}

extension NeoAuthStatusExtension on NeoAuthStatus {
  bool get isTwoFactorAuth => this == NeoAuthStatus.twoFactorAuth;
}
