/*
 * neo_bank
 *
 * Created on 17/1/2024.
 * Copyright (c) 2024 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

import 'package:lottie/lottie.dart';
import 'package:backoffice/util/neo_assets.dart';

class LottieAnimationCache {
  Map<String, LottieComposition> animationsMap = {};

  final initialAnimationPathListToLoad = [NeoAssets.welcomeBackground.path];

  Future<void> loadInitialAnimations() async {
    for (final animationPath in initialAnimationPathListToLoad) {
      animationsMap[animationPath] = await AssetLottie(animationPath).load();
    }
  }

  Future<void> cacheAnimation(String animationPath) async {
    animationsMap[animationPath] = await AssetLottie(animationPath).load();
  }

  LottieComposition? getAnimation(String animationPath) {
    return animationsMap[animationPath];
  }
}
