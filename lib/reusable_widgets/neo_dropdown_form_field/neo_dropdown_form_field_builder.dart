/*
 * 
 * Neobank.Client
 * 
 * Created on 27/11/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown_form_field/model/neo_dropdown_form_field_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown_form_field/model/neo_dropdown_list_tile_data.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown_form_field/model/neo_dropdown_type.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown_form_field/neo_dropdown_form_field.dart';

part 'neo_dropdown_form_field_builder.g.dart';

class _Constants {
  _Constants._();

  static const itemListKey = 'itemList';
}

@JsonWidget(type: 'neo_dropdown_form_field')
abstract class _NeoDropdownFormFieldBuilder extends JsonWidgetBuilder {
  const _NeoDropdownFormFieldBuilder({
    required super.args,
  });

  @JsonArgDecoder(_Constants.itemListKey)
  List<NeoDropdownListTileData> _decodeItemList({required JsonWidgetData data}) =>
      (data.jsonWidgetArgs[_Constants.itemListKey] as List<dynamic>).map((e) => NeoDropdownListTileData.fromJson(e)).toList();

  @override
  NeoDropdownFormField buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
