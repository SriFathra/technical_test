/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $LibGen {
  const $LibGen();

  /// Directory path: lib/assets
  $LibAssetsGen get assets => const $LibAssetsGen();
}

class $LibAssetsGen {
  const $LibAssetsGen();

  /// Directory path: lib/assets/colors
  $LibAssetsColorsGen get colors => const $LibAssetsColorsGen();

  /// Directory path: lib/assets/images
  $LibAssetsImagesGen get images => const $LibAssetsImagesGen();
}

class $LibAssetsColorsGen {
  const $LibAssetsColorsGen();

  /// File path: lib/assets/colors/payuung_colors.xml
  String get payuungColors => 'lib/assets/colors/payuung_colors.xml';

  /// List of all assets
  List<String> get values => [payuungColors];
}

class $LibAssetsImagesGen {
  const $LibAssetsImagesGen();

  /// File path: lib/assets/images/H&M.png
  AssetGenImage get hM => const AssetGenImage('lib/assets/images/H&M.png');

  /// File path: lib/assets/images/alfamart.png
  AssetGenImage get alfamart =>
      const AssetGenImage('lib/assets/images/alfamart.png');

  /// File path: lib/assets/images/grab.png
  AssetGenImage get grab => const AssetGenImage('lib/assets/images/grab.png');

  /// File path: lib/assets/images/haagen_dazs.png
  AssetGenImage get haagenDazs =>
      const AssetGenImage('lib/assets/images/haagen_dazs.png');

  /// File path: lib/assets/images/indomaret.png
  AssetGenImage get indomaret =>
      const AssetGenImage('lib/assets/images/indomaret.png');

  /// File path: lib/assets/images/keds.png
  AssetGenImage get keds => const AssetGenImage('lib/assets/images/keds.png');

  /// File path: lib/assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('lib/assets/images/logo.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [hM, alfamart, grab, haagenDazs, indomaret, keds, logo];
}

class Assets {
  Assets._();

  static const $LibGen lib = $LibGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
