/*
 * 
 * Neobank.Client
 * 
 * Created on 19/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:backoffice/reusable_widgets/neo_tckn_form_field/neo_tckn_form_field.dart';
import 'package:backoffice/reusable_widgets/neo_text_form_field/model/neo_text_validation_model.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent get widgetbookNeoTcknFormField => WidgetbookComponent(
      name: 'NeoTcknFormField',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => NeoTcknFormField(
            labelText: context.knobs.stringOrNull(label: 'Label Text', initialValue: 'TCKN / VKN'),
            errorText: context.knobs.stringOrNull(label: 'Error Text', initialValue: 'Yanlış bilgi girdiniz, lütfen kontrol ediniz.'),
            validations: [
              NeoTextValidationModel(regex: r"^(?!\s*$).+", message: "Bu alan boş bırakılamaz, lütfen doldurun!"),
            ],
          ),
        ),
      ],
    );
