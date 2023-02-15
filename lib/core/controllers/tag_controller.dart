import 'package:admin/core/models/tag.dart';
import 'package:get/get.dart';

class TagController extends GetxController {
  Rx<TagModel> _tagModel = TagModel.init().obs;
  TagModel get tagModel => _tagModel.value;

  set tagModel(TagModel p) {
    _tagModel.value = p;
  }
}
