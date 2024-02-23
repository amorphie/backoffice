/*
 * neo_bank
 *
 * Created on 20/02/2024.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/features/security_question_update/old_security_question_field.dart';

part 'old_security_question_field_builder.g.dart';

@JsonWidget(type: 'old_security_question_field')
abstract class _OldSecurityQuestionFieldBuilder extends JsonWidgetBuilder {
  const _OldSecurityQuestionFieldBuilder({required super.args});

  @override
  OldSecurityQuestionField buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
