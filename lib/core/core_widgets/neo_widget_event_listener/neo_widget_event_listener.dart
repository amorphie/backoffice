/*
 * neo_bank
 *
 * Created on 17/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'dart:async';

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/core/core_widgets/neo_widget_event_listener/usecase/listen_global_widget_events_usecase.dart';
import 'package:neo_core/core/bus/widget_event_bus/neo_widget_event.dart';

class NeoWidgetEventListener extends StatefulWidget {
  final Widget child;
  final GlobalKey<NavigatorState> navigatorKey;

  const NeoWidgetEventListener({required this.child, required this.navigatorKey, Key? key}) : super(key: key);

  @override
  State<NeoWidgetEventListener> createState() => _NeoWidgetEventListenerState();
}

class _NeoWidgetEventListenerState extends State<NeoWidgetEventListener> {
  StreamSubscription<NeoWidgetEvent>? _neoWidgetEventSubscription;

  @override
  void initState() {
    super.initState();
    _neoWidgetEventSubscription = ListenGlobalWidgetEventsUseCase(navigatorKey: widget.navigatorKey).call();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    _neoWidgetEventSubscription?.cancel();
    super.dispose();
  }
}
