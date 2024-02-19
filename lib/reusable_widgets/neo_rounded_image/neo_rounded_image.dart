import 'package:flutter/material.dart';
import 'package:backoffice/reusable_widgets/neo_avatar/widgets/neo_avatar_border_painter.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/util/neo_util.dart';

class NeoRoundedImage extends StatelessWidget {
  final String imageUrn;
  final double width;
  final double height;
  final EdgeInsetsDirectional padding;
  final bool isHighlighted;
  final bool hasBackground;
  final double borderWidth;
  final double borderDividerWidth;
  final Color? color;

  const NeoRoundedImage({
    required this.width,
    required this.height,
    required this.imageUrn,
    this.borderWidth = 3,
    this.borderDividerWidth = 3,
    this.padding = EdgeInsetsDirectional.zero,
    this.isHighlighted = false,
    this.hasBackground = false,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return isHighlighted
        ? CustomPaint(
            painter: NeoGradientBorderPainter(width: borderWidth, borderGradient: NeoGradientBorder.green100),
            child: _buildImageBackground().paddingAll(borderWidth + borderDividerWidth),
          ).padding(padding)
        : _buildImageBackground().paddingAll(borderWidth + borderDividerWidth);
  }

  Widget _buildImageBackground() {
    return hasBackground
        ? Container(
            width: NeoDimens.px48,
            height: NeoDimens.px48,
            decoration: const BoxDecoration(
              color: NeoColors.bgDarker,
              shape: BoxShape.circle,
            ),
            child: Center(child: _buildImage(imageUrn)),
          )
        : _buildImage(imageUrn);
  }

  Widget _buildImage(String urn) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(NeoRadius.rounded),
      child: NeoIcon(
        iconUrn: urn,
        width: width,
        height: height,
        color: color,
      ),
    );
  }
}
