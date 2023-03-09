// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'package:admin/core/export/_.dart';

import '../../../core/models/privilege.dart';

class PrivilegeAddScreen extends StatefulWidget {
  final PrivilegeModel model;
  final Future Function(PrivilegeModel model) addPressed;
  final List<TagModel> tagList;
  const PrivilegeAddScreen({
    Key? key,
    required this.model,
    required this.addPressed,
    required this.tagList,
  }) : super(key: key);
  @override
  State<PrivilegeAddScreen> createState() => _PrivilegeAddScreenState();
}

class _PrivilegeAddScreenState extends State<PrivilegeAddScreen> {
  late final _items;

  List<String> selectedtags = [];

  late TextEditingController statu;
  late TextEditingController ttl;
  @override
  void initState() {
    super.initState();
    statu = TextEditingController(text: widget.model.status);
    ttl = TextEditingController(text: widget.model.ttl.toString());
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
                "Add Role Group",
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
            labelText: "Status",
            keyboardType: TextInputType.name,
            controller: statu,
          ),
          CommonTextField(
            labelText: "TTL",
            keyboardType: TextInputType.number,
            controller: ttl,
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
                    child: CommonButton(
                        title: "Save",
                        onPressed: () async {
                          PrivilegeModel model = PrivilegeModel(
                            status: statu.text,
                            ttl: int.parse(ttl.text),
                            modifiedByBehalfOf: '',
                            createdByBehalfOf: '',
                          );
                          await widget.addPressed(model);
                        },
                        color: KC.primary)),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                  child: CommonButton(
                      title: "Close",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: KC.primary)),
            ],
          ),
        ],
      ),
    );
  }
}
