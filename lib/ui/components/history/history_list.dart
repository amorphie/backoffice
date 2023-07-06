// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/data/models/history/history_model.dart';
import 'package:admin/data/models/history/history_workflow_model.dart';
import 'package:flutter/material.dart';

import '../../style/colors.dart';

class HistoryListWidget extends StatelessWidget {
  final List<HistoryWorkflowModel> histories;
  final Function(HistoryModel model) onTap;
  const HistoryListWidget({
    Key? key,
    required this.histories,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: histories.first.transitions.length,
      itemBuilder: (context, index) => historyCard(
        context,
        title: histories.first.transitions[index].name,
        subTitle: histories.first.transitions[index].calledBy,
        date: histories.first.transitions[index].calledAt.toString(),
        onTap: () async {
          onTap(histories.first.transitions[index]);
        },
      ),
    );
  }

  GestureDetector historyCard(BuildContext context, {required String title, required String subTitle, required String date, required Function onTap}) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.only(top: 14),
        padding: EdgeInsets.all(14),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.history,
                  color: KC.primary,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          subTitle,
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(color: Colors.black87, fontSize: 12),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
