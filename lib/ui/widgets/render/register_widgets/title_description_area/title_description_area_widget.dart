// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TitleDescriptionAreaWidget extends StatelessWidget {
  final String title;
  final String text;
  final bool copyValue;
  const TitleDescriptionAreaWidget({
    Key? key,
    this.title = "",
    this.text = "",
    this.copyValue = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black)),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Text(text, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.black)),
                if (copyValue)
                  IconButton(
                    onPressed: () async {
                      await Clipboard.setData(ClipboardData(text: text));
                      Get.snackbar("Info", "Data copied to clipboard");
                    },
                    icon: Icon(Icons.copy),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
