import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class TitleDescriptionRenderWidget extends JsonWidgetBuilder {
  const TitleDescriptionRenderWidget({
    this.title = "",
    this.text = "",
  }) : super(args: "");

  static const kNumSupportedChildren = -1;

  final String title;
  final String text;

  static TitleDescriptionRenderWidget fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return TitleDescriptionRenderWidget(
      title: map["title"],
      text: map["text"],
    );
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        Text(text, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
      ],
    );
  }

  @override
  JsonWidgetBuilderModel createModel({ChildWidgetBuilder? childBuilder, required JsonWidgetData data}) {
    // TODO: implement createModel
    throw UnimplementedError();
  }

  @override
  String get type => "title_description_render_widget";
}
