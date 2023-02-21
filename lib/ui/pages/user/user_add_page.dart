import 'package:admin/core/export/_.dart';

class UserAddPage extends StatelessWidget {
  const UserAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
        builder: (context, c) => UserAddScreen(
              model: c.user.user,
              userAddPressed: (ref, firstName, lastName, phone, emil, tags) async {
                // print("object");
              },
            ));
  }
}
