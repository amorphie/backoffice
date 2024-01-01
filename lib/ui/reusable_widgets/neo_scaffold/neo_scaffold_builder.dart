/*
 * 
 * Neobank.Client
 * 
 * Created on 18/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:flutter/gestures.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:admin/ui/reusable_widgets/neo_scaffold/neo_scaffold.dart';

part 'neo_scaffold_builder.g.dart';

@JsonWidget(type: 'neo_scaffold')
abstract class _NeoScaffoldBuilder extends JsonWidgetBuilder {
  const _NeoScaffoldBuilder({
    required super.args,
  });

  @override
  NeoScaffold buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
