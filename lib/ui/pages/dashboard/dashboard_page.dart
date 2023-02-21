import 'package:admin/core/export/_.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
        init: (c) async {
          await c.user.getUsers();
        },
        builder: (context, c) => Obx(() {
              return DashboardScreen(
                user: c.user.user,
                userList: c.user.userList,
                selectUser: (user) {
                  c.user.userModel = user;
                },
              );
            }));
  }
}
