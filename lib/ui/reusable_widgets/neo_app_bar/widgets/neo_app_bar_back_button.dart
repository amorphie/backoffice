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
part of '../neo_app_bar.dart';

class _NeoAppBarBackButton extends INeoButton {
  const _NeoAppBarBackButton({super.transitionId});

  @override
  Widget Function(BuildContext context, NeoButtonState state) get childBuilder => (context, state) => BlocProvider(
        create: (context) => NeoAppBarBloc(),
        child: BlocListener<NeoAppBarBloc, NeoAppBarState>(
          listener: (context, state) {
            if (state.backButtonPressedTime != null) {
              startTransition(context);
            }
          },
          child: IconButton(
            onPressed: () => startTransition(context),
            icon: NeoIcon(iconUrn: NeoAssets.arrowLeft01.urn),
          ),
        ),
      );

  @override
  void onTransitionError(BuildContext context, String errorMessage) {
    // No-op
  }
}
