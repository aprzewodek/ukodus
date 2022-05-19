import 'package:flutter/material.dart';
import 'package:ukodus/helpers/ukodus_assets.dart';
import 'package:ukodus/helpers/ukodus_colors.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';
import 'package:ukodus/user_interface/screens/how_to_play/help_text.dart';
import 'package:ukodus/user_interface/screens/how_to_play/pages/page_template.dart';

class Page03b extends StatelessWidget {
  const Page03b({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PageTemplate(
      color: UkodusColors.background,
      image: UkodusAssets.help10,
      children: [
        HelpText(
          'X Ukodus.',
          isHeader: true,
        ),
        SizedBox(height: UkodusDimentions.paddingHelp),
        HelpText(
          'Each puzzle is a nine-by-nine grid divided into nine horizontal rows, nine vertical columns and nine three-by-three blocks. Two diagonals are also highlighted.',
        ),
        SizedBox(height: UkodusDimentions.padding),
        HelpText(
          'To complete each puzzle, the player must remove all unnecessary numbers so every column, row, block and two diagonals contain only the numbers from 1 to 4 (hard), 1 to 5 (normal) or 1 to 6 (easy) with no repeats.',
        ),
      ],
    );
  }
}
