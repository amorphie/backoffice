/*
 * Neobank.Client
 *
 * Created on 15/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

enum NeoNavigationItemAudience {
  notLogin(key: "NL"),
  oneFactorAuth(key: "1FA"),
  twoFactorAuth(key: "2FA");

  final String? key;

  const NeoNavigationItemAudience({this.key});
}
