/*
 * Neobank.Client
 *
 * Created on 7/12/2023.
 * Copyright (c) 2023 Commencis. All rights reserved.
 *
 * Save to the extent permitted by law, you may not use, copy, modify,
 * distribute or create derivative works of this material or any part
 * of it without the prior written consent of Commencis.
 * Any reproduction of this material must contain this notice.
 */

abstract class _Constants {
  static const urnPrefix = 'urn';
  static const urnSplitter = ':';
  static const basePath = 'assets';
}

enum AssetUrnLocation { local, network }

enum AssetUrnFolder { animations, icons, images }

enum AssetUrnType { json, png, svg }

class AssetUrn {
  final AssetUrnLocation location;
  final AssetUrnFolder folder;
  final String name;
  final AssetUrnType type;

  const AssetUrn({required this.location, required this.folder, required this.name, required this.type});

  static AssetUrn? fromString(String urn) {
    final parsedUrn = urn.split(_Constants.urnSplitter);
    if (parsedUrn.length != 5 || parsedUrn[0] != _Constants.urnPrefix) {
      return null;
    }
    
    final AssetUrnLocation? location = switch (parsedUrn[1]) {
      'local' => AssetUrnLocation.local,
      'network' => AssetUrnLocation.network,
      _ => null,
    };
    final AssetUrnFolder? folder = switch (parsedUrn[2]) {
      'icons' => AssetUrnFolder.icons,
      'images' => AssetUrnFolder.images,
      'animations' => AssetUrnFolder.animations,
      _ => null,
    };
    final String name = parsedUrn[3];
    final AssetUrnType? type = switch (parsedUrn[4]) {
      'png' => AssetUrnType.png,
      'svg' => AssetUrnType.svg,
      'json' => AssetUrnType.json,
      _ => null,
    };

    if (location == null || folder == null || type == null) {
      return null;
    }

    return AssetUrn(location: location, folder: folder, name: name, type: type);
  }

  String get path => '${_Constants.basePath}/${folder.name}/$name.${type.name}';
}
