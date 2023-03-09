// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:admin/core/export/_.dart';
import 'package:admin/ui/pages/tag/tag_add_page.dart';

import '../../tables/my_data_table/my_data_table.dart';

class TagScreen extends StatefulWidget {
  final List<TagModel> list;
  final TagModel tag;
  final Function(String item) onSearch;
  const TagScreen({
    Key? key,
    required this.list,
    required this.tag,
    required this.onSearch,
  }) : super(key: key);

  @override
  State<TagScreen> createState() => _TagScreenState();
}

class _TagScreenState extends State<TagScreen> {
  List<TagModel>? filterData;
  late List<TagModel> tags;

  @override
  void initState() {
    super.initState();
    tags = widget.list;
    filterData = tags;
  }

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
                        MyDataTable<TagModel>(
                          items: widget.list
                              .map(
                                (tag) => MyDataTableRow<TagModel>(
                                  onPressed: (item) {},
                                  item: tag,
                                  cells: [
                                    // ...user.columns.map((e) => MyDataTableCell(title: e, text: user.toMap()[e].toString())),
                                    MyDataTableCell.set("Name", tag.name!),
                                    MyDataTableCell.set("TTL", tag.ttl!.toStringAsFixed(0)),
                                    MyDataTableCell.set("Url", tag.url!),
                                    MyDataTableCell.set("Tags", tag.tags!.toString()),
                                  ],
                                ),
                              )
                              .toList(),
                          onSelect: (a) {
                            print(widget.tag.name);
                          },
                          onSearch: (value) {
                            widget.onSearch(value);
                          },
                          addPress: () {
                            addItemPopUp(context, child: TagAddPage());
                          },
                        ),
                        //!YENİ

                        if (Responsive.isMobile(context)) SizedBox(height: defaultPadding),
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context)) SizedBox(width: defaultPadding),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
