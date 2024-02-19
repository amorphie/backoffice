/*
 * neo_bank
 *
 * Created on 30/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_icon_button/neo_icon_button.dart';

part 'neo_icon_button_builder.g.dart';

@JsonWidget(type: 'neo_icon_button')
abstract class _NeoIconButtonBuilder extends JsonWidgetBuilder {
  const _NeoIconButtonBuilder({
    required super.args,
  });

  @override
  NeoIconButton buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
