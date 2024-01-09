/*
 * Neobank.Client
 *
 * Created on 23/11/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

part of '../neo_swipe_button.dart';

abstract class _Constants {
  static final BorderRadius borderRadius = BorderRadius.all(Radius.circular(NeoRadius.rounded));
  static const double buttonHeight = 56;
  static const double minimumButtonGap = 50;
  static const double completeSlideAt = 0.5;
  static const double buttonAcceleration = 20;
}

class _NeoSwipeButtonContent extends StatefulWidget {
  final String? labelText;
  final String? loadingLabelText;
  final EdgeInsetsDirectional? padding;

  const _NeoSwipeButtonContent({this.labelText, this.loadingLabelText, this.padding});

  @override
  State<_NeoSwipeButtonContent> createState() => _NeoSwipeButtonContentState();
}

class _NeoSwipeButtonContentState extends State<_NeoSwipeButtonContent> with SingleTickerProviderStateMixin {
  final GlobalKey _containerKey = GlobalKey();
  final GlobalKey _positionedKey = GlobalKey();
  late final AnimationController _controller;
  Offset _start = Offset.zero;
  bool _isLoading = false;

  RenderBox? get _button => _positionedKey.currentContext?.findRenderObject() as RenderBox?;
  RenderBox? get _container => _containerKey.currentContext?.findRenderObject() as RenderBox?;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NeoSwipeButtonBloc, NeoSwipeButtonState>(
      listener: (context, state) {
        if (state.isLoading) {
          _startLoading();
        } else {
          _stopLoading();
        }
        // STOPSHIP: Handle error message
      },
      child: Padding(
        padding: widget.padding ?? EdgeInsets.zero,
        child: Container(
          height: _Constants.buttonHeight,
          decoration: BoxDecoration(
            border: Border.all(color: NeoColors.borderMediumDark),
            borderRadius: _Constants.borderRadius,
          ),
          child: Stack(
            key: _containerKey,
            children: [
              _buildLoadingBackground(),
              _buildArrowIcons(context),
              _buildSlidableButton(),
            ],
          ).paddingAll(NeoDimens.px4),
        ),
      ),
    );
  }

  Widget _buildArrowIcons(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: NeoIcon(
        height: NeoDimens.px24,
        width: NeoDimens.px24,
        iconUrn: NeoAssets.arrowRightDouble.urn,
        color: NeoColors.iconSecondary,
      ).paddingSymmetric(horizontal: NeoDimens.px16),
    );
  }

  Widget _buildLoadingBackground() {
    return DecoratedBox(
      decoration: BoxDecoration(color: NeoColors.colorBaseWhite, borderRadius: _Constants.borderRadius),
      child: AnimatedOpacity(
        duration: AppConstants.defaultAnimationDuration,
        opacity: _isLoading ? 1 : 0,
        child: Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(color: NeoColors.bgDarker, borderRadius: _Constants.borderRadius),
          child: GradientCircularLoadingIndicator(
            gradient: LinearGradient(
              colors: [
                NeoColors.textPrimaryGreen,
                NeoColors.textPrimaryGreen.withOpacity(0),
              ],
            ),
          ).paddingSymmetric(horizontal: NeoDimens.px16),
        ),
      ),
    );
  }

  Widget _buildSlidableButton() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) => Align(alignment: _normalizeAlignment(_controller.value), child: child),
      child: AbsorbPointer(
        absorbing: _isLoading,
        child: GestureDetector(
          key: _positionedKey,
          behavior: HitTestBehavior.translucent,
          onHorizontalDragStart: _onDragStart,
          onHorizontalDragUpdate: _onDragUpdate,
          onHorizontalDragEnd: _onDragEnd,
          child: _buildButton(),
        ),
      ),
    );
  }

  Widget _buildButton() {
    return Container(
      constraints: BoxConstraints(maxWidth: (_container?.size.width ?? double.infinity) - _Constants.minimumButtonGap),
      decoration: BoxDecoration(color: NeoColors.bgPrimaryGreen, borderRadius: _Constants.borderRadius),
      child: Center(
        widthFactor: 1,
        child: AnimatedCrossFade(
          firstChild: _buildButtonText(widget.labelText),
          secondChild: _buildButtonText(widget.loadingLabelText ?? widget.labelText),
          duration: AppConstants.defaultAnimationDuration,
          crossFadeState: _isLoading ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        ),
      ),
    );
  }

  Widget _buildButtonText(String? label) {
    return Text(
      label.orEmpty,
      style: NeoTextStyles.labelSixteenSemibold,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    ).paddingSymmetric(horizontal: NeoDimens.px40);
  }

  void _onDragStart(DragStartDetails details) {
    final button = _button;
    if (button == null) {
      return;
    }

    final pos = button.globalToLocal(details.globalPosition);
    _start = Offset(pos.dx, 0);
    _controller.stop();
  }

  void _onDragUpdate(DragUpdateDetails details) {
    final container = _container;
    final button = _button;
    if (container == null || button == null) {
      return;
    }

    final pos = container.globalToLocal(details.globalPosition) - _start;
    final extent = container.size.width - button.size.width;
    _controller.value = pos.dx.clamp(0, extent) / extent;
  }

  void _onDragEnd(DragEndDetails details) {
    final container = _container;
    if (container == null) {
      return;
    }

    final extent = container.size.width;
    final double fractionalVelocity = (details.primaryVelocity.orZero / extent).abs();
    final double direction = _controller.value > _Constants.completeSlideAt ? 1 : -1;

    _animateButton(direction: direction, acceleration: _Constants.buttonAcceleration, velocity: fractionalVelocity);
  }

  void _afterDragEnd() {
    setState(() {
      if (_controller.value > _Constants.completeSlideAt) {
        context.read<NeoSwipeButtonBloc>().add(NeoSwipeButtonEventStartTransaction());
        _isLoading = true;
      } else {
        _isLoading = false;
      }
    });
  }

  void _stopLoading() {
    _controller.value = _controller.value - 0.01;
    _animateButton(direction: -1, acceleration: _Constants.buttonAcceleration, velocity: 0);
  }

  void _startLoading() {
    _controller.value = _controller.value + 0.01;
    _animateButton(direction: 1, acceleration: _Constants.buttonAcceleration, velocity: 0);
  }

  void _animateButton({required double direction, required acceleration, required double velocity}) {
    final double directedAcceleration = direction * acceleration;
    final double directedVelocity = direction * velocity;

    final simulation = _SlidableSimulation(
      acceleration: directedAcceleration,
      initialPosition: _controller.value,
      velocity: directedVelocity,
    );

    _controller.animateWith(simulation).whenComplete(_afterDragEnd);
  }

  Alignment _normalizeAlignment(double position) => Alignment(2 * position - 1, 0);
}

class _SlidableSimulation extends GravitySimulation {
  _SlidableSimulation({
    required acceleration,
    required initialPosition,
    required velocity,
  }) : super(
          acceleration,
          initialPosition,
          1.0,
          velocity,
        );

  @override
  double x(double time) => super.x(time).clamp(0, 1);

  @override
  bool isDone(double time) {
    return x(time) <= 0 || x(time) >= 1;
  }
}
