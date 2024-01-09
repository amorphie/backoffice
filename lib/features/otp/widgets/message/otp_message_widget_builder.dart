import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/features/otp/widgets/message/otp_message_widget.dart';

part 'otp_message_widget_builder.g.dart';

@JsonWidget(type: 'otp_message_widget')
abstract class _OtpMessageWidgetBuilder extends JsonWidgetBuilder {
  const _OtpMessageWidgetBuilder({
    required super.args,
  });

  @override
  OtpMessageWidget buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
