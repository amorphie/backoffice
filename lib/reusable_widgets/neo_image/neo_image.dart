import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:backoffice/reusable_widgets/neo_icon/neo_icon.dart';
import 'package:backoffice/util/neo_util.dart';

abstract class _Constants {
  static const gridBackgroundDefaultHeight = 152.0;
  static const gridBackgroundDefaultWidht = 320.0;
  static const networkImageIdentifier = "http";
}

class NeoImage extends StatelessWidget {
  final String imageUrn;
  final String? dataKey;
  final double? width;
  final double? height;
  final double? aspectRatio;
  final bool showGridBackground;
  final double? borderWidth;
  final BorderRadius? borderRadius;
  final Color borderColor;
  final EdgeInsetsDirectional padding;

  const NeoImage({
    required this.imageUrn,
    this.dataKey,
    super.key,
    this.width,
    this.height,
    this.aspectRatio,
    this.showGridBackground = false,
    this.padding = EdgeInsetsDirectional.zero,
    this.borderWidth,
    this.borderColor = Colors.white,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return buildNeoImage(context).padding(padding);
  }

  Stack buildNeoImage(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        if (showGridBackground)
          NeoIcon(
            width: _Constants.gridBackgroundDefaultWidht,
            height: _Constants.gridBackgroundDefaultHeight,
            iconUrn: NeoAssets.gridBackground.urn,
          ),
        if (borderWidth == null) buildImage(context) else buildBorderedImage(context),
      ],
    );
  }

  Widget buildBorderedImage(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: DecoratedBox(
        decoration: BoxDecoration(color: borderColor),
        child: buildImage(context).paddingAll(borderWidth!),
      ),
    );
  }

  Widget buildImage(BuildContext context) {
    Widget image;
    final url = dataKey != null ? imageUrn.formatDataWithDataKey(context, dataKey) : imageUrn;
    if (url.contains(_Constants.networkImageIdentifier)) {
      image = _buildNetworkImage(url);
    } else {
      final urn = AssetUrn.fromString(imageUrn);
      if (urn == null) {
        return _buildEmptyImage;
      }
      image = switch (urn.location) {
        AssetUrnLocation.local => _buildLocalImage(urn),
        AssetUrnLocation.network => _buildEmptyImage, // STOPSHIP: Add network image logic
      };
    }

    final imageWidget = aspectRatio == null
        ? image
        : SizedBox(
            width: width,
            height: height,
            child: AspectRatio(
              aspectRatio: aspectRatio!,
              child: image,
            ),
          );

    return borderRadius != null
        ? ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.zero,
            child: imageWidget,
          )
        : imageWidget;
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

  Widget _buildNetworkImage(String url) {
    return Image.network(
      url,
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }

  Widget get _buildEmptyImage => const SizedBox.shrink(); // STOPSHIP: Add empty image logic
}
