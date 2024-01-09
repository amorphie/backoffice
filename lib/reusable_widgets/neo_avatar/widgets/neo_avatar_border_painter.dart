part of '../neo_avatar.dart';

class _NeoAvatarBorderPainter extends CustomPainter {
  const _NeoAvatarBorderPainter({
    required this.width,
  });

  final double width;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    const firstGradientStart = 0.15;
    const firstGradientEnd = 0.325;
    const firstGradientMiddle = (firstGradientStart + firstGradientEnd) / 2;
    const secondGradientStart = 0.575;
    const secondGradientEnd = 0.85;
    const secondGradientMiddle = (secondGradientStart + secondGradientEnd) / 2;

    final gradient = SweepGradient(
      colors: <Color>[
        NeoColors.borderPrimaryGreen.withOpacity(0),
        NeoColors.borderPrimaryGreen,
        NeoColors.borderPrimaryGreen.withOpacity(0),
        NeoColors.borderPrimaryGreen.withOpacity(0),
        NeoColors.borderPrimaryGreen,
        NeoColors.borderPrimaryGreen.withOpacity(0),
      ],
      stops: const <double>[
        firstGradientStart,
        firstGradientMiddle,
        firstGradientEnd,
        secondGradientStart,
        secondGradientMiddle,
        secondGradientEnd,
      ],
      transform: const GradientRotation(pi / 4),
    );

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
