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
