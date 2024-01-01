import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:admin/ui/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:admin/core/util/neo_util.dart';

abstract class _Constants {
  static const gridBackgroundDefaultHeight = 152.0;
  static const gridBackgroundDefaultWidht = 320.0;
}

class NeoImage extends StatelessWidget {
  final String imageUrn;
  final double? width;
  final double? height;
  final double? aspectRatio;
  final bool showGridBackground;
  final double? borderWidth;
  final double? borderRadius;
  final Color borderColor;
  final EdgeInsetsDirectional padding;
  const NeoImage({
    required this.imageUrn,
    super.key,
    this.width,
    this.height,
    this.aspectRatio,
    this.showGridBackground = false,
    this.padding = EdgeInsetsDirectional.zero,
    this.borderWidth,
    this.borderColor = Colors.white,
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return buildNeoImage().padding(padding);
  }

  Stack buildNeoImage() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        if (showGridBackground)
          NeoIcon(
            width: _Constants.gridBackgroundDefaultWidht,
            height: _Constants.gridBackgroundDefaultHeight,
            iconUrn: NeoAssets.gridBackground.urn,
          ),
        if (borderWidth == null) buildImage() else buildBorderedImage(),
      ],
    );
  }

  Widget buildBorderedImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius!),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: borderWidth!),
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        child: buildImage().paddingAll(borderWidth!),
      ),
    );
  }

  Widget buildImage() {
    final urn = AssetUrn.fromString(imageUrn);
    if (urn == null) {
      return _buildEmptyImage;
    }
    final image = switch (urn.location) {
      AssetUrnLocation.local => _buildLocalImage(urn),
      AssetUrnLocation.network => _buildEmptyImage, // STOPSHIP: Add network image logic
    };
    return aspectRatio == null
        ? image
        : SizedBox(
            width: width,
            height: height,
            child: AspectRatio(
              aspectRatio: aspectRatio!,
              child: image,
            ),
          );
  }

  Widget _buildLocalImage(AssetUrn localUrn) {
    final path = localUrn.path;
    return switch (localUrn.type) {
      AssetUrnType.svg => _buildSvgPicture(path),
      AssetUrnType.png => _buildPngImage(path),
      AssetUrnType.json => _buildEmptyImage,
    };
  }

  Widget _buildSvgPicture(String path) {
    return SvgPicture.asset(
      path,
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }

  Widget _buildPngImage(String path) {
    return Image.asset(
      path,
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }

  Widget get _buildEmptyImage => const SizedBox.shrink(); // STOPSHIP: Add empty image logic
}
