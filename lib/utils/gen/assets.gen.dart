/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Group 39480 (1).svg
  String get group394801 => 'assets/icons/Group 39480 (1).svg';

  /// File path: assets/icons/Upload icon.svg
  String get uploadIcon => 'assets/icons/Upload icon.svg';

  /// File path: assets/icons/box-tick.svg
  String get boxTick => 'assets/icons/box-tick.svg';

  /// File path: assets/icons/box-time.svg
  String get boxTime => 'assets/icons/box-time.svg';

  /// File path: assets/icons/calendar.svg
  String get calendar => 'assets/icons/calendar.svg';

  /// File path: assets/icons/clipboard-tick.svg
  String get clipboardTick => 'assets/icons/clipboard-tick.svg';

  /// File path: assets/icons/document-text.svg
  String get documentText => 'assets/icons/document-text.svg';

  /// File path: assets/icons/edit.svg
  String get edit => 'assets/icons/edit.svg';

  /// Directory path: assets/icons/flags
  $AssetsIconsFlagsGen get flags => const $AssetsIconsFlagsGen();

  /// File path: assets/icons/location.svg
  String get location => 'assets/icons/location.svg';

  /// File path: assets/icons/mobile.svg
  String get mobile => 'assets/icons/mobile.svg';

  /// File path: assets/icons/motor-scooter-svgrepo-com 5.svg
  String get motorScooterSvgrepoCom5 =>
      'assets/icons/motor-scooter-svgrepo-com 5.svg';

  /// File path: assets/icons/noun-pin-608665 1.svg
  String get nounPin6086651 => 'assets/icons/noun-pin-608665 1.svg';

  /// File path: assets/icons/trash.svg
  String get trash => 'assets/icons/trash.svg';

  /// File path: assets/icons/truck-fast.svg
  String get truckFast => 'assets/icons/truck-fast.svg';

  /// List of all assets
  List<String> get values => [
        group394801,
        uploadIcon,
        boxTick,
        boxTime,
        calendar,
        clipboardTick,
        documentText,
        edit,
        location,
        mobile,
        motorScooterSvgrepoCom5,
        nounPin6086651,
        trash,
        truckFast
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Done.svg
  String get done => 'assets/images/Done.svg';

  /// File path: assets/images/Frame 39428.svg
  String get frame39428 => 'assets/images/Frame 39428.svg';

  /// File path: assets/images/Group 11.svg
  String get group11 => 'assets/images/Group 11.svg';

  /// File path: assets/images/Group 39446.svg
  String get group39446 => 'assets/images/Group 39446.svg';

  /// File path: assets/images/NoConnection.svg
  String get noConnection => 'assets/images/NoConnection.svg';

  /// File path: assets/images/Rectangle 5.svg
  String get rectangle5 => 'assets/images/Rectangle 5.svg';

  /// File path: assets/images/clipboard-close.svg
  String get clipboardClose => 'assets/images/clipboard-close.svg';

  /// File path: assets/images/clipboard-close2.svg
  String get clipboardClose2 => 'assets/images/clipboard-close2.svg';

  /// File path: assets/images/clipboard-export.svg
  String get clipboardExport => 'assets/images/clipboard-export.svg';

  /// File path: assets/images/clipboard-text.svg
  String get clipboardText => 'assets/images/clipboard-text.svg';

  /// File path: assets/images/clipboard-tick.svg
  String get clipboardTick => 'assets/images/clipboard-tick.svg';

  /// File path: assets/images/f7_camera-fill.svg
  String get f7CameraFill => 'assets/images/f7_camera-fill.svg';

  /// File path: assets/images/location.svg
  String get location => 'assets/images/location.svg';

  /// List of all assets
  List<String> get values => [
        done,
        frame39428,
        group11,
        group39446,
        noConnection,
        rectangle5,
        clipboardClose,
        clipboardClose2,
        clipboardExport,
        clipboardText,
        clipboardTick,
        f7CameraFill,
        location
      ];
}

class $AssetsIconsFlagsGen {
  const $AssetsIconsFlagsGen();

  /// File path: assets/icons/flags/egypt.png
  AssetGenImage get egypt =>
      const AssetGenImage('assets/icons/flags/egypt.png');

  /// File path: assets/icons/flags/jordan.png
  AssetGenImage get jordan =>
      const AssetGenImage('assets/icons/flags/jordan.png');

  /// File path: assets/icons/flags/lebanon.png
  AssetGenImage get lebanon =>
      const AssetGenImage('assets/icons/flags/lebanon.png');

  /// File path: assets/icons/flags/qatar.png
  AssetGenImage get qatar =>
      const AssetGenImage('assets/icons/flags/qatar.png');

  /// File path: assets/icons/flags/saudi_arabia.png
  AssetGenImage get saudiArabia =>
      const AssetGenImage('assets/icons/flags/saudi_arabia.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [egypt, jordan, lebanon, qatar, saudiArabia];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
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
    bool gaplessPlayback = true,
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
