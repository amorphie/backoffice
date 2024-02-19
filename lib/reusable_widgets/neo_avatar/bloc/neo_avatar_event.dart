/*
 * neo_bank
 *
 * Created on 26/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

part of 'neo_avatar_bloc.dart';

sealed class NeoAvatarEvent extends Equatable {
  const NeoAvatarEvent();
}

class NeoAvatarEventInitialize extends NeoAvatarEvent {
  final NeoAvatarDisplayMode displayMode;
  const NeoAvatarEventInitialize(this.displayMode);

  @override
  List<Object> get props => [displayMode];
}

class NeoAvatarEventChangeTextStyles extends NeoAvatarEvent {
  final TextStyle? subTitleStyle;
  final TextStyle? labelTitleStyle;

  const NeoAvatarEventChangeTextStyles({
    this.subTitleStyle,
    this.labelTitleStyle,
  });

  @override
  List<Object?> get props => [subTitleStyle, labelTitleStyle];
}

class NeoAvatarEventSaveAvatarImage extends NeoAvatarEvent {
  const NeoAvatarEventSaveAvatarImage(this.imagePath);
  final String imagePath;
  @override
  List<Object?> get props => [imagePath];
}

class NeoAvatarEventDeleteAvatarImage extends NeoAvatarEvent {
  const NeoAvatarEventDeleteAvatarImage();
  @override
  List<Object?> get props => [];
}

class NeoAvatarEventGetAvatarImage extends NeoAvatarEvent {
  const NeoAvatarEventGetAvatarImage();
  @override
  List<Object?> get props => [];
}

class NeoAvatarEventGetCustomerNameAndSurname extends NeoAvatarEvent {
  const NeoAvatarEventGetCustomerNameAndSurname();
  @override
  List<Object?> get props => [];
}
