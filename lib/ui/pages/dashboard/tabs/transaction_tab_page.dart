import 'package:admin/core/export/_.dart';

class TransactionTabPage extends StatefulWidget {
  const TransactionTabPage({Key? key}) : super(key: key);

  @override
  State<TransactionTabPage> createState() => _TransactionTabPageState();
}

class _TransactionTabPageState extends State<TransactionTabPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(builder: (context, c) => TransactionTab());
  }
}
