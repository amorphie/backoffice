/*
 * neo_bank
 *
 * Created on 7/2/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_account_widget/neo_account_widget.dart';

part 'neo_account_widget_builder.g.dart';

@JsonWidget(type: 'neo_account_widget')
abstract class _NeoAccountWidgetBuilder extends JsonWidgetBuilder {
  const _NeoAccountWidgetBuilder({
    required super.args,
  });

  @override
  NeoAccountWidget buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
