import 'package:flutter/material.dart';
import 'package:ukodus/helpers/ukodus_assets.dart';
import 'package:ukodus/helpers/ukodus_colors.dart';
import 'package:ukodus/user_interface/screens/how_to_play/help_text.dart';
import 'package:ukodus/user_interface/screens/how_to_play/pages/page_template.dart';

class Page01 extends StatelessWidget {
  const Page01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PageTemplate(
      color: UkodusColors.background,
      image: UkodusAssets.help01,
      children: [
        HelpText(
          'Ukodus is number-placement game that exercises your brain.',
        ),
      ],
    );
  }
}
