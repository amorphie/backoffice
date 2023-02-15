import 'package:admin/core/export/_.dart';

import '../../screens/resource/resource_screen.dart';

class ResourcePage extends StatefulWidget {
  const ResourcePage({Key? key}) : super(key: key);

  @override
  State<ResourcePage> createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      builder: (context, c) => ResourceScreen(),
    );
  }
}
