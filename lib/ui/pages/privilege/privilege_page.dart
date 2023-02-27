import 'package:admin/core/export/_.dart';
import 'package:admin/ui/screens/privilege/privilege_screen.dart';
import 'package:get/get.dart';

class PrivilegePage extends StatefulWidget {
  const PrivilegePage({Key? key}) : super(key: key);

  @override
  State<PrivilegePage> createState() => _PrivilegePageState();
}

class _PrivilegePageState extends State<PrivilegePage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      init: (c) async {
        await c.privilege.getAllPrivileges();
      },
      builder: (context, c) => Obx(() {
        return PrivilegeScreen(
            model: c.privilege.privilege,
            list: c.privilege.privilegeList,
            selectModel: (model) {});
      }),
    );
  }
}
