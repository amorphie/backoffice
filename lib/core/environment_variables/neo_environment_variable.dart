/*
 * neo_bank
 *
 * Created on 29/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:backoffice/core/environment_variables/neo_environment.dart';
import 'package:backoffice/core/environment_variables/neo_environment_type.dart';

// TODO: Order enum values alphabetically to prevent possible conflicts!
enum NeoEnvironmentVariable {
  httpConfigFilePath,
  workflowClientId,
  workflowClientSecret,
  workflowHubUrl,
  workflowMethodName,
}

extension NeoEnvironmentVariableExtension on NeoEnvironmentVariable {
  String get value {
    switch (this) {
      case NeoEnvironmentVariable.httpConfigFilePath:
        if (NeoEnvironment.current.isProd) {
          return "assets/json/http_client_config_prod.json";
        } else {
          return "assets/json/http_client_config.json";
        }
      case NeoEnvironmentVariable.workflowClientId:
        // STOPSHIP: Set workflow client id for prod if necessary
        return "3fa85f64-5717-4562-b3fc-2c963f66afa6";
      case NeoEnvironmentVariable.workflowClientSecret:
        // STOPSHIP: Set workflow client secret for prod if necessary
        return "sercan";
      case NeoEnvironmentVariable.workflowHubUrl:
        if (NeoEnvironment.current.isProd) {
          return "https://pubagw6.burgan.com.tr/ebanking/flow/hub/hubs/genericHub";
        } else {
          return "https://test-pubagw6.burgan.com.tr/ebanking/flow/hub/hubs/genericHub";
        }
      case NeoEnvironmentVariable.workflowMethodName:
        // STOPSHIP: Set workflow method name for prod if necessary
        return "SendMessage";
    }
  }
}
