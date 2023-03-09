import 'package:admin/core/models/resource.dart';
import 'package:get/get.dart';

import '../export/_.dart';
import '../models/common/search.dart';

class ResourceController extends GetxController {
  Rx<ResourceModel> _resourceModel = ResourceModel.init().obs;
  ResourceModel get resource => _resourceModel.value;
  RxList<ResourceModel> resourceList = RxList<ResourceModel>.from([]);

  RxList<ResourceModel> _searchResourceList = RxList.of([]);
  List<ResourceModel> get searchResourceList => _searchResourceList;

  Services _services = Services();

  set resource(ResourceModel p) {
    _resourceModel.value = p;
  }

  Future<ResponseModel> search(SearchModel search) async => await Executer.get(
          endpoint: BaseUrl.resource.getURl(
        "resource/$search",
      ));

  //Get

  Future<bool> getResourceById(String id) async {
    List<ResourceModel> _list = [];

    ResponseModel response = await _services.getResourceById(id: id);

    if (response.success) {
      ResourceModel model = ResourceModel.fromMap(response.data);
      _list.add(model);
      resourceList.value = _list;
    }
    return response.success;
  }

  Future<bool> getAllResources() async {
    List<ResourceModel> _list = [];
    ResponseModel response = await _services.getAllResources();
    print(response.data);

    if (response.success) {
      for (var item in response.data['data']) {
        ResourceModel model = ResourceModel.fromMap(item);
        _list.add(model);
      }

      resourceList.value = _list;
    }
    return response.success;
  }

  //Add

  Future<bool> addResource(ResourceModel t) async {
    ResponseModel response = await _services.postResource(t);

    if (response.success) {
      resourceList.add(ResourceModel.fromMap(response.data));
    }
    return response.success;
  }

  //Update

  Future editResource(String id, ResourceModel model) async {
    ResponseModel response = await _services.editResource(id, model);

    if (response.success) {
      _resourceModel.value = model;
      resourceList.value = _update(id, model);
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

  List<ResourceModel> _update(String id, ResourceModel p) {
    List<ResourceModel> _list = List<ResourceModel>.from(resourceList);
    int index = _list.indexWhere((element) => element.id == id);
    if (index > -1) {
      _list[index] = p;
    }
    return _list;
  }
}
