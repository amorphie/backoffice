// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:admin/core/export/_.dart';

import '../../../core/models/role_group.dart';
import '../../tables/my_data_table/my_data_table.dart';

class RoleGroupScreen extends StatelessWidget {
  final List<RoleGroupModel> list;
  final RoleGroupModel model;
  const RoleGroupScreen({
    Key? key,
    required this.list,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          primary: false,
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        SizedBox(height: defaultPadding),
                        MyDataTable<RoleGroupModel>(
                          items: list
                              .map(
                                (model) => MyDataTableRow<RoleGroupModel>(
                                  onPressed: (item) {},
                                  cells: [
                                    // ...user.columns.map((e) => MyDataTableCell(title: e, text: user.toMap()[e].toString())),
                                    MyDataTableCell.set("Name", model.id!),
                                    MyDataTableCell.set(
                                        "TTL", model.titles.toString()),
                                    MyDataTableCell.set("Url", model.status!),
                                    MyDataTableCell.set(
                                        "Tags", model.tags!.toString()),
                                  ],
                                ),
                              )
                              .toList(),
                          onSelect: (a) {},
                          onRefresh: (value) {
                            print('refreshed');
                          },
                          addPress: () {
                            print('add pressed');
                          },
                        ),
                        //!YENİ

                        if (Responsive.isMobile(context))
                          SizedBox(height: defaultPadding),
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context))
                    SizedBox(width: defaultPadding),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
