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
import 'package:backoffice/features/profile_and_settings/about_on_mobile/widgets/about_on_mobile_navigation_button/about_on_mobile_navigation_button.dart';

part 'about_on_mobile_navigation_button_builder.g.dart';

@JsonWidget(type: 'about_on_mobile_navigation_button')
abstract class _AboutOnMobileNavigationButtonBuilder extends JsonWidgetBuilder {
  const _AboutOnMobileNavigationButtonBuilder({required super.args});

  @override
  AboutOnMobileNavigationButton buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
