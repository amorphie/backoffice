/*
 * neo_bank
 *
 * Created on 26/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/features/login/widgets/login_credentials_form/login_credential_form.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_button_data_model.dart';

part 'login_credential_form_builder.g.dart';

@JsonWidget(type: 'login_credential_form')
abstract class _LoginCredentialFormBuilder extends JsonWidgetBuilder {
  const _LoginCredentialFormBuilder({
    required super.args,
  });

  // TODO: Inspect why this decoder is necessary
  @JsonArgDecoder('passwordButtonRight')
  NeoButtonDataModel _decodePasswordButtonRight({required JsonWidgetData data}) => NeoButtonDataModel.fromJson(data.jsonWidgetArgs['passwordButtonRight']);

  @override
  LoginCredentialForm buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
