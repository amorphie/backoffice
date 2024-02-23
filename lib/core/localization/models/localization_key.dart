/*
 * neo_bank
 *
 * Created on 4/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:backoffice/core/localization/bloc/localization_bloc.dart';

// TODO: Order enum values alphabetically to prevent possible conflicts!
enum LocalizationKey {
  accountsAccountBalanceLabel("accounts_accountBalance_label"),
  accountsAccountText("accounts_account_text"),
  accountsAccountOpeningBranchLabel("accounts_accountOpening_branch_label"),
  accountsCheckingText("accounts_checking_text"),
  accountsExchangeRateProtectedText("accounts_exchangeRateProtected_text"),
  accountsForeignCurrencyExchangeRateProtectedText("accounts_foreignCurrencyExchangeRateProtected_text"),
  accountsFundedText("accounts_funded_text"),
  accountsOnText("accounts_on_text"),
  accountsSavingText("accounts_saving_text"),
  debitCardApplicationAbroadUseLabel("debitCard_application_abroadUse_label"),
  debitCardApplicationCardDeliveryAddressLabel("debitCard_application_cardDeliveryAddress_label"),
  debitCardApplicationDeliveryAddressLabel("debitCard_application_deliveryAddress_label"),
  debitCardApplicationIbanLabel("debitCard_application_iban_label"),
  debitCardApplicationInternetUseLabel("debitCard_application_internetUse_label"),
  debitCardApplicationMainAccountLabel("debitCard_application_mainAccount_label"),
  debitCardApplicationMotoLabel("debitCard_application_moto_label"),
  debitCardApplicationNameOnCardLabel("debitCard_application_nameOnCard_label"),
  debitCardApplicationOnBankCardButton("debitCard_application_onBankCard_button"),
  debitCardCardBottomsheetCreditCardLabel("debitCard_cardBottomsheet_creditCard_label"),
  debitCardCardDetailsTemporaryClosedText("debitCard_cardDetails_temporaryClosed_text"),
  debitCardCardListDebitCardSubtitle("debitCard_cardList_debitCard_subtitle"),
  debitCardCardListVirtualCardSubtitle("debitCard_cardList_virtualCard_subtitle"),
  debitCardCardListOnBankCardText("debitCard_cardList_onBankCard_text"),
  debitCardChangeRelatedAccountMasterAccountSubtitle("debitCard_changeRelatedAccount_masterAccount_subtitle"),
  debitCardDetailsAtmMaxLimitLabel("debitCard_cardDetails_atmMaxLimit_label"),
  debitCardDetailsOnBankCardTitle("debitCard_details_onBankCard_title"),
  debitCardDetailsVirtualCardTitle("debitCard_details_virtualCard_title"),
  debitCardCardListTotalBalanceText("debitCard_cardList_totalBalance_text"),
  debitCardDetailsAvailableBalanceLabel("debitCard_details_availableBalance_label"),
  debitCardDetailsCardInformationTitle("debitCard_details_cardInformation_title"),
  debitCardDetailsConnectedAccountLabel("debitCard_details_connectedAccount_label"),
  debitCardDetailsCurrentBalanceLabel("debitCard_details_currentBalance_label"),
  debitCardDetailsOverdraftLimitLabel("debitCard_details_overdraftLimit_label"),
  debitCardDetailsPosMaxLimitLabel("debitCard_cardDetails_posMaxLimit_label"),
  debitCardInformationAccountNumberLabel("debitCard_information_accountNumber_label"),
  debitCardInformationNameOnCardTitle("debitCard_information_nameOnCard_title"),
  debitCardListApplyDebitCardText("debitCard_cardList_applyDebitCard_text"),
  debitCardListApplyDebitCardTitle("debitCard_cardList_applyDebitCard_title"),
  debitCardSettingsDigitalSlipTitle("debitCard_settings_digitalSlip_title"),
  debitCardSettingsPinChangeCharacterText("debitCard_settings_pinChange_character_text"),
  generalCameraAccessPopupPictureButton("general_cameraAccess_popup_picture_button"),
  generalCameraAccessPopupPictureText("general_cameraAccess_popup_picture_text"),
  generalCameraAccessPopupPictureTitle("general_cameraAccess_popup_picture_title"),
  generalContinueButton("general_continue_button"),
  generalContinueWithSelectionButton("general_continueWithSelection_button"),
  generalDismissPictureButton("general_dismiss_picture_button"),
  generalEditPictureTitle("general_edit_picture_title"),
  generalGalleryAccessPopupPictureButton("general_galleryAccess_popup_picture_button"),
  generalGalleryAccessPopupPictureText("general_galleryAccess_popup_picture_text"),
  generalGalleryAccessPopupPictureTitle("general_galleryAccess_popup_picture_title"),
  generalNoButton("general_no_button"),
  generalOkayButton("general_okay_button"),
  generalRemovePictureButton("general_remove_picture_button"),
  generalSelectPictureButton("general_select_picture_button"),
  generalSelectPlaceholder("general_select_placeholder"),
  generalTakePictureButton("general_take_picture_button"),
  generalYesText("general_yes_text"),
  loginNewPasswordNotMatchingErrorMessage("login_newPassword_notMatching_errorMessage"),
  loginNewPasswordRule1Text("login_newPassword_rule1_text"),
  loginNewPasswordRule2Text("login_newPassword_rule2_text"),
  loginNewPasswordRule3Text("login_newPassword_rule3_text"),
  loginSecurityPictureDetailsMissingSelectionErrorMessage(
    "login_securityPicture_details_missingSelection_errorMessage",
  ),
  loginSecurityQuestionQuestionPlaceholder("login_securityQuestion_question_placeholder"),
  loginSecurityQuestionQuestionTitle("login_securityQuestion_question_title"),
  loginSecurityQuestionSelectionErrorMessage("login_securityQuestion_selection_errorMessage"),
  otpMainSecurityFirstText("OTP_main_security_first_text"),
  otpMainSecurityLinkText("OTP_main_securityLink_text"),
  otpMainSecuritySecondText("OTP_main_security_second_text"),
  profileAndSettingsAppSettingsDarkThemeLabel("profileAndSettings_appSettings_dark_theme_label"),
  profileAndSettingsAppSettingsLightThemeLabel("profileAndSettings_appSettings_light_theme_label"),
  profileAndSettingsAppSettingsSystemThemeLabel("profileAndSettings_appSettings_system_theme_label"),
  profileAndSettingsAppSettingsThemeLabel("profileAndSettings_appSettings_theme_label"),
  profileAndSettingsBusinessAddressTitle("profileAndSettings_businessAddress_title"),
  profileAndSettingsHomeAddressTitle("profileAndSettings_homeAddress_title"),
  profileAndSettingsMainAfternoonEntranceText("profileAndSettings_main_afternoon_entrance_text"),
  profileAndSettingsMainEveningEntranceText("profileAndSettings_main_evening_entrance_text"),
  profileAndSettingsMainMorningEntranceText("profileAndSettings_main_morning_entrance_text"),
  profileAndSettingsMainNightEntranceText("profileAndSettings_main_night_entrance_text"),
  profileAndSettingsMainPersonalInformationTitle("profileAndSettings_main_personalInformation_title"),
  profileAndSettingsMainPersonalInformationSubtitle("profileAndSettings_main_personalInformation_subtitle"),
  profileAndSettingsSecurityQuestionMissingAnswerErrorMessage(
    'profileAndSettings_securityQuestion_missing_answer_errorMessage',
  ),
  ;

  final String key;

  const LocalizationKey(this.key);
}

extension LocalizationKeyExtension on LocalizationKey {
  String loc() => localize(key);
}
