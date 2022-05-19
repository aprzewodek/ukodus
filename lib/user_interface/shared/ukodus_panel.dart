import 'package:flutter/material.dart';
import 'package:ukodus/helpers/ukodus_colors.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';

class UkodusPanel extends StatelessWidget {
  final Widget title;
  final Widget? buttons;

  const UkodusPanel({
    Key? key,
    required this.title,
    this.buttons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Title panel contains text (top panel) and row of buttons (bottom panel):
    return Column(
      children: [
        _getTopTitlePanel(context),
        if (buttons != null) _getBottomTitlePanel(context),
      ],
    );
  }

  Widget _getTopTitlePanel(BuildContext context) {
    // Returns top title panel (text):
    return Container(
      decoration: BoxDecoration(
        color: UkodusColors.panelBackground,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(UkodusDimentions.borderRatius),
          topRight: const Radius.circular(UkodusDimentions.borderRatius),
          bottomLeft: buttons == null
              ? const Radius.circular(UkodusDimentions.borderRatius)
              : Radius.zero,
          bottomRight: buttons == null
              ? const Radius.circular(UkodusDimentions.borderRatius)
              : Radius.zero,
        ),
      ),
      padding: const EdgeInsets.all(UkodusDimentions.paddingBig),
      child: title,
    );
  }

  Widget _getBottomTitlePanel(BuildContext context) {
    // Returns bottom title panel (row of buttons):
    return Stack(
      children: [
        Center(
          child: Container(
            decoration: const BoxDecoration(
              color: UkodusColors.panelBackground,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(UkodusDimentions.borderRatius),
                bottomRight: Radius.circular(UkodusDimentions.borderRatius),
              ),
            ),
            padding: const EdgeInsets.all(UkodusDimentions.paddingBig),
          ),
        ),
        buttons!,
      ],
    );
  }
}
