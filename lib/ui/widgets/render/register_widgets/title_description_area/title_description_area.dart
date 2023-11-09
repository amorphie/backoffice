import 'package:json_dynamic_widget/json_dynamic_widget.dart';

import 'title_description_area_widget.dart';

part 'title_description_area.g.dart';

@jsonWidget
abstract class _TitleDescriptionArea extends JsonWidgetBuilder {
  const _TitleDescriptionArea({
    required super.args,
  });

  @override
  TitleDescriptionAreaWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    return TitleDescriptionAreaWidget(
      title: args["title"],
      text: args["text"],
      copyValue: args["copyValue"],
    );
  }
}
