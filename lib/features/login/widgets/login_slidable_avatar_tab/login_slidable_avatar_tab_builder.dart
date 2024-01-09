/*
 * neo_bank
 *
 * Created on 22/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/features/login/widgets/login_slidable_avatar_tab/login_slidable_avatar_tab.dart';

part 'login_slidable_avatar_tab_builder.g.dart';

@JsonWidget(type: 'login_slidable_avatar_tab')
abstract class _LoginSlidableAvatarTabBuilder extends JsonWidgetBuilder {
  const _LoginSlidableAvatarTabBuilder({
    required super.args,
  });

  @override
  LoginSlidableAvatarTab buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
