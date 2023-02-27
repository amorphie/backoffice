import 'package:admin/core/export/_.dart';
import 'package:admin/ui/screens/role/role_group_screen.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RoleGroupPage extends StatefulWidget {
  const RoleGroupPage({Key? key}) : super(key: key);

  @override
  State<RoleGroupPage> createState() => _RoleGroupPageState();
}

class _RoleGroupPageState extends State<RoleGroupPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        init: (c) async {
          await c.roleGroup.getRoleGroups();
        },
        builder: (context, c) => Obx(() => RoleGroupScreen(
              list: c.roleGroup.roleGroupList,
              model: c.roleGroup.roleGroup,
            )));
  }
}
