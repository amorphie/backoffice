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
import 'package:backoffice/demo_features/demo_accounts_first/widgets/account_welcome_scaffold/account_welcome_scaffold_builder.dart';
import 'package:backoffice/demo_features/demo_accounts_second/widgets/branch_code_dropdown_field/neo_network_dropdown_form_field_builder2.dart';
import 'package:backoffice/demo_features/demo_saving_accounts_flow_third/widgets/animated_icon_builder.dart';
import 'package:backoffice/demo_features/demo_saving_accounts_flow_two/widgets/accounts_custom_info_text_builder.dart';
import 'package:backoffice/demo_features/demo_saving_accounts_flow_two/widgets/custom_neo_transition_button_builder.dart';
import 'package:backoffice/demo_features/widgets/checking/demo_checking_network_dropdown_field_builder.dart';
import 'package:backoffice/demo_features/widgets/dropdown_maturity/demo_maturity_network_dropdown_field_builder.dart';
import 'package:backoffice/demo_features/widgets/dropdown_maturity_renewal/demo_maturity_renewal_network_dropdown_field_builder.dart';
import 'package:backoffice/features/home/ui/widgets/account_summary/home_account_summary_widget_builder.dart';
import 'package:backoffice/features/home/ui/widgets/last_transactions/home_last_transactions_widget_builder.dart';
import 'package:backoffice/features/home/ui/widgets/overdraft_info/home_overdraft_info_widget_builder.dart';
import 'package:backoffice/features/login/widgets/login_app_bar/login_app_bar_builder.dart';
import 'package:backoffice/features/login/widgets/login_button/login_button_builder.dart';
import 'package:backoffice/features/login/widgets/login_credentials_form/login_credential_form_builder.dart';
import 'package:backoffice/features/login/widgets/login_slidable_avatar_tab/login_slidable_avatar_tab_builder.dart';
import 'package:backoffice/features/otp/widgets/count_down_timer/otp_count_down_timer_widget_builder.dart';
import 'package:backoffice/features/otp/widgets/message/otp_message_widget_builder.dart';
import 'package:backoffice/features/otp/widgets/title/otp_title_widget_builder.dart';
import 'package:backoffice/features/register/widgets/set_password_bullet_view/set_password_bullet_view_builder.dart';
import 'package:backoffice/features/security_question/widgets/set_security_question_dropdown_form_field_builder.dart';
import 'package:backoffice/reusable_widgets/brg_account_slider/brg_account_slider_widget_builder.dart';
import 'package:backoffice/reusable_widgets/neo_animation/neo_animation_builder.dart';
import 'package:backoffice/reusable_widgets/neo_app_bar/neo_app_bar_builder.dart';
import 'package:backoffice/reusable_widgets/neo_avatar/neo_avatar_builder.dart';
import 'package:backoffice/reusable_widgets/neo_bullet_list_view/neo_bullet_list_view_builder.dart';
import 'package:backoffice/reusable_widgets/neo_button/neo_button_builder.dart';
import 'package:backoffice/reusable_widgets/neo_countdown_timer/neo_countdown_timer_builder.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown_form_field/neo_dropdown_form_field_builder.dart';
import 'package:backoffice/reusable_widgets/neo_hypertext/neo_hypertext_builder.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon_builder.dart';
import 'package:backoffice/reusable_widgets/neo_image/neo_image_builder.dart';
import 'package:backoffice/reusable_widgets/neo_image_selector/neo_image_selector_widget_builder.dart';
import 'package:backoffice/reusable_widgets/neo_navigation_group_widget/neo_navigation_group_widget_builder.dart';
import 'package:backoffice/reusable_widgets/neo_network_dropdown_form_field/neo_network_dropdown_form_field_builder.dart';
import 'package:backoffice/reusable_widgets/neo_phone_number_form_field/neo_phone_number_form_field_builder.dart';
import 'package:backoffice/reusable_widgets/neo_popup/neo_popup_builder.dart';
import 'package:backoffice/reusable_widgets/neo_scaffold/neo_scaffold_builder.dart';
import 'package:backoffice/reusable_widgets/neo_success_page/neo_success_page_builder.dart';
import 'package:backoffice/reusable_widgets/neo_swipe_button/neo_swipe_button_builder.dart';
import 'package:backoffice/reusable_widgets/neo_tckn_form_field/neo_tckn_form_field_builder.dart';
import 'package:backoffice/reusable_widgets/neo_terms_and_conditions/neo_terms_and_conditions_builder.dart';
import 'package:backoffice/reusable_widgets/neo_terms_and_conditions_group/neo_terms_and_conditions_group_builder.dart';
import 'package:backoffice/reusable_widgets/neo_text/neo_text_builder.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/neo_text_form_field_builder.dart';
import 'package:backoffice/reusable_widgets/security_icon_widget/security_icon_widget_builder.dart';
import 'package:backoffice/reusable_widgets/spacer/spacer_builder.dart';
import 'package:backoffice/reusable_widgets/sub_navigation/sub_navigation_widget_builder.dart';

typedef JsonWidgetBuilderPair = ({
  String type,
  JsonWidgetBuilder Function(dynamic, {JsonWidgetRegistry? registry}) func,
});

class CustomWidgetRegisterer {
  static final registry = JsonWidgetRegistry.instance;

  static final List<JsonWidgetBuilderPair> _widgetBuilderPairs = [
    (type: NeoTextBuilder.kType, func: NeoTextBuilder.fromDynamic),
    (type: NeoBulletListViewBuilder.kType, func: NeoBulletListViewBuilder.fromDynamic),
    (type: NeoTextFormFieldBuilder.kType, func: NeoTextFormFieldBuilder.fromDynamic),
    (type: NeoDropdownFormFieldBuilder.kType, func: NeoDropdownFormFieldBuilder.fromDynamic),
    (type: NeoNetworkDropdownFormFieldBuilder.kType, func: NeoNetworkDropdownFormFieldBuilder.fromDynamic),
    (type: NeoSwipeButtonBuilder.kType, func: NeoSwipeButtonBuilder.fromDynamic),
    (type: NeoButtonBuilder.kType, func: NeoButtonBuilder.fromDynamic),
    (type: NeoNavigationGroupWidgetBuilder.kType, func: NeoNavigationGroupWidgetBuilder.fromDynamic),
    (type: NeoIconBuilder.kType, func: NeoIconBuilder.fromDynamic),
    (type: NeoAvatarBuilder.kType, func: NeoAvatarBuilder.fromDynamic),
    (type: NeoAppBarBuilder.kType, func: NeoAppBarBuilder.fromDynamic),
    (type: NeoScaffoldBuilder.kType, func: NeoScaffoldBuilder.fromDynamic),
    (type: NeoPopupBuilder.kType, func: NeoPopupBuilder.fromDynamic),
    (type: NeoAnimationBuilder.kType, func: NeoAnimationBuilder.fromDynamic),
    (type: NeoCountdownTimerBuilder.kType, func: NeoCountdownTimerBuilder.fromDynamic),
    (type: NeoTcknFormFieldBuilder.kType, func: NeoTcknFormFieldBuilder.fromDynamic),
    (type: NeoImageSelectorWidgetBuilder.kType, func: NeoImageSelectorWidgetBuilder.fromDynamic),
    (type: NeoTermsAndConditionsBuilder.kType, func: NeoTermsAndConditionsBuilder.fromDynamic),
    (type: NeoTermsAndConditionsGroupBuilder.kType, func: NeoTermsAndConditionsGroupBuilder.fromDynamic),
    (type: LoginButtonBuilder.kType, func: LoginButtonBuilder.fromDynamic),
    (type: SetPasswordBulletViewBuilder.kType, func: SetPasswordBulletViewBuilder.fromDynamic),
    (type: SpacerBuilder.kType, func: SpacerBuilder.fromDynamic),
    (type: LoginCredentialFormBuilder.kType, func: LoginCredentialFormBuilder.fromDynamic),
    (type: LoginSlidableAvatarTabBuilder.kType, func: LoginSlidableAvatarTabBuilder.fromDynamic),
    (type: LoginAppBarBuilder.kType, func: LoginAppBarBuilder.fromDynamic),
    (
      type: SetSecurityQuestionDropdownFormFieldBuilder.kType,
      func: SetSecurityQuestionDropdownFormFieldBuilder.fromDynamic,
    ),
    (type: NeoSuccessPageBuilder.kType, func: NeoSuccessPageBuilder.fromDynamic),
  ];

  static final List<JsonWidgetBuilderPair> _demoWidgetBuilderPairs = [
    (type: HomeAccountSummaryWidgetBuilder.kType, func: HomeAccountSummaryWidgetBuilder.fromDynamic),
    (type: BrgAccountSliderWidgetBuilder.kType, func: BrgAccountSliderWidgetBuilder.fromDynamic),
    (type: HomeOverdraftInfoWidgetBuilder.kType, func: HomeOverdraftInfoWidgetBuilder.fromDynamic),
    (type: HomeLastTransactionsWidgetBuilder.kType, func: HomeLastTransactionsWidgetBuilder.fromDynamic),
    (type: SubNavigationWidgetBuilder.kType, func: SubNavigationWidgetBuilder.fromDynamic),
    (type: OtpTitleWidgetBuilder.kType, func: OtpTitleWidgetBuilder.fromDynamic),
    (type: OtpMessageWidgetBuilder.kType, func: OtpMessageWidgetBuilder.fromDynamic),
    (type: OtpCountDownTimerWidgetBuilder.kType, func: OtpCountDownTimerWidgetBuilder.fromDynamic),
    (type: SecurityIconWidgetBuilder.kType, func: SecurityIconWidgetBuilder.fromDynamic),
    (type: AccountWelcomeScaffoldBuilder.kType, func: AccountWelcomeScaffoldBuilder.fromDynamic),
    (type: DemoCheckingNetworkDropdownFieldBuilder.kType, func: DemoCheckingNetworkDropdownFieldBuilder.fromDynamic),
    (type: AccountsCustomInfoTextBuilder.kType, func: AccountsCustomInfoTextBuilder.fromDynamic),
    (type: CustomNeoTransitionButtonBuilder.kType, func: CustomNeoTransitionButtonBuilder.fromDynamic),
    (type: DemoMaturityNetworkDropdownFieldBuilder.kType, func: DemoMaturityNetworkDropdownFieldBuilder.fromDynamic),
    (
      type: DemoMaturityRenewalNetworkDropdownFieldBuilder.kType,
      func: DemoMaturityRenewalNetworkDropdownFieldBuilder.fromDynamic,
    ),
    (type: AnimatedIconBuilder.kType, func: AnimatedIconBuilder.fromDynamic),
    (type: NeoNetworkDropdownFormFieldBuilder2.kType, func: NeoNetworkDropdownFormFieldBuilder2.fromDynamic),
    (type: NeoPhoneNumberFormFieldBuilder.kType, func: NeoPhoneNumberFormFieldBuilder.fromDynamic),
    (type: NeoHypertextWidgetBuilder.kType, func: NeoHypertextWidgetBuilder.fromDynamic),
    (type: NeoImageBuilder.kType, func: NeoImageBuilder.fromDynamic),
  ];

  void init() {
    final Map<String, JsonWidgetBuilderContainer> buildersMap = {};
    for (final pair in _widgetBuilderPairs) {
      buildersMap[pair.type] = JsonWidgetBuilderContainer(builder: pair.func);
    }
    // STOPSHIP: Delete these demo builder loop
    for (final pair in _demoWidgetBuilderPairs) {
      buildersMap[pair.type] = JsonWidgetBuilderContainer(builder: pair.func);
    }
    registry.registerCustomBuilders(buildersMap);
  }
}
