import 'package:json_dynamic_widget/json_dynamic_widget.dart';

@jsonWidget
abstract class _DetailWidgetBuilder extends JsonWidgetBuilder {
  const _DetailWidgetBuilder({
    required super.args,
  });

  @override
  _Detail buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
}

class _Detail extends StatelessWidget {
  final String? dataTitle;
  final String? dataDesc;

  const _Detail({
    this.dataTitle,
    this.dataDesc,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        renderWidget(dataTitle!, dataDesc!),
      ],
    );
  }

  Column renderWidget(String title, String desc) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        SizedBox(height: 5),
        Text(
          desc,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
        ),
      ],
    );
  }
}
