import 'package:flutter/material.dart';

class TagModel {
  final String isim;
  final String soyIsim;
  final Icon durum;
  final String tags;
  final IconData edit;

  TagModel({
    required this.isim,
    required this.soyIsim,
    required this.tags,
    required this.durum,
    required this.edit,
  });
}

List tags = [
  TagModel(
    isim: "Ozan Deniz",
    soyIsim: "Demirtaş",
    durum: Icon(Icons.check_circle, color: Colors.teal),
    tags: "retail-customer, bank-staff",
    edit: Icons.menu,
  ),
  TagModel(
    isim: "Ertuğrul",
    soyIsim: "Dağlı",
    durum: Icon(Icons.cancel, color: Colors.redAccent),
    tags: "retail-customer",
    edit: Icons.menu,
  ),
  TagModel(
    isim: "Gökhan",
    soyIsim: "Basut",
    durum: Icon(Icons.check_circle, color: Colors.teal),
    tags: "retail-customer",
    edit: Icons.menu,
  ),
  TagModel(
    isim: "İsmail",
    soyIsim: "Türüt",
    durum: Icon(Icons.cancel, color: Colors.redAccent),
    tags: "bank-staff",
    edit: Icons.menu,
  ),
  TagModel(
    isim: "Daft",
    soyIsim: "Punk",
    durum: Icon(Icons.cancel, color: Colors.redAccent),
    tags: "bank-staff",
    edit: Icons.menu,
  ),
  TagModel(
    isim: "Linkin",
    soyIsim: "Park",
    durum: Icon(Icons.check_circle, color: Colors.teal),
    tags: "potential-customer, bank-staff",
    edit: Icons.menu,
  ),
  TagModel(
    isim: "Orhan",
    soyIsim: "Gencebay",
    durum: Icon(Icons.cancel, color: Colors.redAccent),
    tags: "potential-customer",
    edit: Icons.menu,
  ),
];
