/*
 * neo_bank
 *
 * Created on 2/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

part of 'neo_app_bloc.dart';

sealed class NeoAppEvent extends Equatable {
  const NeoAppEvent();
}

class NeoAppEventInit extends NeoAppEvent {
  @override
  List<Object?> get props => [];
}

class NeoAppEventUpdateLoggedInStatus extends NeoAppEvent {
  final bool isLoggedIn;

  const NeoAppEventUpdateLoggedInStatus({required this.isLoggedIn});

  @override
  List<Object?> get props => [isLoggedIn];
}
