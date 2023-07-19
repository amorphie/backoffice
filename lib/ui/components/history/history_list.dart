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
  List<HistoryModel> get transitions {
    List<HistoryModel> t = [];
    histories.forEach((e) {
      t.addAll(e.transitions);
    });
    t.sort((a, b) => a.calledAt.compareTo(b.calledAt));
    return t;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transitions.length,
      itemBuilder: (context, index) => historyCard(
        context,
        title: transitions[index].name,
        subTitle: transitions[index].calledBy,
        date: transitions[index].calledAt.toString(),
        onTap: () async {
          onTap(transitions[index]);
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
