class TitleModel {
  Map<String, dynamic> _data = {};

  String print() => _data["en-EN"] ?? "";

  TitleModel();

  factory TitleModel.fromJson(Map<String, dynamic> json) {
    return TitleModel().._data = json;
  }

  Map<String, dynamic> toJson() => _data;
}
