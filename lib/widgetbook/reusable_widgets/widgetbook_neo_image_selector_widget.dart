import 'package:backoffice/reusable_widgets/neo_image_selector/neo_image_selector_widget.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:widgetbook/widgetbook.dart';

// STOPSHIP: Delete this ignore
// ignore_for_file: deprecated_member_use_from_same_package
WidgetbookComponent get widgetbookNeoImageSelectorWidget => WidgetbookComponent(
      name: 'BrgImageSelectorWidget',
      useCases: [
        WidgetbookUseCase(
          name: 'Default',
          builder: (context) => NeoImageSelectorWidget(
            crossAxisCount: context.knobs.doubleOrNull.input(label: 'Cross axis count', initialValue: 2)?.toInt() ?? 2,
            mainAxisSpacing: context.knobs.double.input(label: 'Main axis spacing', initialValue: 20),
            crossAxisSpacing: context.knobs.double.input(label: 'Cross axis spacing', initialValue: 20),
          ).paddingAll(24),
        ),
      ],
    );
