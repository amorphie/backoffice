import 'package:admin/core/models/resource.dart';
import 'package:get/get.dart';

import '../export/_.dart';

class ResourceController extends GetxController {
  Rx<ResourceModel> _resourceModel = ResourceModel.init().obs;
  ResourceModel get resource => _resourceModel.value;
  RxList<ResourceModel> resourceList = RxList<ResourceModel>.from([]);

  Services _services = Services();

  set resource(ResourceModel p) {
    _resourceModel.value = p;
  }

  //Get

  Future<bool> getResourceById(String id) async {
    List<ResourceModel> _list = [];

    ResponseModel response = await _services.getResourceById(id: id);

    if (response.success) {
      for (var item in response.data) {
        ResourceModel model = ResourceModel.fromMap(item);
        _list.add(model);
      }
      resourceList.value = _list;
    }
    return response.success;
  }

  Future<bool> getAllResources() async {
    List<ResourceModel> _list = [];

    ResponseModel response = await _services.getAllResources();

    if (response.success) {
      for (var item in response.data) {
        ResourceModel model = ResourceModel.fromMap(item);
        _list.add(model);
      }
      resourceList.value = _list;
    }
    return response.success;
  }

  //Post

  Future<bool> addResource(ResourceModel t) async {
    ResponseModel response = await _services.postResource(t);

    if (response.success) {
      resourceList.add(ResourceModel.fromMap(response.data));
    }
    return response.success;
  }

  //Delete

  Future<bool> deleteResource() async {
    ResponseModel response = await _services.deleteResource(resource.id!);

    if (response.success) {
      resourceList.removeWhere((e) => e.id == resource.id);
    }
    return response.success;
  }
}
