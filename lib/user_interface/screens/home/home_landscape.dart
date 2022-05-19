import 'package:flutter/material.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';
import 'package:ukodus/user_interface/screens/home/home_base.dart';

class HomeLandscape extends HomeBase {
  const HomeLandscape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            getLogo(context),
            const SizedBox(width: UkodusDimentions.paddingBig),
            SizedBox(
              width: UkodusDimentions.getWidth(context) / 3,
              child: getTitlePanel(context),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
