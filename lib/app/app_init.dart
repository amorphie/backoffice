import 'package:admin/pages/dashboard/dashboard_page.dart';

import '../core/base/base_view.dart';
import '../core/export/_.dart';

class AppInit extends StatelessWidget {
  const AppInit({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(builder: (context, c) {
      return DashboardPage();
    });
  }
}
