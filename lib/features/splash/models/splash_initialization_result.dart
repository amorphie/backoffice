/*
 * neo_bank
 *
 * Created on 9/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:neo_core/core/navigation/models/signalr_transition_data.dart';

class SplashInitializationResult {
  final bool isLoggedIn;
  final SignalrTransitionData? initialTransitionData;

  SplashInitializationResult({required this.isLoggedIn, required this.initialTransitionData});
}
