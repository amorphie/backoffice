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
import 'package:backoffice/features/otp/widgets/otp_security_image_widget.dart';

part 'otp_security_image_widget_builder.g.dart';

@JsonWidget(type: 'otp_security_image_widget')
abstract class _OtpSecurityImageWidgetBuilder extends JsonWidgetBuilder {
  const _OtpSecurityImageWidgetBuilder({
    required super.args,
  });

  @override
  OtpSecurityImageWidget buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
