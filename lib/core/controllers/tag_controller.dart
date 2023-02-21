import 'package:admin/core/models/tag.dart';
import 'package:get/get.dart';

import '../export/_.dart';

class TagController extends GetxController {
  Rx<TagModel> _tagModel = TagModel.init().obs;
  TagModel get tag => _tagModel.value;
  RxList<TagModel> tagList = RxList<TagModel>.from([]);

  Services _services = Services();

  set tag(TagModel p) {
    _tagModel.value = p;
  }

  //Get

  Future<bool> getTag() async {
    List<TagModel> _list = [];

    ResponseModel response = await _services.getTag();

    if (!response.success) {
      for (var item in response.data) {
        TagModel model = TagModel.fromMap(item);
        _list.add(model);
      }
      tagList.value = _list;
    }
    return !response.success;
  }

  //Post

  Future<bool> addResource(TagModel t) async {
    ResponseModel response = await _services.postTag(t);

    if (!response.success) {
      tagList.add(TagModel.fromMap(response.data));
    }
    return !response.success;
  }

  //Delete

  Future<bool> deleteResource() async {
    ResponseModel response = await _services.deleteResource(tag.id);

    if (!response.success) {
      tagList.removeWhere((e) => e.id == tag.id);
    }
    return !response.success;
  }
}
