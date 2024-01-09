/*
 * 
 * neo_ui
 * 
 * Created on 22/11/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 * 
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 * 
 */

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:backoffice/util/neo_util.dart';

class NeoIcon extends StatelessWidget {
  final String iconUrn;
  final Color? color;
  final EdgeInsetsDirectional padding;
  final double _width;
  final double _height;

  const NeoIcon({
    required this.iconUrn,
    this.color,
    this.padding = EdgeInsetsDirectional.zero,
    double? width,
    double? height,
    super.key,
  })  : _width = width ?? height ?? NeoDimens.px24,
        _height = height ?? width ?? NeoDimens.px24;

  @override
  Widget build(BuildContext context) {
    final urn = AssetUrn.fromString(iconUrn);
    if (urn == null) {
      return _buildEmptyIcon;
    }
    return switch (urn.location) {
      AssetUrnLocation.local => _buildLocalIcon(urn),
      AssetUrnLocation.network => _buildEmptyIcon, // STOPSHIP: Add network icon logic
    }
        .padding(padding);
  }

  Widget _buildLocalIcon(AssetUrn localUrn) {
    final path = localUrn.path;
    return switch (localUrn.type) {
      AssetUrnType.svg => _buildSvgPicture(path),
      AssetUrnType.png => _buildPngIcon(path),
      AssetUrnType.json => _buildEmptyIcon,
    };
  }

  Widget _buildSvgPicture(String path) {
    return SvgPicture.asset(
      path,
      width: _width,
      height: _height,
      colorFilter: color.isNotNull ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }

  Widget _buildPngIcon(String path) {
    final Widget image = Image.asset(
      path,
      width: _width,
      height: _height,
    );
    return color.isNull ? image : ColorFiltered(colorFilter: ColorFilter.mode(color!, BlendMode.srcIn), child: image);
  }

  Widget get _buildEmptyIcon => const SizedBox.shrink();
}
