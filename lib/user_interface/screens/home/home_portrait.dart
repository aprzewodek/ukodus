import 'package:flutter/material.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';

import 'home_base.dart';

class HomePortrait extends HomeBase {
  const HomePortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getLogo(context),
        const Spacer(),
        SizedBox(
          width: UkodusDimentions.getWidth(context) * 0.9,
          child: getTitlePanel(context),
        ),
        const Spacer(),
      ],
    );
  }
}
