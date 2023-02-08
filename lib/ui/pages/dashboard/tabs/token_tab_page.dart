import 'package:admin/core/export/_.dart';

class TokenTabPage extends StatefulWidget {
  const TokenTabPage({Key? key}) : super(key: key);

  @override
  State<TokenTabPage> createState() => _TokenTabPageState();
}

class _TokenTabPageState extends State<TokenTabPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(builder: (context, c) => TokenTab());
  }
}
