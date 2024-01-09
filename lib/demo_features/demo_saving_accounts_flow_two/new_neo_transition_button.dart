import 'package:flutter/material.dart';
import 'package:backoffice/reusable_widgets/neo_button/bloc/neo_button_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_button/i_neo_button.dart';

const _buttonColor = Color(0xFF0069AA); // TODO: Move to colors file

// STOPSHIP: Delete this demo widget
class NewNeoTransitionButton extends INeoButton {
  const NewNeoTransitionButton({
    required super.transitionId,
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget Function(BuildContext, NeoButtonState) get childBuilder => (context, state) => FilledButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          backgroundColor: _buttonColor,
        ),
        onPressed: () => startTransition(context),
        child: Text(
          text,
          maxLines: 1,
          textAlign: TextAlign.center,
        ),
      );

  @override
  void onTransitionError(BuildContext context, String errorMessage) {
    // No-op. Override if necessary
  }
}
