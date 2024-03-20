import '../../../../helpers/exporter.dart';

part 'detail_title.g.dart';

@jsonWidget
abstract class _DetailTitle extends JsonWidgetBuilder {
  const _DetailTitle({
    required super.args,
  });

  @override
  DetailTitleWidget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    return DetailTitleWidget(
      title: args["title"],
    );
  }
}
