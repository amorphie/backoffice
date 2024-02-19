/*
 * Neobank.Client
 *
 * Created on 24/01/2024.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_radio_button_group/model/neo_radio_button_item_model.dart';
import 'package:backoffice/reusable_widgets/neo_radio_button_group/neo_radio_button_group_widget.dart';

part 'neo_radio_button_group_widget_builder.g.dart';

abstract class _Constants {
  static const itemModelsKey = "items";
}

@JsonWidget(type: 'neo_radio_button_group_widget')
abstract class _NeoRadioButtonGroupWidgetBuilder extends JsonWidgetBuilder {
  const _NeoRadioButtonGroupWidgetBuilder({
    required super.args,
  });

  @JsonArgDecoder(_Constants.itemModelsKey)
  List<NeoRadioButtonItemModel> _decodeRadioButtonItemModelList({required JsonWidgetData data}) {
    final listJson = data.jsonWidgetArgs[_Constants.itemModelsKey];
    return listJson != null ? List<Map<String, dynamic>>.from(listJson).map(NeoRadioButtonItemModel.fromJson).toList() : [];
  }

  @override
  NeoRadioButtonGroupWidget buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
