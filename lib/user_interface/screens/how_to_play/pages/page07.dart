import 'package:flutter/material.dart';
import 'package:ukodus/helpers/ukodus_assets.dart';
import 'package:ukodus/helpers/ukodus_colors.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';
import 'package:ukodus/user_interface/screens/how_to_play/help_text.dart';
import 'package:ukodus/user_interface/screens/how_to_play/pages/page_template.dart';

class Page07 extends StatelessWidget {
  const Page07({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PageTemplate(
      color: UkodusColors.accent,
      image: UkodusAssets.help05,
      children: [
        HelpText(
          'Completing rows.',
          isHeader: true,
        ),
        SizedBox(height: UkodusDimentions.padding),
        HelpText(
          'Every row must have each of the numbers from 1 to 4, 5 or 6 (depending on the difficulty level).',
        ),
        SizedBox(height: UkodusDimentions.padding),
        HelpText(
          'Have a very close look at row 1 in the puzzle above. You will see that numbers 4, 6, 1 and 3 occur only once. It means that they must stay there - tap them twice.',
        ),
      ],
    );
  }
}
