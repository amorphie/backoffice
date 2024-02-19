/*
 * neo_bank
 *
 * Created on 28/11/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

class NeoPageId {
  NeoPageId._();

  // TODO: Order pageIds alphabetically to prevent possible conflicts!
  static const debitCardDashboard = "debit-card-dashboard";
  static const debitCardTransactions = "debit-card-transactions";
  static const home = "home";
  static const otherTransactions = "other-transactions";
  static const otherTransactionsDocuments = "other-transactions-documents";
  static const permissions = "permissions";
  static const personalInformation = "personal-information";
  static const photoSelectionVerify = 'photo-selection-verify';
  static const settings = 'settings';
  static const settingsAboutOnMobile = "settings-about-on-mobile";
  static const settingsApplication = "settings-application";
  static const settingsNotifications = "settings-notifications";
  static const settingsUsedTechnologies = "settings-used-technologies";
}
