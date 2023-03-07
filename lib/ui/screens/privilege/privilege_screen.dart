// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:admin/core/models/privilege.dart';

import '../../../core/export/_.dart';
import '../../tables/my_data_table/my_data_table.dart';

class PrivilegeScreen extends StatelessWidget {
  final PrivilegeModel model;
  final List<PrivilegeModel> list;
  final Function(PrivilegeModel model) selectModel;
  const PrivilegeScreen({
    Key? key,
    required this.model,
    required this.list,
    required this.selectModel,
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
                        list.length > 0
                            ? MyDataTable<PrivilegeModel>(
                                items: list
                                    .map(
                                      (model) => MyDataTableRow<PrivilegeModel>(
                                        onPressed: (item) {},
                                        cells: [
                                          // ...user.columns.map((e) => MyDataTableCell(title: e, text: user.toMap()[e].toString())),

                                          MyDataTableCell.set(
                                              "TTL", model.ttl.toString()),
                                          MyDataTableCell.set(
                                              "Url", model.url!),
                                        ],
                                      ),
                                    )
                                    .toList(),
                                onSelect: (a) {},
                                onRefresh: (value) {
                                  print('refreshed');
                                },
                                addPress: () {
                                  privilegeAddPopUp(context);
                                },
                              )
                            : Center(
                                child: Text('No Data'),
                              ),
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
