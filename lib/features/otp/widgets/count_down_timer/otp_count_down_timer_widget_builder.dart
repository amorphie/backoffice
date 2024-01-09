import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/features/otp/widgets/count_down_timer/otp_count_down_timer_widget.dart';

part 'otp_count_down_timer_widget_builder.g.dart';

@JsonWidget(type: 'otp_count_down_timer_widget')
abstract class _OtpCountDownTimerWidgetBuilder extends JsonWidgetBuilder {
  const _OtpCountDownTimerWidgetBuilder({
    required super.args,
  });

  @override
  OtpCountDownTimerWidget buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
