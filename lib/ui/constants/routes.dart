import '../helpers/exporter.dart';

List<GetPage<Widget>> getPages = [
  GetPage<Widget>(name: "/AppInit", page: () => const AppInit()),
  GetPage<Widget>(name: "/", page: () => HomePage()),
];
