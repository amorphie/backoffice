import 'package:get/get.dart';

import '../export/_.dart';
import '../models/domain.dart';

class DomainController extends GetxController {
  Rx<DomainModel> _domainModel = DomainModel.init().obs;
  DomainModel get domainModel => _domainModel.value;
  RxList<DomainModel> domainList = RxList<DomainModel>.from([]);

  Services _services = Services();

  set domainModel(DomainModel p) {
    _domainModel.value = p;
  }

  //Get

  Future<bool> getDomains() async {
    List<DomainModel> _list = [];

    ResponseModel response = await _services.getDomains();

    if (response.success) {
      for (var item in response.data) {
        DomainModel model = DomainModel.fromMap(item);
        _list.add(model);
      }
      domainList.value = _list;
    }
    return response.success;
  }

  //Post

  Future<bool> addDomain() async {
    ResponseModel response = await _services.addDomain();

    if (response.success) {
      domainList.add(DomainModel.fromMap(response.data));
    }
    return response.success;
  }

  //Delete
}
