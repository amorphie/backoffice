/*
 * neo_bank
 *
 * Created on 16/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_bottom_navigation_page/models/neo_bottom_navigation_model.dart';
import 'package:backoffice/reusable_widgets/neo_bottom_navigation_page/neo_bottom_navigation_page.dart';

part 'neo_bottom_navigation_page_builder.g.dart';

abstract class _Constants {
  static const tabModelsKey = "tabs";
}

@JsonWidget(type: 'neo_bottom_navigation_page')
abstract class _NeoBottomNavigationPageBuilder extends JsonWidgetBuilder {
  const _NeoBottomNavigationPageBuilder({required super.args});

  @JsonArgDecoder(_Constants.tabModelsKey)
  List<NeoBottomNavigationModel> _decodeBottomNavigationModelList({required JsonWidgetData data}) {
    final listJson = data.jsonWidgetArgs[_Constants.tabModelsKey];
    return listJson != null ? List<Map<String, dynamic>>.from(listJson).map(NeoBottomNavigationModel.fromJson).toList() : [];
  }

  @override
  NeoBottomNavigationPage buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
