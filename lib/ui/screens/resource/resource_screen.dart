// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:admin/core/models/resource.dart';
import 'package:admin/ui/tables/table_base.dart';

import '../../../core/export/_.dart';
import '../../tables/my_data_table/my_data_table.dart';

class ResourceScreen extends StatefulWidget {
  final ResourceModel model;
  final List<ResourceModel> list;
  final Function(ResourceModel model) selectModel;
  const ResourceScreen({
    Key? key,
    required this.model,
    required this.list,
    required this.selectModel,
  }) : super(key: key);

  @override
  State<ResourceScreen> createState() => _ResourceScreenState();
}

class _ResourceScreenState extends State<ResourceScreen> {
  late final _items;

  @override
  void initState() {
    super.initState();
    _items = widget.model.descriptions!.map((a) => (a.label)).toString();
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
                        MyDataTable<ResourceModel>(
                          items: widget.list
                              .map(
                                (resource) => MyDataTableRow<ResourceModel>(
                                  onPressed: (item) {},
                                  cells: [
                                    // ...user.columns.map((e) => MyDataTableCell(title: e, text: user.toMap()[e].toString())),
                                    MyDataTableCell.set("ID", resource.id!),

                                    MyDataTableCell.set("Url", resource.url!),
                                    MyDataTableCell.set(
                                        "Tags", resource.tags!.toString()),
                                    MyDataTableCell.set("Description", _items),
                                    MyDataTableCell.set("Display Name",
                                        resource.displayNames!.toString()),
                                  ],
                                ),
                              )
                              .toList(),
                          onSelect: (a) {},
                          onRefresh: (value) {
                            print('refreshed');
                          },
                          addPress: () {
                            addResourcePopUp(context);
                          },
                        ),
                        TableBase(
                            items: widget.list,
                            onSelect: (c) {
                              widget.selectModel(c as ResourceModel);
                            },
                            onFilter: (item) {}), //!YENİ
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
