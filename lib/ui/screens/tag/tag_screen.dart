// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:admin/core/export/_.dart';

import '../../tables/my_data_table/my_data_table.dart';
import '../../tables/table_base.dart';

class TagScreen extends StatelessWidget {
  final List<TagModel> tagList;
  final TagModel tag;
  const TagScreen({
    Key? key,
    required this.tagList,
    required this.tag,
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
                        MyDataTable<UserModel>(
                          items: tagList
                              .map(
                                (user) => MyDataTableRow<UserModel>(
                                  onPressed: (item) {},
                                  cells: [
                                    // ...user.columns.map((e) => MyDataTableCell(title: e, text: user.toMap()[e].toString())),
                                    MyDataTableCell.set("Reference", tag.id),
                                    MyDataTableCell(
                                        title: "Name", text: tag.tagName),
                                  ],
                                ),
                              )
                              .toList(),
                          onSelect: (a) {},
                          onFilter: (value) {},
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
