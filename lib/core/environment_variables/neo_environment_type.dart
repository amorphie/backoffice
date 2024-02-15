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

import 'package:collection/collection.dart';
import 'package:universal_io/io.dart';

enum NeoEnvironmentType {
  dev,
  prep,
  prod,
  onDev,
  onPrep,
  onProd;

  static NeoEnvironmentType fromApplicationId(String applicationId) {
    return NeoEnvironmentType.values.firstWhereOrNull((element) => element.applicationId == applicationId) ??
        NeoEnvironmentType.dev;
  }
}

extension NeoEnvironmentTypeExtension on NeoEnvironmentType {
  bool get isProd =>
      this == NeoEnvironmentType.prod ||
      this == NeoEnvironmentType.onProd ||
      // STOPSHIP: Delete this prep environments below from prod check when prod pipeline is ready!
      this == NeoEnvironmentType.prep ||
      this == NeoEnvironmentType.onPrep;

  String get applicationId {
    final isAndroid = Platform.isAndroid;
    return switch (this) {
      NeoEnvironmentType.dev => "com.burgan.mobil.dev",
      NeoEnvironmentType.prep => "com.burgan.mobil.prep",
      NeoEnvironmentType.prod => "com.burgan.mobil",
      NeoEnvironmentType.onDev => isAndroid ? "com.onbank.mobil.dev" : "com.burgan.onmobil.dev",
      NeoEnvironmentType.onPrep => isAndroid ? "com.onbank.mobil.prep" : "com.burgan.onmobil.prep",
      NeoEnvironmentType.onProd => isAndroid ? "com.onbank.mobil" : "com.burgan.onmobil",
    };
  }
}
