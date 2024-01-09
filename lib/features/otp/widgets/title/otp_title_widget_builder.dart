import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/features/otp/widgets/title/otp_title_widget.dart';

part 'otp_title_widget_builder.g.dart';

@JsonWidget(type: 'otp_title_widget')
abstract class _OtpTitleWidgetBuilder extends JsonWidgetBuilder {
  const _OtpTitleWidgetBuilder({
    required super.args,
  });

  @override
  OtpTitleWidget buildCustom({
    required BuildContext context,
    required JsonWidgetData data,
    ChildWidgetBuilder? childBuilder,
    Key? key,
  });
}
