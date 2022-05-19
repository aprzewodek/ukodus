import 'package:flutter/material.dart';
import 'package:ukodus/helpers/ukodus_assets.dart';
import 'package:ukodus/helpers/ukodus_colors.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';
import 'package:ukodus/user_interface/screens/how_to_play/help_text.dart';

import 'page_template.dart';

class Page08 extends StatelessWidget {
  const Page08({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PageTemplate(
      color: UkodusColors.button,
      image: UkodusAssets.help06,
      children: [
        HelpText(
          'Completing columns.',
          isHeader: true,
        ),
        SizedBox(height: UkodusDimentions.padding),
        HelpText(
          'Every column must have each of the numbers from 1 to 4, 5 or 6 (depending on the difficulty level).',
        ),
        SizedBox(height: UkodusDimentions.padding),
        HelpText(
          'Have a look at column 1 in the puzzle above. You can see that numbers 5, 2 and 3 are in that column only once. It means that they must stay there.',
        ),
      ],
    );
  }
}
