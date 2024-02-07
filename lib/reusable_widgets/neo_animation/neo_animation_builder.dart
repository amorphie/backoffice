/*
 * Neobank.Client
 *
 * Created on 14/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_animation/neo_animation.dart';

part 'neo_animation_builder.g.dart';

@JsonWidget(type: 'neo_animation')
abstract class _NeoAnimationBuilder extends JsonWidgetBuilder {
  const _NeoAnimationBuilder({
    required super.args,
  });

  @override
  NeoAnimation buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}