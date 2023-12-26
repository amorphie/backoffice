import 'dart:developer';

import 'package:admin/data/models/hub/hub_response_model.dart';
import 'package:admin/ui/constants/app_settings.dart';
import 'package:admin/ui/controllers/workflow_instance/workflow_instance_controller.dart';
// import 'package:signalr_netcore/ihub_protocol.dart';
// import 'package:signalr_netcore/itransport.dart';

import 'exporter.dart';

class Hub {
  static Hub shared = Hub();
  late HubConnection connection;

  Hub() {
    HttpConnectionOptions httpOptions = HttpConnectionOptions(
      requestTimeout: 5000,
      // headers: MessageHeaders()..setHeaderValue("X-Device-Id", AppSettings.xDeviceId),
      // skipNegotiation: true,
      // transport: HttpTransportType.LongPolling,
    );
    Logger hubProtLogger = Logger("SignalR - hub");
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((LogRecord rec) {
      log("[${rec.time}][${rec.level.name}]\t${rec.message}", name: "SIGNALR-HUB");
    });

    // String hubConnectionUrl = "https://pubagw6.burgan.com.tr/ebank/flow/hub/hubs/genericHub?X-Device-Id=${AppSettings.xDeviceId}&X-Token-Id=${AppSettings.xTokenId}";
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
    print("sendmessage");
  }

  Future start() async {
    connection.on("sendMessage", (arguments) {
      appLogger.d(json.decode(arguments.toString()), "sendMessage");
      var d = json.decode(arguments.toString());
      HubResponseModel model;
      if (d is List) {
        model = HubResponseModel.fromMap(d.first);
      } else {
        model = HubResponseModel.fromMap(d);
      }

      if ((model.data.eventInfo == "worker-completed" || model.data.eventInfo == "transition-completed") && (model.data.page != null && model.data.page!.type != "Popup")) {
        EntityController c = Get.find<EntityController>();
        c.getDataList();
      }

      if (model.data.page != null && model.data.page!.operation == "Open" && model.data.page!.type == "Popup") {
        WorkflowInstanceController controller = Get.put<WorkflowInstanceController>(WorkflowInstanceController());

        controller.hub(model.data);
      }
      if (model.data.message != null && model.data.message!.isNotEmpty) Get.snackbar("Result", model.data.message!, backgroundColor: Colors.black, colorText: Colors.white);
    });
    connection.on("ClientConnected", (arguments) {
      Logger.root.config(arguments.toString(), "ClientConnected");
      sendMessage("Test");

      // stop();
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
      // await connection.stop();
      await connection.start();
      // await sendMessage("test");
      print(1);
    } catch (e) {
      Logger.root.warning(e);
    }
  }

  Future stop() async {
    await connection.stop();
  }
}
