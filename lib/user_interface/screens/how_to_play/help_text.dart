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
        fontSize: UkodusDimentions.fontSize,
        fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
