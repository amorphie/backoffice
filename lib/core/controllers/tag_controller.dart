import 'package:get/get.dart';

import '../export/_.dart';

class TagController extends GetxController {
  Rx<TagModel> _tagModel = TagModel.init().obs;
  TagModel get tagModel => _tagModel.value;
  RxList<TagModel> tagList = RxList<TagModel>.from([]);

  Services _services = Services();

  set tagModel(TagModel p) {
    _tagModel.value = p;
  }

  //Get

  Future<bool> getTags() async {
    List<TagModel> _list = [];

    ResponseModel response = await _services.getTag();

    if (response.success) {
      for (var item in response.data) {
        TagModel model = TagModel.fromMap(item);
        _list.add(model);
      }
      tagList.value = _list;
    }
    return response.success;
  }

  //Post

  Future<bool> addTag(TagModel t) async {
    ResponseModel response = await _services.postTag(t);

    if (response.success) {
      tagList.add(TagModel.fromMap(response.data));
    }
    return response.success;
  }

  //Delete

  Future<bool> deleteTag() async {
    ResponseModel response = await _services.deleteResource(tagModel.name!);

    if (response.success) {
      tagList.removeWhere((e) => e.name == tagModel.name);
    }
    return response.success;
  }
}
