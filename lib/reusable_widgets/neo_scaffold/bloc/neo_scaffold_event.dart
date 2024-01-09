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

part of 'neo_scaffold_bloc.dart';

sealed class NeoScaffoldEvent extends Equatable {
  const NeoScaffoldEvent();
}

class NeoScaffoldEventInitialize extends NeoScaffoldEvent {
  const NeoScaffoldEventInitialize();

  @override
  List<Object> get props => [];
}

class NeoScaffoldEventBackButtonPressed extends NeoScaffoldEvent {
  const NeoScaffoldEventBackButtonPressed();

  @override
  List<Object> get props => [];
}

class NeoScaffoldEventChangeBackgroundColor extends NeoScaffoldEvent {
  final Color backgroundColor;

  const NeoScaffoldEventChangeBackgroundColor({required this.backgroundColor});

  @override
  List<Object> get props => [backgroundColor];
}
