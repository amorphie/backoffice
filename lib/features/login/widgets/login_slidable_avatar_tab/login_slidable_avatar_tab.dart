/*
 * neo_bank
 *
 * Created on 18/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/features/login/widgets/login_slidable_avatar_tab/bloc/login_slidable_avatar_tab_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_popup/usecases/show_user_change_popup_usecase.dart';
import 'package:backoffice/util/neo_util.dart';

abstract class _Constants {
  static const double tabIndicatorDotSize = 6;
}

class LoginSlidableAvatarTab extends StatelessWidget {
  final Widget childLogin;
  final Widget childNewUser;
  final EdgeInsetsDirectional padding;

  const LoginSlidableAvatarTab({
    required this.childLogin,
    required this.childNewUser,
    this.padding = EdgeInsetsDirectional.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginSlidableAvatarTabBloc, LoginSlidableAvatarTabState>(
      bloc: LoginSlidableAvatarTabBloc()..add(const LoginSlidableAvatarTabEventInitialize()),
      builder: (context, state) => switch (state) {
        LoginSlidableAvatarTabStateExistingUser _ => _buildExistingUserTab(context, state),
        LoginSlidableAvatarTabStateNewUser _ => childNewUser,
        LoginSlidableAvatarTabStateLoading _ => _buildLoadingState(),
      },
    ).padding(padding);
  }

  Widget _buildExistingUserTab(BuildContext context, LoginSlidableAvatarTabStateExistingUser state) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onHorizontalDragEnd: (details) {
        final isSwipedLeft = details.primaryVelocity.orZero < 0;
        if (isSwipedLeft) {
          ShowUserChangePopupUseCase().call(context);
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          childLogin.paddingOnly(bottom: NeoDimens.px12),
          _buildTabIndicators(context, state),
        ],
      ),
    );
  }

  Widget _buildTabIndicators(BuildContext context, LoginSlidableAvatarTabStateExistingUser state) {
    return Wrap(
      children: [
        Container(
          height: _Constants.tabIndicatorDotSize,
          width: _Constants.tabIndicatorDotSize,
          decoration: BoxDecoration(shape: BoxShape.circle, color: state.activeTabColor),
        ).paddingOnly(end: NeoDimens.px8),
        Container(
          height: _Constants.tabIndicatorDotSize,
          width: _Constants.tabIndicatorDotSize,
          decoration: const BoxDecoration(shape: BoxShape.circle, color: NeoColors.bgDark),
        ),
      ],
    );
  }

  // STOPSHIP: Use skeletonizer when related library added
  Widget _buildLoadingState() => const CircularProgressIndicator(color: NeoColors.bgPrimaryGreen);
}
