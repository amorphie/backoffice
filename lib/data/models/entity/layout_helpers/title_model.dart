import 'package:admin/ui/constants/app_settings.dart';

class TitleModel {
  Map<String, dynamic> _data = {};

  String print() => _data[AppSettings.lang] ?? "";

  TitleModel();

  TitleModel fromMap(Map<String, dynamic> json) {
    _data = json;
    return this;
  }

  Map<String, dynamic> toMap() => _data;
}
