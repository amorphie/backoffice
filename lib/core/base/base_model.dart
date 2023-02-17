abstract class BaseModel {
  dynamic id;

  Map<String, dynamic> toMap();
  List<String> columns = [];
}
