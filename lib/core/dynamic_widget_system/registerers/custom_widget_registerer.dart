/*
 * neo_bank
 *
 * Created on 19/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/features/debit/widgets/debit_card_permissions_continue_button/debit_card_permissions_continue_button_builder.dart';
import 'package:backoffice/features/login/widgets/login_app_bar/login_app_bar_builder.dart';
import 'package:backoffice/features/login/widgets/login_button/login_button_builder.dart';
import 'package:backoffice/features/login/widgets/login_credentials_form/login_credential_form_builder.dart';
import 'package:backoffice/features/login/widgets/login_slidable_avatar_tab/login_slidable_avatar_tab_builder.dart';
import 'package:backoffice/features/otp/widgets/otp_security_image_widget_builder.dart';
import 'package:backoffice/features/profile_and_settings/about_on_mobile/widgets/about_on_mobile_navigation_button/about_on_mobile_navigation_button_builder.dart';
import 'package:backoffice/features/profile_and_settings/about_on_mobile/widgets/used_technologies_html_widget/used_technologies_html_widget_builder.dart';
import 'package:backoffice/features/profile_and_settings/application_settings/widgets/language_switch/segmented_language_switch_builder.dart';
import 'package:backoffice/features/profile_and_settings/profile/widgets/profile_greetings_card/profile_greetings_card_builder.dart';
import 'package:backoffice/features/register/widgets/set_password_bullet_view/set_password_bullet_view_builder.dart';
import 'package:backoffice/features/security_question/widgets/set_security_question_dropdown_form_field_builder.dart';
import 'package:backoffice/reusable_widgets/neo_accordion/neo_accordion_builder.dart';
import 'package:backoffice/reusable_widgets/neo_account_selection/neo_account_selection_dropdown_builder.dart';
import 'package:backoffice/reusable_widgets/neo_account_widget/neo_account_widget_builder.dart';
import 'package:backoffice/reusable_widgets/neo_address_selection/neo_address_selection_dropdown_builder.dart';
import 'package:backoffice/reusable_widgets/neo_amount_widget/neo_amount_widget_builder.dart';
import 'package:backoffice/reusable_widgets/neo_animation/neo_animation_builder.dart';
import 'package:backoffice/reusable_widgets/neo_app_bar/neo_app_bar_builder.dart';
import 'package:backoffice/reusable_widgets/neo_avatar/neo_avatar_builder.dart';
import 'package:backoffice/reusable_widgets/neo_badge/neo_badge_builder.dart';
import 'package:backoffice/reusable_widgets/neo_bottom_navigation_page/neo_bottom_navigation_page_builder.dart';
import 'package:backoffice/reusable_widgets/neo_bullet_list_view/neo_bullet_list_view_builder.dart';
import 'package:backoffice/reusable_widgets/neo_button/neo_button_builder.dart';
import 'package:backoffice/reusable_widgets/neo_cached_card_details/neo_cached_card_details_builder.dart';
import 'package:backoffice/reusable_widgets/neo_card_details/neo_card_details_builder.dart';
import 'package:backoffice/reusable_widgets/neo_card_selection_dropdown/neo_card_selection_dropdown_builder.dart';
import 'package:backoffice/reusable_widgets/neo_category_item_widget/neo_category_item_widget_builder.dart';
import 'package:backoffice/reusable_widgets/neo_checkbox_group/neo_checkbox_group_widget_builder.dart';
import 'package:backoffice/reusable_widgets/neo_countdown_timer/neo_countdown_timer_builder.dart';
import 'package:backoffice/reusable_widgets/neo_customer_name/neo_customer_name_widget_builder.dart';
import 'package:backoffice/reusable_widgets/neo_debit_card/neo_debit_card_builder.dart';
import 'package:backoffice/reusable_widgets/neo_debit_card_list_view/neo_debit_card_list_view_builder.dart';
import 'package:backoffice/reusable_widgets/neo_divider/neo_divider_builder.dart';
import 'package:backoffice/reusable_widgets/neo_expandable_information_card/neo_expandable_information_card_builder.dart';
import 'package:backoffice/reusable_widgets/neo_html_widget/neo_html_widget_builder.dart';
import 'package:backoffice/reusable_widgets/neo_hypertext/neo_hypertext_builder.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon_builder.dart';
import 'package:backoffice/reusable_widgets/neo_icon_button/neo_icon_button_builder.dart';
import 'package:backoffice/reusable_widgets/neo_image/neo_image_builder.dart';
import 'package:backoffice/reusable_widgets/neo_image_selector/neo_image_selector_widget_builder.dart';
import 'package:backoffice/reusable_widgets/neo_information_card/neo_information_card_builder.dart';
import 'package:backoffice/reusable_widgets/neo_navigation_group_widget/neo_navigation_group_widget_builder.dart';
import 'package:backoffice/reusable_widgets/neo_network_dropdown_form_field/neo_network_dropdown_form_field_builder.dart';
import 'package:backoffice/reusable_widgets/neo_popup/neo_popup_builder.dart';
import 'package:backoffice/reusable_widgets/neo_radio_button_group/neo_radio_button_group_widget_builder.dart';
import 'package:backoffice/reusable_widgets/neo_scaffold/neo_scaffold_builder.dart';
import 'package:backoffice/reusable_widgets/neo_segmented_button/neo_segmented_button_builder.dart';
import 'package:backoffice/reusable_widgets/neo_stepper/neo_stepper_builder.dart';
import 'package:backoffice/reusable_widgets/neo_success_page/neo_success_page_builder.dart';
import 'package:backoffice/reusable_widgets/neo_swipe_button/neo_swipe_button_builder.dart';
import 'package:backoffice/reusable_widgets/neo_swipe_card/item_widgets/neo_swipe_card_item_widget_builder.dart';
import 'package:backoffice/reusable_widgets/neo_swipe_card/neo_swipe_card_builder.dart';
import 'package:backoffice/reusable_widgets/neo_switch/neo_switch_builder.dart';
import 'package:backoffice/reusable_widgets/neo_tckn_form_field/neo_tckn_form_field_builder.dart';
import 'package:backoffice/reusable_widgets/neo_terms_and_conditions/neo_terms_and_conditions_builder.dart';
import 'package:backoffice/reusable_widgets/neo_terms_and_conditions_group/neo_terms_and_conditions_group_builder.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text_builder.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/neo_text_form_field_builder.dart';
import 'package:backoffice/reusable_widgets/neo_theme_selector/neo_theme_selector_builder.dart';
import 'package:backoffice/reusable_widgets/spacer/spacer_builder.dart';
import 'package:backoffice/reusable_widgets/sub_navigation/sub_navigation_widget_builder.dart';
import 'package:backoffice/workflow_widgets/wf_transaction_summary_list/wf_transaction_summary_list_builder.dart';

typedef JsonWidgetBuilderPair = ({
  String type,
  JsonWidgetBuilder Function(dynamic, {JsonWidgetRegistry? registry}) func,
});

class CustomWidgetRegisterer {
  static final registry = JsonWidgetRegistry.instance;

  // TODO: Order enum values alphabetically to prevent possible conflicts!
  static final List<JsonWidgetBuilderPair> _widgetBuilderPairs = [
    (type: AboutOnMobileNavigationButtonBuilder.kType, func: AboutOnMobileNavigationButtonBuilder.fromDynamic),
    (type: DebitCardPermissionsContinueButtonBuilder.kType, func: DebitCardPermissionsContinueButtonBuilder.fromDynamic),
    (type: LoginAppBarBuilder.kType, func: LoginAppBarBuilder.fromDynamic),
    (type: LoginButtonBuilder.kType, func: LoginButtonBuilder.fromDynamic),
    (type: LoginCredentialFormBuilder.kType, func: LoginCredentialFormBuilder.fromDynamic),
    (type: LoginSlidableAvatarTabBuilder.kType, func: LoginSlidableAvatarTabBuilder.fromDynamic),
    (type: NeoAccordionBuilder.kType, func: NeoAccordionBuilder.fromDynamic),
    (type: NeoAccountWidgetBuilder.kType, func: NeoAccountWidgetBuilder.fromDynamic),
    (type: NeoAccountSelectionDropdownBuilder.kType, func: NeoAccountSelectionDropdownBuilder.fromDynamic),
    (type: NeoAmountWidgetBuilder.kType, func: NeoAmountWidgetBuilder.fromDynamic),
    (type: NeoAddressSelectionDropdownBuilder.kType, func: NeoAddressSelectionDropdownBuilder.fromDynamic),
    (type: NeoAnimationBuilder.kType, func: NeoAnimationBuilder.fromDynamic),
    (type: NeoAppBarBuilder.kType, func: NeoAppBarBuilder.fromDynamic),
    (type: NeoAvatarBuilder.kType, func: NeoAvatarBuilder.fromDynamic),
    (type: NeoBadgeBuilder.kType, func: NeoBadgeBuilder.fromDynamic),
    (type: NeoBottomNavigationPageBuilder.kType, func: NeoBottomNavigationPageBuilder.fromDynamic),
    (type: NeoBulletListViewBuilder.kType, func: NeoBulletListViewBuilder.fromDynamic),
    (type: NeoButtonBuilder.kType, func: NeoButtonBuilder.fromDynamic),
    (type: NeoCachedCardDetailsBuilder.kType, func: NeoCachedCardDetailsBuilder.fromDynamic),
    (type: NeoCardDetailsBuilder.kType, func: NeoCardDetailsBuilder.fromDynamic),
    (type: NeoCardSelectionDropdownBuilder.kType, func: NeoCardSelectionDropdownBuilder.fromDynamic),
    (type: NeoCategoryItemWidgetBuilder.kType, func: NeoCategoryItemWidgetBuilder.fromDynamic),
    (type: NeoCheckboxGroupWidgetBuilder.kType, func: NeoCheckboxGroupWidgetBuilder.fromDynamic),
    (type: NeoCountdownTimerBuilder.kType, func: NeoCountdownTimerBuilder.fromDynamic),
    (type: NeoCustomerNameWidgetBuilder.kType, func: NeoCustomerNameWidgetBuilder.fromDynamic),
    (type: NeoDebitCardBuilder.kType, func: NeoDebitCardBuilder.fromDynamic),
    (type: NeoDebitCardListViewBuilder.kType, func: NeoDebitCardListViewBuilder.fromDynamic),
    (type: NeoDividerBuilder.kType, func: NeoDividerBuilder.fromDynamic),
    (type: NeoExpandableInformationCardBuilder.kType, func: NeoExpandableInformationCardBuilder.fromDynamic),
    (type: NeoHtmlWidgetBuilder.kType, func: NeoHtmlWidgetBuilder.fromDynamic),
    (type: NeoHypertextWidgetBuilder.kType, func: NeoHypertextWidgetBuilder.fromDynamic),
    (type: NeoIconBuilder.kType, func: NeoIconBuilder.fromDynamic),
    (type: NeoIconButtonBuilder.kType, func: NeoIconButtonBuilder.fromDynamic),
    (type: NeoImageBuilder.kType, func: NeoImageBuilder.fromDynamic),
    (type: NeoImageSelectorWidgetBuilder.kType, func: NeoImageSelectorWidgetBuilder.fromDynamic),
    (type: NeoInformationCardBuilder.kType, func: NeoInformationCardBuilder.fromDynamic),
    (type: NeoNavigationGroupWidgetBuilder.kType, func: NeoNavigationGroupWidgetBuilder.fromDynamic),
    (type: NeoNetworkDropdownFormFieldBuilder.kType, func: NeoNetworkDropdownFormFieldBuilder.fromDynamic),
    (type: NeoPopupBuilder.kType, func: NeoPopupBuilder.fromDynamic),
    (type: NeoRadioButtonGroupWidgetBuilder.kType, func: NeoRadioButtonGroupWidgetBuilder.fromDynamic),
    (type: NeoScaffoldBuilder.kType, func: NeoScaffoldBuilder.fromDynamic),
    (type: NeoSegmentedButtonBuilder.kType, func: NeoSegmentedButtonBuilder.fromDynamic),
    (type: NeoStepperBuilder.kType, func: NeoStepperBuilder.fromDynamic),
    (type: NeoSuccessPageBuilder.kType, func: NeoSuccessPageBuilder.fromDynamic),
    (type: NeoSwipeButtonBuilder.kType, func: NeoSwipeButtonBuilder.fromDynamic),
    (type: NeoSwipeCardBuilder.kType, func: NeoSwipeCardBuilder.fromDynamic),
    (type: NeoSwipeCardItemWidgetBuilder.kType, func: NeoSwipeCardItemWidgetBuilder.fromDynamic),
    (type: NeoSwitchBuilder.kType, func: NeoSwitchBuilder.fromDynamic),
    (type: NeoTcknFormFieldBuilder.kType, func: NeoTcknFormFieldBuilder.fromDynamic),
    (type: NeoTermsAndConditionsBuilder.kType, func: NeoTermsAndConditionsBuilder.fromDynamic),
    (type: NeoTermsAndConditionsGroupBuilder.kType, func: NeoTermsAndConditionsGroupBuilder.fromDynamic),
    (type: NeoTextBuilder.kType, func: NeoTextBuilder.fromDynamic),
    (type: NeoTextFormFieldBuilder.kType, func: NeoTextFormFieldBuilder.fromDynamic),
    (type: NeoThemeSelectorBuilder.kType, func: NeoThemeSelectorBuilder.fromDynamic),
    (type: OtpSecurityImageWidgetBuilder.kType, func: OtpSecurityImageWidgetBuilder.fromDynamic),
    (type: ProfileGreetingsCardBuilder.kType, func: ProfileGreetingsCardBuilder.fromDynamic),
    (type: SegmentedLanguageSwitchBuilder.kType, func: SegmentedLanguageSwitchBuilder.fromDynamic),
    (type: SetPasswordBulletViewBuilder.kType, func: SetPasswordBulletViewBuilder.fromDynamic),
    (
      type: SetSecurityQuestionDropdownFormFieldBuilder.kType,
      func: SetSecurityQuestionDropdownFormFieldBuilder.fromDynamic,
    ),
    (type: SpacerBuilder.kType, func: SpacerBuilder.fromDynamic),
    (type: SubNavigationWidgetBuilder.kType, func: SubNavigationWidgetBuilder.fromDynamic),
    (type: UsedTechnologiesHtmlWidgetBuilder.kType, func: UsedTechnologiesHtmlWidgetBuilder.fromDynamic),
    (type: WfTransactionSummaryListBuilder.kType, func: WfTransactionSummaryListBuilder.fromDynamic),
  ];

  void init() {
    final Map<String, JsonWidgetBuilderContainer> buildersMap = {};
    for (final pair in _widgetBuilderPairs) {
      buildersMap[pair.type] = JsonWidgetBuilderContainer(builder: pair.func);
    }
    registry.registerCustomBuilders(buildersMap);
  }
}
