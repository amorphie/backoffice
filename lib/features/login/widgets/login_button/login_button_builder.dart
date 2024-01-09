/*
 * neo_bank
 *
 * Created on 15/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/features/login/widgets/login_button/login_button.dart';

part 'login_button_builder.g.dart';

@JsonWidget(type: 'login_button')
abstract class _LoginButtonBuilder extends JsonWidgetBuilder {
  const _LoginButtonBuilder({required super.args});

  @override
  LoginButton buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
