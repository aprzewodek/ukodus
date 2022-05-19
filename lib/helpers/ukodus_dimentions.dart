import 'package:flutter/cupertino.dart';

class UkodusDimentions {
  static const padding = 8.0;
  static const paddingBig = 16.0;
  static const paddingHelp = 32.0;
  static const borderRatius = 10.0;
  static const iconSize = 32.0;
  static const tileShadowOffset = 4.0;
  static const tileShadowBlur = 4.0;
  static const minTileSize = 50.0;
  static const fontSize = 20.0;
  static const fontSizeSmall = 16.0;
  static const dialogWidth = 600.0;
  static const dialogImageSize = 250.0;
  static const dialogHeight = 250.0;
  static const dialogHeightBig = 500.0;
  static const dialogBorderPadding = 2.0;

  static getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
