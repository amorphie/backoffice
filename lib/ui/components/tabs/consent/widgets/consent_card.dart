// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../../../../../style/colors.dart';

class ConsentCard extends StatelessWidget {
  const ConsentCard({
    Key? key,
    required this.date,
    required this.amountOfConsents,
    required this.bankName,
    required this.consentIcon,
  }) : super(key: key);

  final String bankName, date;
  final int amountOfConsents;
  final IconData consentIcon;

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
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                consentIcon,
                color: KC.primary,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bankName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "$amountOfConsents Consent",
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
    );
  }
}
