import '../../../core/export/_.dart';

class UserDetailPage extends StatefulWidget {
  const UserDetailPage({Key? key}) : super(key: key);

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        builder: (context, c) => UserDetailScreen(
              user: c.user.userModel,
            ));
  }
}
