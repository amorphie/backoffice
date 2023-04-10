// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../core/export/_.dart';
import '../../tables/table_base.dart';

class DashboardScreen extends StatelessWidget {
  final UserModel user;
  final List<UserModel> userList;
  final Function(UserModel user) selectUser;
  const DashboardScreen({
    Key? key,
    required this.user,
    required this.userList,
    required this.selectUser,
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      TableBase(
                          items: userList,
                          onSelect: (user) {
                            selectUser(user as UserModel);
                          },
                          onFilter: (item) {}), //!YENİ

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
                  if (user.firstName != "")
                    Expanded(
                      flex: 2,
                      child: UserDetailScreen(
                        user: user,
                      ),
                    ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
