import 'package:admin/core/export/_.dart';

class UserEditPage extends StatelessWidget {
  const UserEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
        builder: (context, c) => UserEditScreen(model: c.user.user));
  }
}
