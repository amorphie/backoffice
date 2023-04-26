import 'dart:convert';

import 'package:admin/ui/controllers/entity_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class DisplayController extends GetxController {
  RxMap<String, dynamic> _displayView = <String, dynamic>{}.obs;
  Map<String, dynamic> templates = {};

  RxBool _hasDisplayView = false.obs;

  setData(Map<String, dynamic> data) async {
    _hasDisplayView.value = false;

    _displayView.value = data;
    await getTemplates();
    _hasDisplayView.value = true;
  }

  getTemplates() async {
    templates = {};
    EntityController entityController = Get.find<EntityController>();

    templates.addAll({entityController.entity.display!.summary_template!.trTR: await getTemplate("${entityController.entity.display!.summary_template!.trTR}")});

    for (var tab in entityController.entity.display!.tabs!) {
      if (tab.type == "render") {
        String data = await rootBundle.loadString("widgets/${tab.template!.trTR}.json");
        var template = jsonDecode(data);
        templates.addAll({tab.template!.trTR: template});
      }
    }
  }

  Future<String?> getTemplate(String name) async {
    var data = {
      "name": name,
      "render-id": Uuid().v4(),
      "render-data": _displayView.value,
      "render-data-for-log": _displayView.value,
      "semantic-version": "1.0.3",
      "process-name": "string",
      "item-id": "string",
      "action": "string",
      "identity": "string",
      "customer": "string"
    };
    Uri _url = Uri.parse("https://test-template-engine.burgan.com.tr/Template/Render");
    http.Response response = await http.post(
      _url,
      body: json.encode(data),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    }
    return null;
  }

  bool get hasDisplayView {
    return _hasDisplayView.value;
  }

  reset() {
    _displayView.value = <String, dynamic>{};
    _hasDisplayView.value = false;
  }
}
