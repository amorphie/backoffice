import 'package:admin/core/export/_.dart';
import 'package:admin/ui/screens/role/role_add_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RoleAddPage extends StatefulWidget {
  const RoleAddPage({Key? key}) : super(key: key);

  @override
  State<RoleAddPage> createState() => _RoleAddPageState();
}

class _RoleAddPageState extends State<RoleAddPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        init: (c) async {
          await c.role.getRoles();
        },
        builder: (context, c) => Obx(
              () => RoleAddScreen(
                  model: c.role.role,
                  roleAddPressed: (model) async {
                    bool result = await c.role.addRole(model);
                    if (result) {
                      c.role.getRoles();
                      Get.snackbar("Başarılı", "Başardık",
                          backgroundColor: Colors.green);
                      Navigator.pop(context);
                    } else {
                      Get.snackbar("Sıkıntı", "Başaramadı",
                          backgroundColor: Colors.red);
                    }
                  },
                  tagList: c.tag.tagList),
            ));
  }
}
