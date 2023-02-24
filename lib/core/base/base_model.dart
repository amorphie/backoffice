abstract class BaseModel {
  String? id;

  Map<String, dynamic> toMap();
  List<String> columns = [];
}
