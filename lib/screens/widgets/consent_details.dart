import 'package:flutter/material.dart';

import 'storage_info_card.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "User Details",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Ozan Deniz Demirtaş",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black87, fontSize: 11),
            ),
            Text(
              "Last login   03.01.2023",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black87, fontSize: 11),
            ),
            SizedBox(height: 14),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Consents",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ConsentCard(
              bankName: "Burgan Bank",
              amountOfConsents: 1,
              date: "19.02.2021",
            ),
            ConsentCard(
              bankName: "Akbank",
              amountOfConsents: 1,
              date: "19.02.2021",
            ),
            ConsentCard(
              bankName: "Garanti",
              amountOfConsents: 2,
              date: "19.02.2021",
            ),
            ConsentCard(
              bankName: "TEB",
              amountOfConsents: 1,
              date: "19.02.2021",
            ),
          ],
        ),
      ),
    );
  }
}
