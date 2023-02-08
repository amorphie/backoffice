import 'package:admin/core/export/_.dart';

class ConsentTabPage extends StatefulWidget {
  const ConsentTabPage({Key? key}) : super(key: key);

  @override
  State<ConsentTabPage> createState() => _ConsentTabPageState();
}

class _ConsentTabPageState extends State<ConsentTabPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(builder: (context, c) => TokenTab());
  }
}
