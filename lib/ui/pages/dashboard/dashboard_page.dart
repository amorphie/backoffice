import 'package:admin/core/base/base_view.dart';
import 'package:admin/core/export/_.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
        builder: (context, c) => DashboardScreen(user: c.user.userModel));
  }
}
