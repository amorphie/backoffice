import '../../../../helpers/exporter.dart';

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
