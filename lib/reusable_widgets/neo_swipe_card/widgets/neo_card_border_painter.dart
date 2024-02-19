import 'package:flutter/material.dart';
import 'package:backoffice/util/constants/neo_dimens.dart';

// TODO: Remove this border painter
class NeoCardBorderPainter extends CustomPainter {
  late final LinearGradient _gradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.center,
    colors: [
      Colors.white,
      Colors.white,
    ],
  );

  @override
  void paint(Canvas canvas, Size size) {
    final rectSize = Size(size.width, size.height);
    final rect = Offset.zero & rectSize;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = NeoDimens.px2
      ..shader = _gradient.createShader(rect);

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            0,
            0,
            size.width,
            size.height,
          ),
          const Radius.circular(NeoDimens.px20),
        ),
      );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
