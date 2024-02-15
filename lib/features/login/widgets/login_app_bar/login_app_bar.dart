/*
 * neo_bank
 *
 * Created on 25/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/features/login/widgets/login_app_bar/bloc/login_app_bar_bloc.dart';
import 'package:neo_core/core/workflow_form/bloc/workflow_form_bloc.dart';

class LoginAppBar extends StatelessWidget {
  final PreferredSizeWidget defaultAppBar;
  final PreferredSizeWidget focusedAppBar;

  const LoginAppBar({required this.defaultAppBar, required this.focusedAppBar, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginAppBarBloc, LoginAppBarState>(
      bloc: LoginAppBarBloc()..add(const LoginAppBarEventInitialize()),
      listener: (context, state) {
        switch (state) {
          case LoginAppBarStateInitial():
            context.read<WorkflowFormBloc>().add(const WorkflowFormEventResetFrom());
          case LoginAppBarStateFocused():
        }
      },
      builder: (context, state) {
        return switch (state) {
          LoginAppBarStateInitial _ => AbsorbPointer(absorbing: !state.enableUserInterface, child: defaultAppBar),
          LoginAppBarStateFocused _ => AbsorbPointer(absorbing: !state.enableUserInterface, child: focusedAppBar),
        };
      },
    );
  }
}
