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
import 'dart:math';

import 'package:flutter/material.dart';

abstract class _Constants {
  static const double minLoadingIndicatorSize = 24;
}

class GradientCircularLoadingIndicator extends StatefulWidget {
  final Gradient gradient;
  final Duration lapDuration;
  final double stroke;

  const GradientCircularLoadingIndicator({
    required this.gradient,
    super.key,
    this.lapDuration = const Duration(milliseconds: 1500),
    this.stroke = 4,
  });

  @override
  State<GradientCircularLoadingIndicator> createState() => _GradientCircularLoadingIndicatorState();
}

class _GradientCircularLoadingIndicatorState extends State<GradientCircularLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.lapDuration)..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: _Constants.minLoadingIndicatorSize,
        minWidth: _Constants.minLoadingIndicatorSize,
      ),
      child: RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
        child: CustomPaint(
          painter: _GradientCircularLoadingPainter(
            gradient: widget.gradient,
            stroke: widget.stroke,
          ),
        ),
      ),
    );
  }
}

class _GradientCircularLoadingPainter extends CustomPainter {
  final Gradient gradient;
  final double stroke;

  _GradientCircularLoadingPainter({
    required this.gradient,
    required this.stroke,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.height, size.width) / 2;
    final startAngle = _degreeToRadian(0);
    final endAngle = _degreeToRadian(360);
    final cutAngle = _degreeToRadian(90);

    final shader = SweepGradient(
      colors: gradient.colors.reversed.toList(),
      tileMode: TileMode.repeated,
      startAngle: startAngle - _degreeToRadian(45),
      endAngle: endAngle - _degreeToRadian(45),
    ).createShader(Rect.fromCircle(center: center, radius: radius));

    final gradientPaint = Paint()
      ..shader = shader
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      endAngle - cutAngle,
      false,
      gradientPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  double _degreeToRadian(double degree) => degree * pi / 180;
}
