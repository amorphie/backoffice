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

class NeoAppState extends Equatable {
  final NeoAuthStatus authStatus;
  final String? appTheme;

  const NeoAppState({required this.authStatus, this.appTheme});

  @override
  List<Object?> get props => [authStatus, appTheme];
}
