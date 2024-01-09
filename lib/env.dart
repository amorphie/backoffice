// import 'package:package_info_plus/package_info_plus.dart';

// class Environment {
//   static Environment shared = Environment();

//   late PackageInfo info;

//   EnvironmentType get environmentType => EnvironmentType.setData(info.packageName);

//   Future getInfo() async {
//     info = await PackageInfo.fromPlatform();
//     print(info);
//   }
// }

// enum EnvironmentType {
//   prod,
//   prep,
//   dev,
//   onProd,
//   onPrep,
//   onDev;

//   const EnvironmentType();

//   factory EnvironmentType.setData(String bundleId) {
//     switch (bundleId) {
//       case "com.burgan.mobil":
//         return EnvironmentType.prod;
//       case "com.burgan.mobil.prep":
//         return EnvironmentType.prep;
//       case "com.burgan.mobil.dev":
//         return EnvironmentType.dev;
//       case "com.onbank.mobil":
//         return EnvironmentType.onProd;
//       case "com.onbank.mobil.prep":
//         return EnvironmentType.onPrep;
//       case "com.onbank.mobil.dev":
//         return EnvironmentType.onDev;
//       case "com.burgan.onmobil":
//         return EnvironmentType.onProd;
//       case "com.burgan.onmobil.prep":
//         return EnvironmentType.onPrep;
//       case "com.burgan.onmobil.dev":
//         return EnvironmentType.onDev;
//       default:
//         return EnvironmentType.dev;
//     }
//   }

//   String get icon {
//     switch (this) {
//       case EnvironmentType.prod:
//         return "assets/icons/prod.png";
//       case EnvironmentType.prep:
//         return "assets/icons/prep.png";
//       case EnvironmentType.dev:
//         return "assets/icons/dev.png";
//       case EnvironmentType.onProd:
//         return "assets/icons/onProd.png";
//       case EnvironmentType.onPrep:
//         return "assets/icons/onPrep.png";
//       case EnvironmentType.onDev:
//         return "assets/icons/onDev.png";
//       default:
//         return "assets/icons/dev.png";
//     }
//   }
// }
