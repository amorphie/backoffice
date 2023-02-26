import 'package:admin/core/export/_.dart';

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
                await c.user.addUser(model);
                Navigator.pop(context);
              },
            ));
  }
}
