// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:admin/helpers/dialog_helper.dart';
import 'package:admin/ui/controllers/display_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:admin/ui/style/colors.dart';

class DisplayTagList extends StatefulWidget {
  final String id;
  const DisplayTagList({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<DisplayTagList> createState() => _DisplayTagListState();
}

class _DisplayTagListState extends State<DisplayTagList> {
  DisplayController get controller => Get.find<DisplayController>(tag: widget.id);
  @override
  Widget build(BuildContext context) {
    if ((controller.displayView["tag"] ?? controller.displayView["tags"]) == null) return Container();
    return row(controller.displayView["tag"] ?? controller.displayView["tags"]);
  }

  Widget row(List data) {
    return Container(
      color: KC.primary,
      padding: EdgeInsets.only(left: 12, top: 2),
      child: Row(
        children: [
          Text(
            "Tags",
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
          ...data
              .map((e) => GestureDetector(
                    onTap: () {
                      showTag(e.toString());
                    },
                    child: Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                        decoration: BoxDecoration(color: KC.secondary, borderRadius: BorderRadius.circular(20)),
                        child: Text(e, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.white))),
                  ))
              .toList()
        ],
      ),
    );
  }
}
