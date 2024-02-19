import 'dart:math';

import 'package:flutter/material.dart';
import 'package:backoffice/util/neo_util.dart';

enum NeoGradientBorder {
  green50,
  green100;

  SweepGradient get gradient => switch (this) {
        NeoGradientBorder.green50 => SweepGradient(
            colors: <Color>[
              NeoColors.borderPrimaryGreen.withOpacity(0),
              NeoColors.borderPrimaryGreen,
              NeoColors.borderPrimaryGreen.withOpacity(0),
              NeoColors.borderPrimaryGreen.withOpacity(0),
              NeoColors.borderPrimaryGreen,
              NeoColors.borderPrimaryGreen.withOpacity(0),
            ],
            stops: const <double>[
              0.15,
              0.2375,
              0.325,
              0.575,
              0.7125,
              0.85,
            ],
            transform: const GradientRotation(pi / 4),
          ),
        NeoGradientBorder.green100 => SweepGradient(
            colors: <Color>[
              NeoColors.borderPrimaryGreen.withOpacity(0.05),
              NeoColors.borderPrimaryGreen,
              NeoColors.borderPrimaryGreen.withOpacity(0.2),
              NeoColors.borderPrimaryGreen.withOpacity(0.05),
              NeoColors.borderPrimaryGreen,
              NeoColors.borderPrimaryGreen.withOpacity(0.2),
            ],
            stops: const <double>[
              0.15,
              0.2375,
              0.325,
              0.575,
              0.7125,
              0.85,
            ],
            transform: const GradientRotation(pi / 4),
          ),
      };
}

class NeoGradientBorderPainter extends CustomPainter {
  const NeoGradientBorderPainter({
    required this.width,
    required this.borderGradient,
  });

  final double width;
  final NeoGradientBorder borderGradient;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    final gradient = borderGradient.gradient;
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) - (width / 2);
    const startAngle = -pi / 2;
    const sweepAngle = 2 * pi;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
