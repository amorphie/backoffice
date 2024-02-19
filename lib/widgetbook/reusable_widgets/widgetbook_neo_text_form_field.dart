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
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_text_form_field_bottom_text_message_type.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_text_form_field_bottom_text_model.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_text_validation_model.dart';
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
            titleIconUrn: context.knobs.stringOrNull(label: 'Title Icon Urn', initialValue: NeoAssets.informationCircle16px.urn),
            titleText: context.knobs.string(label: 'Title Text', initialValue: "Title Text"),
            subtitleText: context.knobs.string(label: 'Subtitle Text', initialValue: "Subtitle Text"),
            labelInitialText: context.knobs.string(label: 'Label Initial Text'),
            validations: [
              NeoTextValidationModel(regex: r"^(?!\s*$).+", message: "Bu alan boş bırakılamaz, lütfen doldurun!"),
              NeoTextValidationModel(
                regex: r'^[1-9]{1}[0-9]{9}[02468]{1}$',
                message: "Yanlış bilgi girdiniz, lütfen kontrol ediniz.",
              ),
            ],
            maxLength: context.knobs.doubleOrNull.input(label: 'Max Length')?.toInt(),
            bottomText: NeoTextFormFieldBottomTextModel(
              iconUrn: context.knobs.string(label: 'Bottom Text Icon Urn', initialValue: NeoAssets.informationCircle16px.urn),
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
            iconLeftUrn: context.knobs.stringOrNull(label: 'Icon Left Urn', initialValue: NeoAssets.informationCircle16px.urn),
            iconRightUrn: context.knobs.stringOrNull(label: 'Icon Right Urn', initialValue: NeoAssets.informationCircle16px.urn),
          ),
        ),
      ),
    ],
  );
}
