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
  const NeoAppEventInit();

  @override
  List<Object?> get props => [];
}

class NeoAppEventUpdateAuthStatus extends NeoAppEvent {
  final NeoAuthStatus authStatus;

  const NeoAppEventUpdateAuthStatus({required this.authStatus});

  @override
  List<Object?> get props => [authStatus];
}

class NeoAppEventChangeAppTheme extends NeoAppEvent {
  final String selectedTheme;

  const NeoAppEventChangeAppTheme({required this.selectedTheme});

  @override
  List<Object?> get props => [selectedTheme];
}
