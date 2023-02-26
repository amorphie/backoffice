// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../core/export/_.dart';
import '../../tables/my_data_table/my_data_table.dart';
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
                      //MyFiles(),
                      // SizedBox(height: 30),

                      MyDataTable<UserModel>(
                        items: userList
                            .map(
                              (user) => MyDataTableRow<UserModel>(
                                onPressed: (item) {},
                                cells: [
                                  // ...user.columns.map((e) => MyDataTableCell(title: e, text: user.toMap()[e].toString())),
                                  MyDataTableCell.set(
                                      "Reference", user.reference),
                                  MyDataTableCell(
                                      title: "Name", text: user.fullName),
                                  if (user.tags!.isNotEmpty)
                                    MyDataTableCell(
                                        title: "Tags", text: user.tags!.first),
                                ],
                              ),
                            )
                            .toList(),
                        onSelect: selectUser,
                        onFilter: (value) {},
                      ), //! DAHA YENİ

                      TableBase(
                          items: userList,
                          onSelect: (user) {
                            selectUser(user as UserModel);
                          },
                          onFilter: (item) {}), //!YENİ

                      // UserTable(select: selectUser), //!ESKİ
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
