import 'package:admin/core/export/_.dart';
import 'package:get/get.dart';

class UserAddPage extends StatelessWidget {
  const UserAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
        init: (c) async {
          c.tag.getTags();
        },
        builder: (context, c) => UserAddScreen(
              model: c.user.user,
              tagList: c.tag.tagList,
              userAddPressed: (model) async {
                bool result = await c.user.addUser(model);
                if (result) {
                  c.user.getUsers();
                  Get.snackbar("Başarılı", "Başardık", backgroundColor: Colors.green);
                  Navigator.pop(context);
                } else {
                  Get.snackbar("Neyi Başaramadın", "Başaramadı", backgroundColor: Colors.red);
                }
              },
            ));
  }
}
