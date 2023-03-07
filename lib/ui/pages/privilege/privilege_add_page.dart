import 'package:admin/core/export/_.dart';
import 'package:admin/ui/screens/privilege/privilege_add_screen.dart';
import 'package:admin/ui/screens/resource/resource_add_screen.dart';
import 'package:get/get.dart';

class PrivilegeAddPage extends StatefulWidget {
  const PrivilegeAddPage({Key? key}) : super(key: key);

  @override
  State<PrivilegeAddPage> createState() => _PrivilegeAddPageState();
}

class _PrivilegeAddPageState extends State<PrivilegeAddPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      init: (c) async {
        await c.resource.getAllResources();
      },
      builder: (context, c) => Obx(() {
        return PrivilegeAddScreen(
          tagList: c.tag.tagList,
          model: c.privilege.privilege,
          addPressed: (model) async {
            bool result = await c.privilege.addPrivilege(model);
            if (result) {
              c.resource.getAllResources();
              Get.snackbar("Başarılı", "Başardık",
                  backgroundColor: Colors.green);
              Navigator.pop(context);
            } else {
              Get.snackbar("Sıkıntı", "Başaramadı",
                  backgroundColor: Colors.red);
            }
          },
        );
      }),
    );
  }
}
