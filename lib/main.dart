import 'package:flutter/material.dart';
import 'ui/app.dart';
import 'package:neo_core/neo_core.dart' as core;

void main() async {
  await core.NeoCore.init();
  runApp(const App());
}
