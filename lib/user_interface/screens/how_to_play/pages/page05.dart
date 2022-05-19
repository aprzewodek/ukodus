import 'package:flutter/material.dart';
import 'package:ukodus/helpers/ukodus_assets.dart';
import 'package:ukodus/helpers/ukodus_colors.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';
import 'package:ukodus/user_interface/screens/how_to_play/help_text.dart';

import 'page_template.dart';

class Page05 extends StatelessWidget {
  const Page05({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PageTemplate(
      color: UkodusColors.fontDescription,
      image: UkodusAssets.help03,
      children: [
        HelpText(
          'There is no definitive order in which to resolve a Ukodus, so the methods presented below aren’t prescriptive. You can reach the same outcome by using different techniques in different orders.',
        ),
        SizedBox(height: UkodusDimentions.padding),
        HelpText('There are four main techniques used in Ukodus:'),
        SizedBox(height: UkodusDimentions.padding),
        HelpText(' - Completing a block'),
        SizedBox(height: UkodusDimentions.padding),
        HelpText(' - Completing rows'),
        SizedBox(height: UkodusDimentions.padding),
        HelpText(' - Completing columns'),
        SizedBox(height: UkodusDimentions.padding),
        HelpText(' - Marking bad numbers'),
      ],
    );
  }
}
