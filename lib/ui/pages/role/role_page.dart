import 'package:admin/core/export/_.dart';
import 'package:admin/ui/screens/role/role_group_screen.dart';
import 'package:admin/ui/screens/role/role_screen.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RolePage extends StatefulWidget {
  const RolePage({Key? key}) : super(key: key);

  @override
  State<RolePage> createState() => _RolePageState();
}

class _RolePageState extends State<RolePage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        init: (c) async {
          await c.role.getRoles();
        },
        builder: (context, c) => Obx(
              () => RoleScreen(
                list: c.role.roleList,
                model: c.role.role,
              ),
            ));
  }
}
