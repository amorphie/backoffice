/*
 * Neobank.Client
 *
 * Created on 23/11/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

part of 'neo_swipe_button_bloc.dart';

class NeoSwipeButtonState extends Equatable {
  final bool isLoading;

  const NeoSwipeButtonState({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];
}
