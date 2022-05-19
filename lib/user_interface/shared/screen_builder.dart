import 'package:flutter/material.dart';

class ScreenBuilder extends StatelessWidget {
  final Widget portraitWidget;
  final Widget? landscapeWidget;

  const ScreenBuilder({
    Key? key,
    required this.portraitWidget,
    this.landscapeWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (landscapeWidget == null) {
      return portraitWidget;
    }

    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return portraitWidget;
    }

    return landscapeWidget!;
  }
}
