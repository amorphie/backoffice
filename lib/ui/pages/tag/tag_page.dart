import 'package:admin/core/export/_.dart';

class TagPage extends StatefulWidget {
  const TagPage({Key? key}) : super(key: key);

  @override
  State<TagPage> createState() => _TagPageState();
}

class _TagPageState extends State<TagPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      builder: (context, c) => TagScreen(),
    );
  }
}
