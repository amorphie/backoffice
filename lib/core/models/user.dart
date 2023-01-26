import 'package:flutter/material.dart';

class UserModel {
  final String tc, isim, soyIsim;
  final IconData islem;
  final Icon durum;
  final String tags;

  UserModel({
    required this.tc,
    required this.isim,
    required this.soyIsim,
    required this.islem,
    required this.tags,
    required this.durum,
  });
}

List users = [
  UserModel(
    tc: "000000000 000000 0000 00000",
    isim: "Ozan Deniz",
    soyIsim: "Demirtaş",
    durum: Icon(Icons.check_circle, color: Colors.teal),
    tags: "customer, staff",
    islem: Icons.edit,
  ),
  UserModel(
    tc: "000000000 000000 0000 00000",
    isim: "Ertuğrul",
    soyIsim: "Dağlı",
    durum: Icon(Icons.cancel, color: Colors.redAccent),
    tags: "customer",
    islem: Icons.edit,
  ),
  UserModel(
    tc: "000000000 000000 0000 00000",
    isim: "Gökhan",
    soyIsim: "Basut",
    durum: Icon(Icons.check_circle, color: Colors.teal),
    tags: "staff",
    islem: Icons.edit,
  ),
  UserModel(
    tc: "000000000 000000 0000 00000",
    isim: "İsmail",
    soyIsim: "Türüt",
    durum: Icon(Icons.cancel, color: Colors.redAccent),
    tags: "user",
    islem: Icons.edit,
  ),
  UserModel(
    tc: "000000000 000000 0000 00000",
    isim: "Daft",
    soyIsim: "Punk",
    durum: Icon(Icons.cancel, color: Colors.redAccent),
    tags: "admin",
    islem: Icons.edit,
  ),
  UserModel(
    tc: "000000000 000000 0000 00000",
    isim: "Linkin",
    soyIsim: "Park",
    durum: Icon(Icons.check_circle, color: Colors.teal),
    tags: "customer, staff",
    islem: Icons.edit,
  ),
  UserModel(
    tc: "000000000 000000 0000 00000",
    isim: "Orhan",
    soyIsim: "Gencebay",
    durum: Icon(Icons.cancel, color: Colors.redAccent),
    tags: "customer",
    islem: Icons.edit,
  ),
];
