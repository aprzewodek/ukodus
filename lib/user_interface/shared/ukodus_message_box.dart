import 'package:flutter/material.dart';
import 'package:ukodus/helpers/ukodus_assets.dart';
import 'package:ukodus/helpers/ukodus_colors.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';

class UkodusMessageBox extends StatelessWidget {
  final String header;
  final Widget child;
  final List<Widget>? buttons;
  final bool isBig;

  const UkodusMessageBox({
    Key? key,
    required this.header,
    required this.child,
    this.buttons,
    this.isBig = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding:
          const EdgeInsets.all(UkodusDimentions.dialogBorderPadding),
      backgroundColor: UkodusColors.accent,
      children: [
        Container(
          height: isBig
              ? UkodusDimentions.dialogHeightBig
              : UkodusDimentions.dialogHeight,
          constraints:
              const BoxConstraints(maxWidth: UkodusDimentions.dialogWidth),
          decoration: const BoxDecoration(
            color: UkodusColors.panelBackground,
          ),
          child: Stack(
            children: [
              _getBackground(),
              _getHeader(),
              _getContent(),
              _getButtons(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getBackground() {
    return Image.asset(
      UkodusAssets.background,
      color: UkodusColors.background,
      colorBlendMode: BlendMode.darken,
    );
  }

  Widget _getHeader() {
    return Positioned(
      top: UkodusDimentions.paddingBig,
      left: UkodusDimentions.paddingBig,
      right: UkodusDimentions.paddingBig,
      child: Text(
        header,
        style: const TextStyle(
          color: UkodusColors.font,
          fontSize: UkodusDimentions.fontSize * 2,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _getContent() {
    return Positioned(
      top: UkodusDimentions.paddingBig * 5,
      left: UkodusDimentions.paddingBig,
      right: UkodusDimentions.paddingBig,
      child: child,
    );
  }

  Widget _getButtons() {
    if (buttons != null) {
      return Positioned(
        bottom: UkodusDimentions.paddingBig,
        left: UkodusDimentions.paddingBig,
        right: UkodusDimentions.paddingBig,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buttons!,
        ),
      );
    }

    return Container();
  }
}
