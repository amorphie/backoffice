// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:admin/core/models/domain.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'package:admin/core/export/_.dart';

class DomainAddScreen extends StatefulWidget {
  final DomainModel model;
  final Future Function(DomainModel model) addPressed;
  final List<TagModel> tagList;
  const DomainAddScreen({
    Key? key,
    required this.model,
    required this.addPressed,
    required this.tagList,
  }) : super(key: key);
  @override
  State<DomainAddScreen> createState() => _DomainAddScreenState();
}

class _DomainAddScreenState extends State<DomainAddScreen> {
  late final _items;

  List<String> selectedtags = [];

  late TextEditingController name;
  late TextEditingController desc;
  @override
  void initState() {
    super.initState();
    name = TextEditingController(text: widget.model.name);
    desc = TextEditingController(text: widget.model.description);
    _items = widget.tagList
        .map((tag) => MultiSelectItem<TagModel>(tag, tag.name!))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 25),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Add Domain",
                style: TextStyle(
                    color: KC.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ),
          ),
          Divider(
            color: KC.primary,
            height: 30,
          ),
          CommonTextField(
            labelText: "Name",
            keyboardType: TextInputType.name,
            controller: name,
          ),
          CommonTextField(
            labelText: "Description",
            keyboardType: TextInputType.name,
            controller: desc,
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            width: MediaQuery.of(context).size.width / 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 3),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: MultiSelectChipField(
                  textStyle: TextStyle(color: Colors.black),
                  chipColor: Colors.white,
                  items: _items,
                  title: Text(
                    "Tags",
                    style: TextStyle(color: Colors.white),
                  ),
                  headerColor: KC.primary,
                  initialValue: [],
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: KC.primary, width: 0.6),
                  ),
                  selectedChipColor: KC.primary,
                  selectedTextStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: SizedBox(
                    width: MediaQuery.of(context).size.width / 5,
                    child: Expanded(
                      child: CommonButton(
                          title: "Save",
                          onPressed: () async {
                            DomainModel model = DomainModel(
                                name: name.text,
                                description: desc.text,
                                entities: []);
                            await widget.addPressed(model);
                          },
                          color: KC.primary),
                    )),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                  child: Expanded(
                    child: CommonButton(
                        title: "Close",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: KC.primary),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
