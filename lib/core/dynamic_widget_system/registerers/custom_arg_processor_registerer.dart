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
import 'package:backoffice/reusable_widgets/neo_account_widget/models/neo_account_balance.dart';
import 'package:backoffice/reusable_widgets/neo_account_widget/models/neo_account_sub_type.dart';
import 'package:backoffice/reusable_widgets/neo_account_widget/models/neo_account_type.dart';
import 'package:backoffice/reusable_widgets/neo_app_bar/model/neo_app_bar_left_widget_type.dart';
import 'package:backoffice/reusable_widgets/neo_avatar/model/neo_avatar_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_badge/model/neo_badge_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_button/model/neo_button_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_button/model/neo_button_enable_state.dart';
import 'package:backoffice/reusable_widgets/neo_button/model/neo_button_size.dart';
import 'package:backoffice/reusable_widgets/neo_card_details/model/neo_card_details_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_checkbox/model/neo_checkbox_item_model.dart';
import 'package:backoffice/reusable_widgets/neo_customer_name/models/neo_customer_name_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown/item_models/neo_dropdown_type.dart';
import 'package:backoffice/reusable_widgets/neo_information_card/model/neo_information_card_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_popup/model/neo_popup_type.dart';
import 'package:backoffice/reusable_widgets/neo_radio_button_group/model/neo_radio_button_item_model.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_button_data_model.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_keyboard_type.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_text_form_field_bottom_text_model.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_text_validation_model.dart';
import 'package:neo_core/core/navigation/models/neo_navigation_type.dart';

class CustomArgProcessorRegisterer {
  static final registry = JsonWidgetRegistry.instance;

  void init() {
    // TODO: Order enum values alphabetically to prevent possible conflicts!
    registry.registerArgProcessors(<ArgProcessor>[
      NeoEnumArgProcessor(type: "NeoAccountSubType", fromJson: NeoAccountSubType.fromJson),
      NeoEnumArgProcessor(type: "NeoAccountType", fromJson: NeoAccountType.fromJson),
      NeoEnumArgProcessor(type: "NeoAppBarLeftWidgetType", fromJson: NeoAppBarLeftWidgetType.fromJson),
      NeoEnumArgProcessor(type: "NeoAvatarDisplayMode", fromJson: NeoAvatarDisplayMode.fromJson),
      NeoEnumArgProcessor(type: "NeoBadgeDisplayMode", fromJson: NeoBadgeDisplayMode.fromJson),
      NeoEnumArgProcessor(type: "NeoButtonDisplayMode", fromJson: NeoButtonDisplayMode.fromJson),
      NeoEnumArgProcessor(type: "NeoButtonEnableState", fromJson: NeoButtonEnableState.fromJson),
      NeoEnumArgProcessor(type: "NeoButtonSize", fromJson: NeoButtonSize.fromJson),
      NeoEnumArgProcessor(type: "NeoCardDetailsDisplayMode", fromJson: NeoCardDetailsDisplayMode.fromJson),
      NeoEnumArgProcessor(type: "NeoCustomerNameDisplayMode", fromJson: NeoCustomerNameDisplayMode.fromJson),
      NeoEnumArgProcessor(type: "NeoDropdownType", fromJson: NeoDropdownType.fromJson),
      NeoEnumArgProcessor(type: "NeoInformationCardDisplayMode", fromJson: NeoInformationCardDisplayMode.fromJson),
      NeoEnumArgProcessor(type: "NeoKeyboardType", fromJson: NeoKeyboardType.fromJson),
      NeoEnumArgProcessor(type: "NeoNavigationType", fromJson: NeoNavigationType.fromJson),
      NeoEnumArgProcessor(type: "NeoPopupType", fromJson: NeoPopupType.fromJson),
      NeoModelArgProcessor(type: "NeoAccountBalance", fromJson: NeoAccountBalance.fromJson),
      NeoModelArgProcessor(type: "NeoButtonDataModel", fromJson: NeoButtonDataModel.fromJson),
      NeoModelArgProcessor(type: "NeoCheckboxItemModel", fromJson: NeoCheckboxItemModel.fromJson),
      NeoModelArgProcessor(type: "NeoRadioButtonItemModel", fromJson: NeoRadioButtonItemModel.fromJson),
      NeoModelArgProcessor(type: "NeoTextFormFieldBottomTextModel", fromJson: NeoTextFormFieldBottomTextModel.fromJson),
      NeoModelArgProcessor(type: "NeoTextValidationModel", fromJson: NeoTextValidationModel.fromJson),

      /// Keep [ArgProcessors.defaults] last item in the list.
      /// Order is very important!
      ...ArgProcessors.defaults,
    ]);
  }
}
