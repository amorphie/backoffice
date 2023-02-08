import 'package:admin/core/export/_.dart';

class WorkflowTabPage extends StatefulWidget {
  const WorkflowTabPage({Key? key}) : super(key: key);

  @override
  State<WorkflowTabPage> createState() => _WorkflowTabPageState();
}

class _WorkflowTabPageState extends State<WorkflowTabPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(builder: (context, c) => WorkflowTab());
  }
}
