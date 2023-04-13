import 'package:get/get.dart';

class HomeController extends GetxController {
  RxMap<String, dynamic> displayView = <String, dynamic>{}.obs;

  bool get hasDisplayView {
    return displayView.keys.length > 0;
  }

  reset() {
    displayView.value = <String, dynamic>{};
  }
}
