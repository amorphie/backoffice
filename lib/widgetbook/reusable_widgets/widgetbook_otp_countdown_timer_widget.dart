import 'package:backoffice/features/otp/widgets/count_down_timer/otp_count_down_timer_widget.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:widgetbook/widgetbook.dart';

// STOPSHIP: Delete this ignore
// ignore_for_file: deprecated_member_use_from_same_package
WidgetbookComponent get widgetbookOtpCountdownTimerWidget => WidgetbookComponent(
      name: 'OtpCountdownTimerWidget',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => OtpCountDownTimerWidget(
            durationInSeconds: context.knobs.double
                .input(
                  label: 'Otp Time',
                  initialValue: 120.0,
                )
                .toInt(),
          ).paddingAll(16),
        ),
      ],
    );
