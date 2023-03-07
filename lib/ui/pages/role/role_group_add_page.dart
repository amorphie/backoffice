import 'package:admin/core/export/_.dart';
import 'package:admin/ui/screens/role/role_add_screen.dart';
import 'package:admin/ui/screens/role/role_group_add_screen.dart';
import 'package:get/get.dart';

class RoleGroupAddPage extends StatefulWidget {
  const RoleGroupAddPage({Key? key}) : super(key: key);

  @override
  State<RoleGroupAddPage> createState() => _RoleGroupAddPageState();
}

class _RoleGroupAddPageState extends State<RoleGroupAddPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        init: (c) async {
          await c.roleGroup.getRoleGroups();
        },
        builder: (context, c) => Obx(
              () => RoleGroupAddScreen(
                  model: c.roleGroup.roleGroup,
                  roleAddPressed: (model) async {
                    bool result = await c.roleGroup.addRoleGroup(model);
                    if (result) {
                      c.roleGroup.getRoleGroups();
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
