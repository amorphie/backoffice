import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

sealed class NeoCardEvent extends Equatable {
  const NeoCardEvent();
}

class NeoSwipeCardEventSwipeRight extends NeoCardEvent {
  @override
  List<Object> get props => [];
}

class NeoSwipeCardEventInitialize extends NeoCardEvent {
  final List<Widget> cards;

  const NeoSwipeCardEventInitialize({required this.cards});

  @override
  List<Object> get props => [];
}

class NeoSwipeCardEventSwipeLeft extends NeoCardEvent {
  @override
  List<Object> get props => [];
}

class NeoSwipeCardEventUpdatePositions extends NeoCardEvent {
  final double currentCardXPosition;
  final double currentCardRotation;

  const NeoSwipeCardEventUpdatePositions({this.currentCardXPosition = 0, this.currentCardRotation = 0});

  @override
  List<Object> get props => [currentCardXPosition, currentCardRotation];
}
