/*
 * Neobank.Client
 *
 * Created on 8/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:admin/ui/reusable_widgets/neo_icon/neo_icon.dart';

part 'neo_icon_builder.g.dart';

@JsonWidget(type: 'neo_icon')
abstract class _NeoIconBuilder extends JsonWidgetBuilder {
  const _NeoIconBuilder({
    required super.args,
  });

  @override
  NeoIcon buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
