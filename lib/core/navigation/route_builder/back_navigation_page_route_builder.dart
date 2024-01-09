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

import 'package:flutter/material.dart';

class BackNavigationPageRouteBuilder<T> extends PageRouteBuilder<T> {
  final Widget page;

  BackNavigationPageRouteBuilder({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) {
            const beginOffset = Offset(-1.0, 0.0);
            const endOffset = Offset.zero;
            final tween = Tween(begin: beginOffset, end: endOffset).chain(CurveTween(curve: Curves.easeInOutCubic));

            return SlideTransition(position: animation.drive(tween), child: child);
          },
        );
}
