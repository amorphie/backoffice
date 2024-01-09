// ignore_for_file: public_member_api_docs, sort_constructors_first
/*
 * 
 * Neobank.Client
 * 
 * Created on 18/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:backoffice/reusable_widgets/neo_scaffold/bloc/neo_scaffold_bloc.dart';
import 'package:backoffice/util/neo_util.dart';

class NeoScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Widget? drawer;
  final DragStartBehavior drawerDragStartBehavior;
  final double? drawerEdgeDragWidth;
  final bool drawerEnableOpenDragGesture;
  final Color? drawerScrimColor;
  final Widget? endDrawer;
  final bool endDrawerEnableOpenDragGesture;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  // ignore: avoid_positional_boolean_parameters
  final void Function(bool)? onDrawerChanged;

  // ignore: avoid_positional_boolean_parameters
  final void Function(bool)? onEndDrawerChanged;
  final AlignmentDirectional persistentFooterAlignment;
  final List<Widget>? persistentFooterButtons;
  final bool primary;
  final bool? resizeToAvoidBottomInset;
  final String? restorationId;
  final bool useSafeArea;
  final EdgeInsetsDirectional padding;

  const NeoScaffold({
    super.key,
    this.appBar,
    this.backgroundColor,
    this.body,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.drawer,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.drawerScrimColor,
    this.endDrawer,
    this.endDrawerEnableOpenDragGesture = true,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.floatingActionButton,
    this.floatingActionButtonAnimator,
    this.floatingActionButtonLocation,
    this.onDrawerChanged,
    this.onEndDrawerChanged,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.persistentFooterButtons,
    this.primary = true,
    this.resizeToAvoidBottomInset,
    this.restorationId,
    this.useSafeArea = false,
    this.padding = EdgeInsetsDirectional.zero,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NeoScaffoldBloc, NeoScaffoldState>(
      bloc: NeoScaffoldBloc()..add(const NeoScaffoldEventInitialize()),
      builder: (context, state) {
        return AnimatedContainer(
          duration: AppConstants.defaultAnimationDuration,
          color: state.backgroundColor ?? backgroundColor,
          child: PopScope(
            canPop: false,
            onPopInvoked: (didPop) {
              context.read()<NeoScaffoldBloc>().add(const NeoScaffoldEventBackButtonPressed());
            },
            child: Scaffold(
              appBar: appBar,
              body: _buildBody(),
              backgroundColor: backgroundColor,
              bottomNavigationBar: bottomNavigationBar,
              bottomSheet: bottomSheet,
              drawer: drawer,
              drawerDragStartBehavior: drawerDragStartBehavior,
              drawerEdgeDragWidth: drawerEdgeDragWidth,
              drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
              drawerScrimColor: drawerScrimColor,
              endDrawer: endDrawer,
              endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
              extendBody: extendBody,
              extendBodyBehindAppBar: extendBodyBehindAppBar,
              floatingActionButton: floatingActionButton,
              floatingActionButtonAnimator: floatingActionButtonAnimator,
              floatingActionButtonLocation: floatingActionButtonLocation,
              onDrawerChanged: onDrawerChanged,
              onEndDrawerChanged: onEndDrawerChanged,
              persistentFooterAlignment: persistentFooterAlignment,
              persistentFooterButtons: persistentFooterButtons,
              primary: primary,
              resizeToAvoidBottomInset: resizeToAvoidBottomInset,
              restorationId: restorationId,
            ),
          ),
        );
      },
    );
  }

  Widget? _buildBody() {
    if (body.isNull) {
      return null;
    }
    return (useSafeArea ? SafeArea(child: body!) : body!).padding(padding);
  }
}
