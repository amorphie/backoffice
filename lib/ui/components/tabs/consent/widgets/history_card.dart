// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../../../../style/colors.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    Key? key,
    required this.date,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String title, date, subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        style: TextStyle(
                            color: Colors.black87, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        subTitle,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.black54),
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
    );
  }
}
