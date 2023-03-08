// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:admin/core/models/domain.dart';
import 'package:admin/ui/pages/domain/domain_add_page.dart';

import '../../../core/export/_.dart';
import '../../tables/my_data_table/my_data_table.dart';

class DomainScreen extends StatelessWidget {
  final DomainModel model;
  final List<DomainModel> list;
  final Function(DomainModel model) selectModel;
  const DomainScreen({
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
                        MyDataTable<DomainModel>(
                          items: list
                              .map(
                                (model) => MyDataTableRow<DomainModel>(
                                  onPressed: (item) {},
                                  cells: [
                                    // ...user.columns.map((e) => MyDataTableCell(title: e, text: user.toMap()[e].toString())),
                                    MyDataTableCell.set("ID", model.name!),

                                    MyDataTableCell.set(
                                        "Url", model.description!),
                                    MyDataTableCell.set(
                                        "Url", model.entities!.toString()),
                                  ],
                                ),
                              )
                              .toList(),
                          onSelect: (a) {},
                          onSearch: (value) {
                            print('refreshed');
                          },
                          addPress: () {
                            addItemPopUp(context, child: DomainAddPage());
                          },
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
