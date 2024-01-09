import 'package:flutter/material.dart';
import 'package:backoffice/demo_features/demo_saving_accounts_flow_two/new_neo_transition_button.dart';

class CustomNeoTransitionButton extends StatelessWidget {
  final String entity;
  final String transitionId;
  final String text;

  const CustomNeoTransitionButton({required this.entity, required this.transitionId, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: NewNeoTransitionButton(
          transitionId: transitionId,
          text: text,
        ),
      ),
    );
  }
}
