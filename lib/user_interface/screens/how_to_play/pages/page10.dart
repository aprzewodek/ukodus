import 'package:flutter/material.dart';
import 'package:ukodus/helpers/ukodus_assets.dart';
import 'package:ukodus/helpers/ukodus_colors.dart';
import 'package:ukodus/user_interface/screens/how_to_play/help_text.dart';

import 'page_template.dart';

class Page10 extends StatelessWidget {
  const Page10({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PageTemplate(
      color: UkodusColors.button,
      image: UkodusAssets.help08,
      children: [
        HelpText(
          'Use these techniques multiple times on each row, column and block and you will resolve every puzzle.',
        ),
      ],
    );
  }
}
