import 'package:flutter/material.dart';

class UserDetailWidget extends StatelessWidget {
  const UserDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            listItem("ID", "fj92173-nsdv-2funuıvıubv-3uı43-v17"),
            listItem("Referans", "52392883752"),
            listItem("Isim", "Ozan Deniz Demirtaş"),
            listItem("Telefon", "90 533 4631019"),
            listItem("E-Mail", "ozanddemirtas@gmail.com"),
            listItem("Durum", "Aktif"),
            listItem("Etiketler", "Banka Calısanı - Admin"),
          ],
        ),
      ),
    );
  }

  Column listItem(String title, String subTitle) {
    return Column(children: [
      Text(
        title,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15.0, bottom: 17, top: 3),
        child: Text(subTitle),
      ),
      Divider(),
    ]);
  }
}
