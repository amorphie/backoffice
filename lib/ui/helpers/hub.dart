import 'dart:developer';

import '../../data/models/hub/hub_response_model.dart';
import '../constants/app_settings.dart';
import 'exporter.dart';

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
    String hubConnectionUrl = "https://test-amorphie-workflow-hub.${dotenv.env["PROJECT_HOST"]}/hubs/genericHub?X-Device-Id=${AppSettings.xDeviceId}&X-Token-Id=${AppSettings.xTokenId}";

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
      HubResponseModel model;
      if (d is List) {
        model = HubResponseModel.fromMap(d.first);
      } else {
        model = HubResponseModel.fromMap(d);
      }

      if ((model.data.eventInfo == "worker-completed" || model.data.eventInfo == "transition-completed") && (model.data.page != null && model.data.page!.type.toLowerCase() == "popup")) {
        EntityController c = Get.find<EntityController>();
        c.getDataList();
      }

      if (model.data.page != null && model.data.page!.operation == "Open" && model.data.page!.type.toLowerCase() == "popup") {
        log("showHubFormio", name: "showHubFormio");

        formioDialog(Get.context!, model.data.entityName, model.data.recordId, model.data.workflowName, model.data.transition);
      }
      if (model.data.message != null && model.data.message!.isNotEmpty) Get.snackbar("Result", model.data.message!, backgroundColor: Colors.black, colorText: Colors.white);
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
