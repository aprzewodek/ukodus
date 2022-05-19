import 'package:flutter/material.dart';
import 'package:ukodus/helpers/ukodus_assets.dart';
import 'package:ukodus/helpers/ukodus_colors.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';
import 'package:ukodus/user_interface/screens/how_to_play/help_text.dart';
import 'package:ukodus/user_interface/screens/how_to_play/pages/page_template.dart';

class Page04 extends StatelessWidget {
  const Page04({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PageTemplate(
      color: UkodusColors.button,
      image: UkodusAssets.help01,
      children: [
        HelpText(
          'Tap a number once if you are sure, that this number should be where it is. It will be marked as green.',
        ),
        SizedBox(height: UkodusDimentions.padding),
        HelpText(
          'Tap again, if this number shouldn’t be there (it will be marked as red).',
        ),
        SizedBox(height: UkodusDimentions.padding),
        HelpText(
          'Third tap will bring the number back to the beginning state.',
        ),
      ],
    );
  }
}
