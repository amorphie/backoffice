// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/services.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'package:admin/core/export/_.dart';

class TagAddScreen extends StatefulWidget {
  final TagModel model;
  final Future Function(TagModel model) tagAddPressed;
  final List<TagModel> tagList;
  const TagAddScreen({
    Key? key,
    required this.model,
    required this.tagAddPressed,
    required this.tagList,
  }) : super(key: key);
  @override
  State<TagAddScreen> createState() => _TagAddScreenState();
}

class _TagAddScreenState extends State<TagAddScreen> {
  late final _items;

  List<String> selectedtags = [];

  late TextEditingController tag;
  late TextEditingController url;
  late TextEditingController ttl;

  @override
  void initState() {
    super.initState();
    tag = TextEditingController(text: widget.model.name);
    url = TextEditingController(text: widget.model.url);
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
                "Add Tag",
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
          SizedBox(height: defaultPadding),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: CommonTextField(
              labelText: "Tag Name",
              keyboardType: TextInputType.name,
              controller: tag,
              inputFormatter: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(
                    RegExp("[a-zA-Z]", unicode: true)),
              ],
            ),
          ),
          SizedBox(height: 30),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Row(
              children: [
                Expanded(
                    child: CommonTextField(
                  labelText: "Url",
                  keyboardType: TextInputType.url,
                  controller: url,
                )),
                SizedBox(width: 10),
                Expanded(
                    child: CommonTextField(
                  labelText: "TTL",
                  controller: ttl,
                  keyboardType: TextInputType.number,
                ))
              ],
            ),
          ),
          SizedBox(height: 30),
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
                            TagModel model = TagModel(
                              url: url.text,
                              name: tag.text,
                              ttl: int.parse(ttl.text),
                              tags: [],
                            );
                            await widget.tagAddPressed(model);
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
