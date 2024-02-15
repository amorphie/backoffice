import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


class NeoSwipeCardState extends Equatable {
  final int currentIndex;
  final List<Widget> cards;
  final double currentCardXPosition;
  final double currentCardRotation;

  const NeoSwipeCardState({
    required this.currentIndex,
    required this.cards,
    this.currentCardXPosition = 0.0,
    this.currentCardRotation = 0.0,
  });

  @override
  List<Object?> get props => [currentIndex, cards, currentCardXPosition, currentCardRotation];
}
