import 'common/response_model.dart';
import 'executer_service.dart';

class EntityService {
  Future<ResponseModel> getResourceById(
      {required String url,
      required String pageSize,
      required String pageNumber}) async {
    ResponseModel response = await Executer.get(
        endpoint: Uri(
      path: url +
          "?pageSize=$pageSize&page=$pageNumber ?? entity.search!.defaultPageNumber}",
    ));
    return response;
  }
}
