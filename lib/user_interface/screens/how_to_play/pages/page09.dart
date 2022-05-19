import 'package:flutter/material.dart';
import 'package:ukodus/helpers/ukodus_assets.dart';
import 'package:ukodus/helpers/ukodus_colors.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';
import 'package:ukodus/user_interface/screens/how_to_play/help_text.dart';
import 'package:ukodus/user_interface/screens/how_to_play/pages/page_template.dart';

class Page09 extends StatelessWidget {
  const Page09({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PageTemplate(
      color: UkodusColors.fontDescription,
      image: UkodusAssets.help07,
      children: [
        HelpText(
          'Marking bad numbers.',
          isHeader: true,
        ),
        SizedBox(height: UkodusDimentions.padding),
        HelpText(
          'The player must remove all unnecessary numbers so every column, row and block contains only the numbers from 1 to 4, 5 or 6 with no repeats.',
        ),
        SizedBox(height: UkodusDimentions.padding),
        HelpText(
          'Have a look at the green tile. It means that you can delete every other occurrence of that number in that row, column and block, so click on each one of them twice.',
        ),
      ],
    );
  }
}
