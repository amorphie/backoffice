import '../export/_.dart';

mixin DomainService {
//Get

  Future<ResponseModel> getDomainByName(
      {required String domainName, required String entityName}) async {
    ResponseModel response = await Executer.get(
        endpoint: BaseUrl.tag.getURl(
      "domain/$domainName/Entity/$entityName",
    ));
    return response;
  }

  Future<ResponseModel> getDomains() async {
    ResponseModel response = await Executer.get(
        endpoint: BaseUrl.tag.getURl(
      "domain",
    ));
    return response;
  }

  //Post

  Future<ResponseModel> addDomain() async {
    ResponseModel response = await Executer.post(
        endpoint: BaseUrl.tag.getURl(
      "addDomain",
    ));
    return response;
  }

  //Delete
}
