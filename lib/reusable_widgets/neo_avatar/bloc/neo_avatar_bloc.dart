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

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/core/neo_secure_storage/neo_secure_storage.dart';
import 'package:backoffice/util/constants/neo_widget_event_keys.dart';
import 'package:backoffice/util/neo_util.dart';
import 'package:neo_core/core/bus/neo_bus.dart';

part 'neo_avatar_event.dart';
part 'neo_avatar_state.dart';

abstract class _Constants {
  static TextStyle subTitleFocusedStyle = NeoTextStyles.bodyFourteenMedium.copyWith(color: NeoColors.textSecondary);
  static TextStyle subTitleInitialStyle = NeoTextStyles.bodyFourteenMedium.apply(color: NeoColors.bgPrimaryGreen);
  static TextStyle labelTitleFocusedStyle = NeoTextStyles.titleTwentySemibold.apply(color: NeoColors.textDefault);
  static TextStyle labelTitleInitialStyle = NeoTextStyles.titleTwentySemibold.apply(color: NeoColors.textDefaultInverse);
}

class NeoAvatarBloc extends Bloc<NeoAvatarEvent, NeoAvatarState> {
  late final StreamSubscription<NeoWidgetEvent>? _neoWidgetEventSubscription;
  TextStyle _subTitleStyle = _Constants.subTitleInitialStyle;
  TextStyle _labelTitleStyle = _Constants.labelTitleInitialStyle;
  Uint8List? _avatarImage;
  final NeoSecureStorage _neoSecureStorage;

  NeoAvatarBloc()
      : _neoSecureStorage = NeoSecureStorage(),
        super(
          NeoAvatarState(
            subTitleStyle: _Constants.subTitleInitialStyle,
            labelTitleStyle: _Constants.labelTitleInitialStyle,
          ),
        ) {
    on<NeoAvatarEventInitialize>(_onInitialize);
    on<NeoAvatarEventChangeTextStyles>(_onChangeTextStyles);
    on<NeoAvatarEventSaveAvatarImage>(_onSaveAvatarImage);
    on<NeoAvatarEventDeleteAvatarImage>(_onDeleteAvatarImage);
    on<NeoAvatarEventGetAvatarImage>(_onGetAvatarImage);
  }

  _onInitialize(NeoAvatarEventInitialize event, Emitter<NeoAvatarState> emit) {
    _neoWidgetEventSubscription = [
      // STOPSHIP: Remove this events, use instead NeoWidgetEventKeys.commonNeoAvatarChangeTextStyles
      (
        NeoWidgetEventKeys.loginTextFieldFocused,
        (_) => add(
              NeoAvatarEventChangeTextStyles(
                subTitleStyle: _Constants.subTitleFocusedStyle,
                labelTitleStyle: _Constants.labelTitleFocusedStyle,
              ),
            )
      ),
      (
        NeoWidgetEventKeys.loginTextFieldUnfocused,
        (_) => add(
              NeoAvatarEventChangeTextStyles(
                subTitleStyle: _Constants.subTitleInitialStyle,
                labelTitleStyle: _Constants.labelTitleInitialStyle,
              ),
            )
      ),
      (NeoWidgetEventKeys.neoAvatarChangePhotoEventKey, (event) => add(NeoAvatarEventSaveAvatarImage(event.data ?? ''))),
      (NeoWidgetEventKeys.neoAvatarDeletePhotoEventKey, (_) => add(const NeoAvatarEventDeleteAvatarImage())),
    ].listenEvents();
  }

  _onChangeTextStyles(NeoAvatarEventChangeTextStyles event, Emitter<NeoAvatarState> emit) {
    if (event.subTitleStyle != null) {
      _subTitleStyle = event.subTitleStyle!;
    }
    if (event.labelTitleStyle != null) {
      _labelTitleStyle = event.labelTitleStyle!;
    }
    emit(NeoAvatarState(subTitleStyle: _subTitleStyle, labelTitleStyle: _labelTitleStyle, avatarImage: _avatarImage));
  }

  Future<void> _onSaveAvatarImage(NeoAvatarEventSaveAvatarImage event, Emitter<NeoAvatarState> emit) async {
    final bytes = File(event.imagePath).readAsBytesSync();
    final String img64 = base64Encode(bytes);
    await _neoSecureStorage.setProfileImage(img64);
    add(const NeoAvatarEventGetAvatarImage());
  }

  Future<void> _onDeleteAvatarImage(NeoAvatarEventDeleteAvatarImage event, Emitter<NeoAvatarState> emit) async {
    await _neoSecureStorage.deleteProfileImage();
    add(const NeoAvatarEventGetAvatarImage());
  }

  Future<void> _onGetAvatarImage(NeoAvatarEventGetAvatarImage event, Emitter<NeoAvatarState> emit) async {
    final base64Image = await _neoSecureStorage.getProfileImage();
    if (base64Image.isNullOrBlank) {
      _avatarImage = null;
    } else {
      _avatarImage = base64.decode(base64Image!);
    }
    emit(
      NeoAvatarState(
        subTitleStyle: _subTitleStyle,
        labelTitleStyle: _labelTitleStyle,
        avatarImage: _avatarImage,
      ),
    );
  }

  @override
  Future<void> close() {
    _neoWidgetEventSubscription?.cancel();
    return super.close();
  }
}
