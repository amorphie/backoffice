// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/bo_detail_page/bloc/bo_detail_page_bloc.dart';

class NeoBoDetailItemWidget extends StatelessWidget {
  final String title;
  final String text;
  final bool copyValue;
  const NeoBoDetailItemWidget({
    Key? key,
    this.title = "",
    this.text = "",
    this.copyValue = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black)),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              children: [
                Text(context.watch<BoDetailPageBloc>().dataWidthPath(text), style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.black)),
                if (copyValue)
                  IconButton(
                    onPressed: () async {
                      await Clipboard.setData(ClipboardData(text: text));
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
