import 'package:admin/core/export/_.dart';

class UserModel {
  final String ref, name, surName;
  final IconData edit;
  final Icon status;
  final String tags;

  UserModel({
    required this.ref,
    required this.name,
    required this.surName,
    required this.edit,
    required this.tags,
    required this.status,
  });
}

List<UserModel> users = [
  UserModel(
    ref: "000000000 000000 0000 00000",
    name: "Ozan Deniz",
    surName: "Demirtaş",
    status: Icon(Icons.check_circle, color: KC.primary),
    tags: "retail-customer, bank-staff",
    edit: Icons.edit,
  ),
  UserModel(
    ref: "000000000 000000 0000 00000",
    name: "Ertuğrul",
    surName: "Dağlı",
    status: Icon(Icons.timer_sharp, color: Colors.deepOrangeAccent),
    tags: "retail-customer",
    edit: Icons.edit,
  ),
  UserModel(
    ref: "000000000 000000 0000 00000",
    name: "Gökhan",
    surName: "Basut",
    status: Icon(Icons.check_circle, color: KC.primary),
    tags: "retail-customer",
    edit: Icons.edit,
  ),
  UserModel(
    ref: "000000000 000000 0000 00000",
    name: "İsmail",
    surName: "Türüt",
    status: Icon(Icons.timer_sharp, color: Colors.deepOrangeAccent),
    tags: "bank-staff",
    edit: Icons.edit,
  ),
  UserModel(
    ref: "000000000 000000 0000 00000",
    name: "Daft",
    surName: "Punk",
    status: Icon(Icons.cancel, color: Colors.redAccent),
    tags: "bank-staff",
    edit: Icons.edit,
  ),
  UserModel(
    ref: "000000000 000000 0000 00000",
    name: "Linkin",
    surName: "Park",
    status: Icon(Icons.check_circle, color: KC.primary),
    tags: "potential-customer, bank-staff",
    edit: Icons.edit,
  ),
  UserModel(
    ref: "000000000 000000 0000 00000",
    name: "Orhan",
    surName: "Gencebay",
    status: Icon(Icons.cancel, color: Colors.redAccent),
    tags: "potential-customer",
    edit: Icons.edit,
  ),
];
