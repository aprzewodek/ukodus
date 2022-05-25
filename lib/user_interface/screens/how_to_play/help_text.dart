import 'package:flutter/material.dart';
import 'package:ukodus/helpers/ukodus_colors.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';

class HelpText extends StatelessWidget {
  final String text;
  final bool isHeader;

  const HelpText(
    this.text, {
    Key? key,
    this.isHeader = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: UkodusColors.font,
        fontSize: _getFontSize(context),
        fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  double _getFontSize(BuildContext context) {
    final height = UkodusDimentions.getHeight(context);

    var size = UkodusDimentions.fontSize;
    if (height < 800) {
      size = UkodusDimentions.fontSizeSmall;
    }
    if (height < 700) {
      size = UkodusDimentions.fontSizeSmallDevice;
    }

    return size;
  }
}
