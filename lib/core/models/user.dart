import 'package:admin/core/export/_exporter.dart';
import 'package:flutter/material.dart';

class UserModel {
  final String tc, isim, soyIsim;
  final IconData islem;
  final Icon status;
  final String tags;

  UserModel({
    required this.tc,
    required this.isim,
    required this.soyIsim,
    required this.islem,
    required this.tags,
    required this.status,
  });
}

List users = [
  UserModel(
    tc: "000000000 000000 0000 00000",
    isim: "Ozan Deniz",
    soyIsim: "Demirtaş",
    status: Icon(Icons.check_circle, color: KC.primary),
    tags: "retail-customer, bank-staff",
    islem: Icons.edit,
  ),
  UserModel(
    tc: "000000000 000000 0000 00000",
    isim: "Ertuğrul",
    soyIsim: "Dağlı",
    status: Icon(Icons.timer_sharp, color: Colors.deepOrangeAccent),
    tags: "retail-customer",
    islem: Icons.edit,
  ),
  UserModel(
    tc: "000000000 000000 0000 00000",
    isim: "Gökhan",
    soyIsim: "Basut",
    status: Icon(Icons.check_circle, color: KC.primary),
    tags: "retail-customer",
    islem: Icons.edit,
  ),
  UserModel(
    tc: "000000000 000000 0000 00000",
    isim: "İsmail",
    soyIsim: "Türüt",
    status: Icon(Icons.timer_sharp, color: Colors.deepOrangeAccent),
    tags: "bank-staff",
    islem: Icons.edit,
  ),
  UserModel(
    tc: "000000000 000000 0000 00000",
    isim: "Daft",
    soyIsim: "Punk",
    status: Icon(Icons.cancel, color: Colors.redAccent),
    tags: "bank-staff",
    islem: Icons.edit,
  ),
  UserModel(
    tc: "000000000 000000 0000 00000",
    isim: "Linkin",
    soyIsim: "Park",
    status: Icon(Icons.check_circle, color: KC.primary),
    tags: "potential-customer, bank-staff",
    islem: Icons.edit,
  ),
  UserModel(
    tc: "000000000 000000 0000 00000",
    isim: "Orhan",
    soyIsim: "Gencebay",
    status: Icon(Icons.cancel, color: Colors.redAccent),
    tags: "potential-customer",
    islem: Icons.edit,
  ),
];
