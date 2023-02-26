// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:admin/core/export/_.dart';

import '../../tables/my_data_table/my_data_table.dart';

class TagScreen extends StatelessWidget {
  final List<TagModel> list;
  final TagModel tag;
  const TagScreen({
    Key? key,
    required this.list,
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
                        //     TableBase(
                        //   items: list,
                        //   onSelect: (user) {
                        //   },
                        //   onFilter: (item) {}),
                        MyDataTable<TagModel>(
                          items: list
                              .map(
                                (tag) => MyDataTableRow<TagModel>(
                                  onPressed: (item) {},
                                  cells: [
                                    // ...user.columns.map((e) => MyDataTableCell(title: e, text: user.toMap()[e].toString())),
                                    MyDataTableCell.set("Name", tag.name!),
                                    MyDataTableCell.set(
                                        "TTL", tag.ttl!.toStringAsFixed(0)),
                                    MyDataTableCell.set("Url", tag.url!),
                                    MyDataTableCell.set(
                                        "Tags", tag.tags!.toString()),
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
