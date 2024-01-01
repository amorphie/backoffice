/*
 * neo_bank
 *
 * Created on 22/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

part of 'neo_app_bar_bloc.dart';

sealed class NeoAppBarEvent extends Equatable {
  const NeoAppBarEvent();
}

class NeoAppBarEventPressDeviceBack extends NeoAppBarEvent {
  final DateTime eventTime = DateTime.now();

  @override
  List<Object?> get props => [eventTime];
}
