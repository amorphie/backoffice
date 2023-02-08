import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../core/binding/start_app_bindings.dart';
import '../core/export/_.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.72, 856.72),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, w) => GetMaterialApp(
        initialBinding: StartBinding(),
        title: 'Amorphie',
        home: MainScreen(),
      ),
    );
  }
}
