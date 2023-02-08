import 'package:admin/core/export/_.dart';

import '../models/consent.dart';

List consents = [
  ConsentModel(
    bankName: "Burgan Bank",
    file: "Consent Name",
    date: "05.06.2022",
    edit: Icon(Icons.check_circle, color: Colors.teal),
    status: Icons.edit,
  ),
  ConsentModel(
    bankName: "AKBANK",
    file: "Consent Name",
    date: "01.11.2022",
    edit: Icon(Icons.cancel, color: Colors.redAccent),
    status: Icons.edit,
  ),
  ConsentModel(
    bankName: "TEB",
    file: "Consent Name",
    date: "18.05.2021",
    edit: Icon(Icons.check_circle, color: Colors.teal),
    status: Icons.edit,
  ),
  ConsentModel(
    bankName: "Garanti",
    file: "Consent Name",
    date: "27.03.2022",
    edit: Icon(Icons.cancel, color: Colors.redAccent),
    status: Icons.edit,
  ),
  ConsentModel(
    bankName: "İş Bankası",
    file: "Consent Name",
    date: "19.05.2022",
    edit: Icon(Icons.cancel, color: Colors.redAccent),
    status: Icons.edit,
  ),
  ConsentModel(
    bankName: "Ziraat Bank",
    file: "Consent Name",
    date: "07.07.2022",
    edit: Icon(Icons.check_circle, color: Colors.teal),
    status: Icons.edit,
  ),
];
