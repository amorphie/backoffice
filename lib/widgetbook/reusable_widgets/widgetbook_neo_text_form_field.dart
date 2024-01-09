/*
 * 
 * Neobank.Client
 * 
 * Created on 23/11/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown_form_field/model/neo_dropdown_data_model.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown_form_field/model/neo_dropdown_list_tile_data.dart';
import 'package:backoffice/reusable_widgets/neo_dropdown_form_field/model/neo_dropdown_type.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_text_form_field_bottom_text_message_type.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_text_form_field_bottom_text_model.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/neo_text_form_field.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookNeoTextFormField {
  final Map<String, dynamic> initialData = {};

  return WidgetbookComponent(
    name: 'NeoTextFormField',
    useCases: [
      WidgetbookUseCase(
        name: 'Default',
        builder: (context) => BlocProvider(
          create: (context) => WorkflowFormBloc()..add(WorkflowFormEventAddAllParameters(initialData)),
          child: NeoTextFormField(
            labelText: context.knobs.stringOrNull(label: 'Label Text', initialValue: 'TCKN / VKN'),
            titleIconUrn: context.knobs.stringOrNull(label: 'Title Icon Urn', initialValue: NeoAssets.helpCircle.urn),
            titleText: context.knobs.string(label: 'Title Text', initialValue: "Title Text"),
            subtitleText: context.knobs.string(label: 'Subtitle Text', initialValue: "Subtitle Text"),
            labelInitialText: context.knobs.string(label: 'Label Initial Text'),
            validationRegex: context.knobs.stringOrNull(label: 'Validation Regex', initialValue: r'^[1-9]{1}[0-9]{9}[02468]{1}$'),
            maxLength: context.knobs.doubleOrNull.input(label: 'Max Length')?.toInt(),
            bottomText: NeoTextFormFieldBottomTextModel(
              iconUrn: context.knobs.string(label: 'Bottom Text Icon Urn', initialValue: NeoAssets.helpCircle.urn),
              message: context.knobs.string(label: 'Bottom Text Message', initialValue: 'bottom message'),
              messageType: context.knobs.list<NeoTextFormFieldBottomTextMessageType>(
                label: "Bottom Text Type",
                labelBuilder: (value) {
                  switch (value) {
                    case NeoTextFormFieldBottomTextMessageType.info:
                      return 'info';
                    case NeoTextFormFieldBottomTextMessageType.warning:
                      return 'warning';
                    case NeoTextFormFieldBottomTextMessageType.error:
                      return 'error';
                  }
                },
                options: NeoTextFormFieldBottomTextMessageType.values,
              ),
            ),
            enabled: context.knobs.boolean(label: 'Is Enabled', initialValue: true),
            obscureText: context.knobs.boolean(label: 'Is Obscure Text'),
            iconLeftUrn: context.knobs.stringOrNull(label: 'Icon Left Urn', initialValue: NeoAssets.plusCircle.urn),
            iconRightUrn: context.knobs.stringOrNull(label: 'Icon Right Urn', initialValue: NeoAssets.plusCircle.urn),
            dropdownLeft: NeoDropdownDataModel(
              dataKey: "",
              items: context.knobs.listOrNull<List<NeoDropdownListTileData>?>(
                label: "Dropdown Left Items",
                options: [
                  [
                    NeoDropdownListTileData(formData: "", displayData: "USD"),
                    NeoDropdownListTileData(formData: "", displayData: "TL"),
                    NeoDropdownListTileData(formData: "", displayData: "EUR"),
                  ],
                ],
              ).orEmptyList,
              dropdownType: NeoDropdownType.securityQuestion, // TODO: Update here
            ),
            dropdownRight: NeoDropdownDataModel(
              dataKey: "",
              items: context.knobs.listOrNull<List<NeoDropdownListTileData>?>(
                label: "Dropdown Right Items",
                options: [
                  [
                    NeoDropdownListTileData(formData: "", displayData: "USD"),
                    NeoDropdownListTileData(formData: "", displayData: "TL"),
                    NeoDropdownListTileData(formData: "", displayData: "EUR"),
                  ],
                ],
              ).orEmptyList,
              dropdownType: NeoDropdownType.securityQuestion, // TODO: Update here
            ),
          ),
        ),
      ),
    ],
  );
}
