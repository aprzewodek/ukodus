import 'package:flutter/material.dart';
import 'package:ukodus/helpers/ukodus_assets.dart';
import 'package:ukodus/helpers/ukodus_colors.dart';
import 'package:ukodus/user_interface/screens/how_to_play/help_text.dart';

import 'page_template.dart';

class Page02 extends StatelessWidget {
  const Page02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PageTemplate(
      color: UkodusColors.accent,
      image: UkodusAssets.help02,
      children: [
        HelpText(
          'Puzzles are organized into four categories: Classic, Diagonal, X, Hyper and ordered according to their difficulty.',
        ),
      ],
    );
  }
}
