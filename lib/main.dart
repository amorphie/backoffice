import 'package:flutter/material.dart';
import 'core/dependency_injection/dependency_injection.dart';
import 'ui/app.dart';
import 'package:neo_core/neo_core.dart' as core;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await core.NeoCore.init();
  await configureDependencies();
  runApp(App());
}
