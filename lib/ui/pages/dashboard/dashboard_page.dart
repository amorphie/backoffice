import 'package:admin/core/export/_.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
        builder: (context, c) => Obx(() {
              return DashboardScreen(
                user: c.user.userModel,
                selectUser: (user) {
                  c.user.userModel = user;
                },
              );
            }));
  }
}
