// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/screens/dashboard/widgets/my_files.dart';

import '../../core/export/_.dart';

class DashboardScreen extends StatelessWidget {
  final UserModel user;
  const DashboardScreen({
    Key? key,
    required this.user,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            // Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      MyFiles(),
                      SizedBox(height: 30),
                      UserList(model: user),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      // if (Responsive.isMobile(context)) StarageDetails(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we dont want to show it
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: UserDetailScreen(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
