// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:admin/ui/controllers/display_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:admin/ui/style/colors.dart';
import 'package:webviewx/webviewx.dart';

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
  WebViewXController? webViewXController;
  @override
  Widget build(BuildContext context) {
    if ((controller.displayView["tag"] ?? controller.displayView["tags"]) == null) return Container();
    return row(controller.displayView["tag"] ?? controller.displayView["tags"]);
  }

  Widget row(List data) {
    return Container(
      color: KC.primary,
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Text(
            "Tags",
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
          ...data
              .map((e) => GestureDetector(
                    onTap: () {
                      _showDetailFormio(e.toString());
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

  Future<void> _showDetailFormio(String data) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: AlertDialog(
            actionsPadding: EdgeInsets.zero,
            insetPadding: EdgeInsets.zero,
            buttonPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            content: _buildWebViewX(data),
          ),
        );
      },
    );
  }

  Widget _buildWebViewX(String data) {
    return WebViewX(
      key: const ValueKey('urldata'),
      initialContent: "https://google.com.tr",
      initialSourceType: SourceType.url,
      height: double.maxFinite,
      width: MediaQuery.of(context).size.width * 0.7,

      // height: screenSize.height / 1.3,
      // width: min(screenSize.width * 0.8, 1024),
      onWebViewCreated: (controller) {
        return webViewXController = controller;
      },
    );
  }
}
