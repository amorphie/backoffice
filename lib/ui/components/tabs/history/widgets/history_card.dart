// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../../../../style/colors.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 14),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: KC.secondary.withOpacity(0.15)),
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
      ),
      child: Expanded(
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
                subtitle,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
