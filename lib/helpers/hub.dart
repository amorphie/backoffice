import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:admin/data/models/hub/hub_model.dart';
import 'package:admin/helpers/logger.dart';
import 'package:admin/ui/controllers/entity_controller.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:signalr_netcore/signalr_client.dart';

import 'dialog_helper.dart';

// String hubConnectionUrl = "wss://amorphie-mocks.da6eaae914f4424ea721.westeurope.aksapp.io/hubs/messageHub";
String hubConnectionUrl = "https://test-amorphie-workflow-hub.burgan.com.tr/hubs/workflow";

class Hub {
  static Hub shared = Hub();
  late HubConnection connection;

  Hub() {
    HttpConnectionOptions httpOptions = HttpConnectionOptions(requestTimeout: 5000);
    Logger hubProtLogger = Logger("SignalR - hub");
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((LogRecord rec) {
      log("[${rec.time}][${rec.level.name}]\t${rec.message}", name: "SIGNALR-HUB");
    });

    connection = HubConnectionBuilder()
        .withUrl(
          hubConnectionUrl,
          options: httpOptions,
        )
        .withAutomaticReconnect()
        .configureLogging(hubProtLogger)
        .build();
  }

  Future sendMessage(String message) async {
    await connection.invoke(
      'sendMessage',
      args: [message],
    );
  }

  Future start() async {
    connection.on("sendMessage", (arguments) {
      Logger.root.config(arguments.toString(), "sendMessage");
      appLogger.d(json.decode(arguments.toString()), "sendMessage");
      var d = json.decode(arguments.toString());
      HubModel model;
      if (d is List) {
        model = HubModel.fromMap(d.first);
      } else {
        model = HubModel.fromMap(d);
      }
      appLogger.wtf(model.toString(), "sendMessageend");
      if ((model.eventInfo == "worker-completed" || model.eventInfo == "transition-completed") && (model.page != null && model.page!.type != "Popup")) {
        EntityController c = Get.find<EntityController>();
        c.getDataList();
      }
      if (model.page != null && model.page!.operation == "Open" && model.page!.type == "Popup") {
        log("showHubFormio", name: "showHubFormio");

        formioDialog(Get.context!, model.entityName, model.recordId);
      }
    });
    connection.on("ClientConnected", (arguments) {
      Logger.root.config(arguments.toString(), "ClientConnected");
    });

    connection.onclose(({error}) {
      Logger.root.config(error, "onclose"); //Test için eklendi
    });
    connection.onreconnected(({connectionId}) {
      Logger.root.config(connectionId, "onreconnected"); //Test için eklendi
    });
    connection.onreconnecting(({error}) {
      Logger.root.config(error, "onreconnecting"); //Test için eklendi
    });
    try {
      await connection.start();
    } catch (e) {
      Logger.root.warning(e);
    }
  }

  Future stop() async {
    await connection.stop();
  }
}
