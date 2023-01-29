import 'package:flutter/material.dart';

import 'storage_info_card.dart';

class StarageDetails extends StatelessWidget {
  const StarageDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Consent Details",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 14),
          ConsentCard(
            bankName: "Burgan Bank",
            amountOfConsents: 1,
          ),
          ConsentCard(
            bankName: "Akbank",
            amountOfConsents: 1,
          ),
          ConsentCard(
            bankName: "Garanti",
            amountOfConsents: 2,
          ),
          ConsentCard(
            bankName: "TEB",
            amountOfConsents: 1,
          ),
        ],
      ),
    );
  }
}
