/*
 * 
 * Neobank.Client
 * 
 * Created on 13/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/core/dynamic_widget_system/arg_processors/neo_enum_arg_processor.dart';
import 'package:backoffice/core/dynamic_widget_system/arg_processors/neo_model_arg_processor.dart';
import 'package:backoffice/reusable_widgets/neo_app_bar/model/neo_app_bar_left_widget_type.dart';
import 'package:backoffice/reusable_widgets/neo_button/model/neo_button_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_button/model/neo_button_size.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown_form_field/model/neo_dropdown_data_model.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown_form_field/model/neo_dropdown_form_field_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown_form_field/model/neo_dropdown_type.dart';
import 'package:backoffice/reusable_widgets/neo_popup/model/neo_popup_type.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_button_data_model.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_keyboard_type.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_text_form_field_bottom_text_model.dart';

class CustomArgProcessorRegisterer {
  static final registry = JsonWidgetRegistry.instance;

  void init() {
    registry.registerArgProcessors(<ArgProcessor>[
      NeoEnumArgProcessor(type: "NeoButtonSize", fromJson: NeoButtonSize.fromJson),
      NeoEnumArgProcessor(type: "NeoButtonDisplayMode", fromJson: NeoButtonDisplayMode.fromJson),
      NeoEnumArgProcessor(type: "NeoDropdownFormFieldDisplayMode", fromJson: NeoDropdownFormFieldDisplayMode.fromJson),
      NeoEnumArgProcessor(type: "NeoDropdownType", fromJson: NeoDropdownType.fromJson),
      NeoEnumArgProcessor(type: "NeoPopupType", fromJson: NeoPopupType.fromJson),
      NeoEnumArgProcessor(type: "NeoKeyboardType", fromJson: NeoKeyboardType.fromJson),
      NeoEnumArgProcessor(type: "NeoAppBarLeftWidgetType", fromJson: NeoAppBarLeftWidgetType.fromJson),
      NeoModelArgProcessor(type: "NeoTextFormFieldBottomTextModel", fromJson: NeoTextFormFieldBottomTextModel.fromJson),
      NeoModelArgProcessor(type: "NeoDropdownDataModel", fromJson: NeoDropdownDataModel.fromJson),
      NeoModelArgProcessor(type: "NeoButtonDataModel", fromJson: NeoButtonDataModel.fromJson),

      /// Keep [ArgProcessors.defaults] last item in the list.
      /// Order is very important!
      ...ArgProcessors.defaults,
    ]);
  }
}
