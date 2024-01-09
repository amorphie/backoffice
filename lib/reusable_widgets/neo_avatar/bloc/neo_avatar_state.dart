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

class NeoAvatarState extends Equatable {
  final TextStyle subTitleStyle;
  final TextStyle labelTitleStyle;
  final Uint8List? avatarImage;

  const NeoAvatarState({required this.subTitleStyle, required this.labelTitleStyle, this.avatarImage});

  @override
  List<Object?> get props => [subTitleStyle, labelTitleStyle, avatarImage];
}
