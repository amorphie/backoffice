/*
 * neo_bank
 *
 * Created on 21/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

part of 'neo_popup_bloc.dart';

sealed class NeoPopupEvent extends Equatable {
  const NeoPopupEvent();
}

class NeoPopupEventInitialize extends NeoPopupEvent {
  final List<String>? widgetEventKeys;

  const NeoPopupEventInitialize({required this.widgetEventKeys});

  @override
  List<Object?> get props => [widgetEventKeys];
}

class NeoPopupEventDismissPopup extends NeoPopupEvent {
  @override
  List<Object?> get props => [];
}
