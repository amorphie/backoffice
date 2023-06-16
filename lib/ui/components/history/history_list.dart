// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/data/models/history/history_workflow_model.dart';
import 'package:admin/ui/components/history/history_card.dart';
import 'package:flutter/material.dart';

class HistoryListWidget extends StatelessWidget {
  final List<HistoryWorkflowModel> histories;
  const HistoryListWidget({
    Key? key,
    required this.histories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: histories.first.transitions.length,
      itemBuilder: (context, index) =>
          HistoryCard(title: histories.first.transitions[index].name, subTitle: histories.first.transitions[index].calledBy, date: histories.first.transitions[index].calledAt.toString()),
    );
  }
}
