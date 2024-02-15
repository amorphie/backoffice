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

import 'package:backoffice/core/environment_variables/neo_environment_variable.dart';
import 'package:backoffice/reusable_widgets/neo_swipe_button/neo_swipe_button.dart';

abstract class _Constant {
  static const _transitionKeyClientId = "client_id";
  static const _transitionKeyClientSecret = "client_secret";
  static const _transitionKeyScopes = "scopes";
  static const _transitionKeyGrantType = "grant_type";
  static const _loginScopes = ["retail-customer", "openId"];
  static const _loginGrantType = "password";

  static Map<String, dynamic> transitionParams = {
    _Constant._transitionKeyClientId: NeoEnvironmentVariable.workflowClientId.value,
    _Constant._transitionKeyClientSecret: NeoEnvironmentVariable.workflowClientSecret.value,
    _Constant._transitionKeyScopes: _Constant._loginScopes,
    _Constant._transitionKeyGrantType: _Constant._loginGrantType,
  };
}

class LoginButton extends NeoSwipeButton {
  LoginButton({
    super.transitionId,
    super.labelText,
    super.loadingLabelText,
    super.startWorkflow,
    super.padding,
    super.formValidationRequired,
    super.key,
  }) : super(transitionParams: _Constant.transitionParams);
}
