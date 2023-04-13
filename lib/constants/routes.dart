import 'package:admin/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/app_init.dart';

List<GetPage<Widget>> getPages = [
  GetPage<Widget>(name: "/AppInit", page: () => const AppInit()),
  GetPage<Widget>(name: "/", page: () => HomePage()),
];
