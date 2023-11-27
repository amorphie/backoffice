import '../../../helpers/exporter.dart';

class DynamicPage extends StatefulWidget {
  const DynamicPage({
    required this.jsonData,
    Key? key,
  }) : super(key: key);

  final Map<String, dynamic> jsonData;

  @override
  State<DynamicPage> createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> {
  late JsonWidgetData _data;
  @override
  void initState() {
    super.initState();
    _data = JsonWidgetData.fromDynamic(
      widget.jsonData,
      registry: jsonWidgetRegistry,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => _data.build(
        context: context,
      ),
    );
  }
}
