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

import 'package:backoffice/reusable_widgets/neo_dropdown_form_field/model/neo_dropdown_form_field_display_mode.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown_form_field/model/neo_dropdown_list_tile_data.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown_form_field/model/neo_dropdown_type.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown_form_field/neo_dropdown_form_field.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookNeoDropdownFormField => WidgetbookComponent(
      name: 'NeoDropdownFormField',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => NeoDropdownFormField(
            isHighlighted: context.knobs.boolean(label: "Is Highlighted"),
            displayMode: context.knobs.list(
              label: "Display Mode",
              labelBuilder: (value) {
                switch (value) {
                  case NeoDropdownFormFieldDisplayMode.defaultMode:
                    return 'default';
                  case NeoDropdownFormFieldDisplayMode.noBorder:
                    return 'noBorder';
                }
              },
              options: NeoDropdownFormFieldDisplayMode.values,
            ),
            labelText: context.knobs.string(label: 'Label Text'),
            itemList: [
              NeoDropdownListTileData(formData: "", displayData: "USD"),
              NeoDropdownListTileData(formData: "", displayData: "TL"),
              NeoDropdownListTileData(formData: "", displayData: "EUR"),
            ],
            dropdownType: NeoDropdownType.securityQuestion, // TODO: Update here
          ).paddingAll(NeoDimens.px16),
        ),
      ],
    );
