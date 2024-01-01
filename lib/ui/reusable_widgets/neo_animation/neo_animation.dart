/*
 * Neobank.Client
 *
 * Created on 13/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:admin/core/util/neo_util.dart';

class NeoAnimation extends StatelessWidget {
  final String animationUrn;
  final bool isFullscreen;
  final double? width;
  final double? height;
  final EdgeInsetsDirectional padding;
  final bool? repeat;
  final bool? reverse;

  const NeoAnimation({
    required this.animationUrn,
    this.isFullscreen = false,
    this.width,
    this.height,
    this.padding = EdgeInsetsDirectional.zero,
    this.repeat,
    this.reverse,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final urn = AssetUrn.fromString(animationUrn);
    if (urn == null) {
      return _buildEmptyAnimation;
    }
    return SizedBox(
      width: isFullscreen ? double.infinity : width,
      height: isFullscreen ? double.infinity : height,
      child: _buildAnimation(urn),
    ).padding(padding);
  }

  Widget _buildAnimation(AssetUrn urn) {
    return switch (urn.location) {
      AssetUrnLocation.local => Lottie.asset(urn.path, fit: BoxFit.fill, repeat: repeat, reverse: reverse),
      AssetUrnLocation.network => _buildEmptyAnimation,
    };
  }

  Widget get _buildEmptyAnimation => const SizedBox.shrink();
}
