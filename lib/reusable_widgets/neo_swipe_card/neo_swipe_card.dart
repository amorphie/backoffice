import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_dot_indicator/neo_dot_indicator.dart';
import 'package:backoffice/reusable_widgets/neo_swipe_card/bloc/neo_swipe_card_bloc.dart';
import 'package:backoffice/reusable_widgets/neo_swipe_card/bloc/neo_swipe_card_event.dart';
import 'package:backoffice/reusable_widgets/neo_swipe_card/bloc/neo_swipe_card_state.dart';
import 'package:backoffice/util/neo_util.dart';

abstract class _Constants {
  static const double scaleMultiplier = 0.1;
  static const double nextCardScaleStart = 0.9;
  static const double animatedCardScaleStart = 1.0;
  static const double offsetStart = 0.5;
  static const double offsetEnd = 1.0;
  static const double widthThresholdMultiplier = 0.4;
  static const double rotationMultiplier = -0.1;
  static const double zero = 0.0;
}

class NeoSwipeCard extends StatefulWidget {
  final List<Widget> cards;
  final EdgeInsetsDirectional padding;
  final bool displayDotIndicator;

  const NeoSwipeCard({
    required this.cards,
    this.displayDotIndicator = true,
    this.padding = EdgeInsetsDirectional.zero,
    super.key,
  });

  @override
  State<NeoSwipeCard> createState() => _NeoSwipeCardState();
}

class _NeoSwipeCardState extends State<NeoSwipeCard> with TickerProviderStateMixin {
  late final AnimationController animationController = AnimationController(
    duration: AppConstants.defaultAnimationDuration,
    vsync: this,
  );
  late final Animation<Offset> nextCardOffsetAnimation = Tween<Offset>(begin: const Offset(0, -NeoDimens.px48), end: const Offset(0, NeoDimens.px12)).animate(
    CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    ),
  );
  late final Animation<double> opacityAnimation = Tween<double>(begin: _Constants.offsetEnd, end: 0.0).animate(
    CurvedAnimation(
      parent: animationController,
      curve: const Interval(_Constants.zero, _Constants.offsetStart, curve: Curves.easeOut),
      reverseCurve: const Interval(_Constants.offsetStart, _Constants.offsetEnd, curve: Curves.easeIn),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NeoSwipeCardBloc()..add(NeoSwipeCardEventInitialize(cards: widget.cards)),
      child: BlocBuilder<NeoSwipeCardBloc, NeoSwipeCardState>(
        builder: (context, state) {
          final double swipeThreshold = MediaQuery.of(context).size.width * _Constants.widthThresholdMultiplier;
          return Column(
            children: [
              GestureDetector(
                onHorizontalDragEnd: (DragEndDetails details) {
                  if (state.currentCardXPosition.abs() < swipeThreshold) {
                    context.read<NeoSwipeCardBloc>().add(const NeoSwipeCardEventUpdatePositions());
                    return;
                  }
                  if (details.primaryVelocity! < 0) {
                    if (state.currentIndex < state.cards.length - 1) {
                      context.read<NeoSwipeCardBloc>().add(NeoSwipeCardEventSwipeLeft());
                      _startAnimation(context);
                    }
                  } else if (details.primaryVelocity! > 0) {
                    if (state.currentIndex > 0) {
                      context.read<NeoSwipeCardBloc>().add(NeoSwipeCardEventSwipeRight());
                      _startAnimation(context);
                    }
                  }
                },
                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  final double delta = details.primaryDelta ?? 0;

                  if (state.currentIndex == 0 && delta > 0) {
                    return;
                  } else if (state.currentIndex == state.cards.length - 1 && delta < 0) {
                    return;
                  }
                  context.read<NeoSwipeCardBloc>().add(
                        NeoSwipeCardEventUpdatePositions(
                          currentCardXPosition: state.currentCardXPosition + delta,
                          currentCardRotation: state.currentCardRotation / MediaQuery.of(context).size.width * _Constants.rotationMultiplier,
                        ),
                      );
                  if (state.currentCardXPosition.abs() > swipeThreshold) {
                    _startAnimation(context);
                  }
                },
                child: Stack(
                  children: _buildCards(context, state),
                ),
              ),
              if (widget.displayDotIndicator && state.cards.length > 1)
                NeoDotIndicator(
                  animationController: animationController,
                  currentIndex: state.currentIndex,
                  itemCount: state.cards.length,
                ).paddingOnly(top: NeoDimens.px12)
              else
                const SizedBox.shrink(),
            ],
          ).padding(widget.padding);
        },
      ),
    );
  }

  void _startAnimation(BuildContext context) {
    animationController.forward(from: 0).then((_) {
      context.read<NeoSwipeCardBloc>().add(const NeoSwipeCardEventUpdatePositions());
      animationController.reset();
    });
  }

  List<Widget> _buildCards(BuildContext context, NeoSwipeCardState state) {
    final List<Widget> cardList = [];

    if (state.cards.length == 1) {
      cardList.add(_buildAnimatedCard(context, state));
    } else {
      for (int i = 0; i < state.cards.length; i++) {
        if (state.currentIndex >= state.cards.length - 1 && state.currentIndex == i) {
          cardList
            ..add(_buildNextCardWidget(state, true))
            ..add(_buildAnimatedCard(context, state));
          break;
        }
        if (state.currentIndex == i) {
          cardList
            ..add(_buildNextCardWidget(state, false))
            ..add(_buildAnimatedCard(context, state));
          break;
        }
      }
    }
    return cardList;
  }

  Widget _buildAnimatedCard(BuildContext context, NeoSwipeCardState state) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        final double scale = _Constants.animatedCardScaleStart - animationController.value * _Constants.scaleMultiplier;
        final Matrix4 transformationMatrix = Matrix4.identity()
          ..translate(state.currentCardXPosition)
          ..rotateZ(state.currentCardRotation)
          ..scale(scale);
        return Transform(
          transform: transformationMatrix,
          alignment: Alignment.center,
          child: Opacity(
            opacity: opacityAnimation.value,
            child: child,
          ),
        );
      },
      child: Wrap(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: NeoColors.baseWhite,
              borderRadius: BorderRadius.circular(NeoRadius.px20),
              boxShadow: const [NeoShadows.xl],
            ),
            child: state.cards[state.currentIndex],
          ).paddingOnly(start: NeoDimens.px36, end: NeoDimens.px36, top: NeoDimens.px48),
        ],
      ),
    );
  }

  Widget _buildNextCardWidget(NeoSwipeCardState state, bool isPrevious) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        final double scale = _Constants.nextCardScaleStart + animationController.value * _Constants.scaleMultiplier;
        return Transform.translate(
          offset: nextCardOffsetAnimation.value,
          child: Transform.scale(
            scale: scale,
            child: child,
          ),
        );
      },
      child: Align(
        alignment: Alignment.topCenter,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: NeoColors.baseWhite,
            borderRadius: BorderRadius.circular(NeoRadius.px20),
            boxShadow: const [NeoShadows.xl],
          ),
          child: isPrevious ? state.cards[state.currentIndex - 1] : state.cards[state.currentIndex + 1],
        ).paddingOnly(start: NeoDimens.px48, end: NeoDimens.px48, top: NeoDimens.px48),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
