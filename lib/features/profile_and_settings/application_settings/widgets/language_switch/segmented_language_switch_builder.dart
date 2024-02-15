/*
 * neo_bank
 *
 * Created on 19/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/features/profile_and_settings/application_settings/widgets/language_switch/segmented_language_switch.dart';

part 'segmented_language_switch_builder.g.dart';

@JsonWidget(type: 'segmented_language_switch')
abstract class _SegmentedLanguageSwitchBuilder extends JsonWidgetBuilder {
  const _SegmentedLanguageSwitchBuilder({required super.args});

  @override
  SegmentedLanguageSwitch buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
