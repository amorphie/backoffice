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
import 'package:backoffice/features/login/widgets/login_app_bar/login_app_bar.dart';

part 'login_app_bar_builder.g.dart';

@JsonWidget(type: 'login_app_bar')
abstract class _LoginAppBarBuilder extends JsonWidgetBuilder {
  const _LoginAppBarBuilder({
    required super.args,
  });

  @override
  LoginAppBar buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
