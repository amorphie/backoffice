import 'package:admin/core/export/_.dart';

class UserAddPage extends StatelessWidget {
  const UserAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
        builder: (context, c) => UserAddScreen(
              model: c.user.userModel,
              addUser: (user) {},
            ));
  }
}
