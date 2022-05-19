import 'package:flutter/material.dart';
import 'package:ukodus/helpers/ukodus_assets.dart';
import 'package:ukodus/helpers/ukodus_colors.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';
import 'package:ukodus/user_interface/screens/how_to_play/help_text.dart';
import 'package:ukodus/user_interface/screens/how_to_play/pages/page_template.dart';

class Page03 extends StatelessWidget {
  const Page03({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PageTemplate(
      color: UkodusColors.button,
      image: UkodusAssets.help03,
      children: [
        HelpText(
          'Each puzzle is a nine-by-nine grid divided into nine horizontal rows (example: blue border on the image), nine vertical columns (red border) and nine three-by-three blocks (brown border).',
        ),
        SizedBox(height: UkodusDimentions.padding),
        HelpText(
          'Each puzzle is presented with all numbers showing.',
        ),
        SizedBox(height: UkodusDimentions.padding),
        HelpText(
          'To complete each puzzle, the player must remove all unnecessary numbers so every column, row and block contains only the numbers from 1 to 4 (hard), 1 to 5 (normal) or 1 to 6 (easy) with no repeats.',
        ),
      ],
    );
  }
}
