import 'package:admin/data/models/formio/formio.dart';
import 'package:get/get.dart';

class FormIoController extends GetxController {
  //https://test-amorphie-fact-user.burgan.com.tr/
  Rx<FormioModel> _formio = FormioModel.init().obs;
  FormioModel get formio => _formio.value;
  set formio(FormioModel _) {
    _formio.value = _;
  }
}
