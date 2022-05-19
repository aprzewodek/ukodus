import 'package:flutter/material.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';
import 'package:ukodus/user_interface/shared/screen_builder.dart';

class PageTemplate extends StatelessWidget {
  final List<Widget> children;
  final String image;
  final Color color;

  const PageTemplate({
    Key? key,
    required this.children,
    required this.image,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(UkodusDimentions.paddingBig * 3),
      width: UkodusDimentions.getWidth(context),
      color: color,
      child: ScreenBuilder(
        portraitWidget: _portrait(context),
        landscapeWidget: _landscape(context),
      ),
    );
  }

  Widget _portrait(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Center(
          child: Image.asset(
            image,
            scale: UkodusDimentions.getHeight(context) < 800 ? 2.0 : 1.5,
          ),
        ),
        const SizedBox(height: UkodusDimentions.paddingHelp),
        ...children,
      ],
    );
  }

  Widget _landscape(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Spacer(),
        Image.asset(image),
        const SizedBox(width: UkodusDimentions.paddingHelp),
        SizedBox(
          width: UkodusDimentions.getWidth(context) * 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: children,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
