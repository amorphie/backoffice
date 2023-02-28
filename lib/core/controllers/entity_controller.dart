import 'package:get/get.dart';

import '../export/_.dart';
import '../models/entity.dart';

class EntityController extends GetxController {
  Rx<EntityModel> _entityModel = EntityModel.init().obs;
  EntityModel get entityModel => _entityModel.value;
  RxList<EntityModel> enetityList = RxList<EntityModel>.from([]);

  Services _services = Services();

  set entityModel(EntityModel p) {
    _entityModel.value = p;
  }

//Get

  Future<bool> getDomains(String name) async {
    List<EntityModel> _list = [];

    ResponseModel response = await _services.getEntityByName(name: name);

    if (response.success) {
      for (var item in response.data) {
        EntityModel model = EntityModel.fromMap(item);
        _list.add(model);
      }
      enetityList.value = _list;
    }
    return response.success;
  }

  //Post

  Future<bool> saveEntity() async {
    ResponseModel response = await _services.saveEntity();

    if (response.success) {
      enetityList.add(EntityModel.fromMap(response.data));
    }
    return response.success;
  }
}
