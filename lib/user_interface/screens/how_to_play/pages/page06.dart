import 'package:flutter/material.dart';
import 'package:ukodus/helpers/ukodus_assets.dart';
import 'package:ukodus/helpers/ukodus_colors.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';
import 'package:ukodus/user_interface/screens/how_to_play/help_text.dart';
import 'package:ukodus/user_interface/screens/how_to_play/pages/page_template.dart';

class Page06 extends StatelessWidget {
  const Page06({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PageTemplate(
      color: UkodusColors.background,
      image: UkodusAssets.help04,
      children: [
        HelpText(
          'Completing a block.',
          isHeader: true,
        ),
        SizedBox(height: UkodusDimentions.padding),
        HelpText(
          'Every block must have each of the numbers from 1 to 4, 5 or 6 (depending on the difficulty level).',
        ),
        SizedBox(height: UkodusDimentions.padding),
        HelpText(
          'Have a close look at three-by-three block at the upper left corner.',
        ),
        SizedBox(height: UkodusDimentions.padding),
        HelpText(
          'You can see that numbers 1, 4 and 5 are in that block only once. It means that they must stay there, so tap them once.',
        ),
      ],
    );
  }
}
