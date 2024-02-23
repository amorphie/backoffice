/*
 * 
 * Neobank.Client
 * 
 * Created on 28/11/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'model/neo_bo_button_display_mode.dart';
import 'model/neo_bo_button_enable_state.dart';
import 'model/neo_bo_button_size.dart';
import 'package:neo_core/core/navigation/models/neo_navigation_type.dart';

import 'neo_bo_button.dart';

part 'neo_bo_button_builder.g.dart';

@JsonWidget(type: 'neo_button')
abstract class _NeoBoButtonBuilder extends JsonWidgetBuilder {
  const _NeoBoButtonBuilder({required super.args});

  @override
  NeoBoButton buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
