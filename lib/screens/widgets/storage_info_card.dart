import 'package:admin/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConsentCard extends StatelessWidget {
  const ConsentCard({
    Key? key,
    required this.bankName,
    required this.amountOfConsents,
  }) : super(key: key);

  final String bankName;
  final int amountOfConsents;

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
      child: Row(
        children: [
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
                    style: TextStyle(color: Colors.black87),
                  ),
                  Text(
                    "$amountOfConsents Consent",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.black87),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
