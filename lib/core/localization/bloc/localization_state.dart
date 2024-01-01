/*
 * neo_bank
 *
 * Created on 4/10/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

part of 'localization_bloc.dart';

class LocalizationState extends Equatable {
  const LocalizationState(this.language);

  final Language language;

  @override
  List<Object?> get props => [language];
}
