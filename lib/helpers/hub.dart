import 'dart:developer';

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
    String hubConnectionUrl = dotenv.env["HUB_CONNECTION_URL"] ?? "";

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
      if ((model.eventInfo == "worker-completed" || model.eventInfo == "transition-completed") && (model.page != null && model.page!.type != "Popup")) {
        EntityController c = Get.find<EntityController>();
        c.getDataList();
      }

      if (model.page != null && model.page!.operation == "Open" && model.page!.type == "Popup") {
        log("showHubFormio", name: "showHubFormio");

        formioDialog(Get.context!, model.entityName, model.recordId, model.workflowName, model.transition);
      }
      if (model.message != null && model.message!.isNotEmpty) Get.snackbar("Result", model.message!, backgroundColor: Colors.black, colorText: Colors.white);
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
