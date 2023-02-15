import 'package:admin/core/models/resource.dart';
import 'package:get/get.dart';

class ResourceController extends GetxController {
  Rx<ResourceModel> _resourceModel = ResourceModel.init().obs;
  ResourceModel get resourceModel => _resourceModel.value;

  set resourceModel(ResourceModel p) {
    _resourceModel.value = p;
  }
}
