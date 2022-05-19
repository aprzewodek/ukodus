import 'package:flutter/material.dart';
import 'package:ukodus/helpers/ukodus_colors.dart';

class UkodusScaffold extends StatelessWidget {
  final Widget body;
  final String? title;
  final TabBar? tabs;
  final List<Widget>? buttons;

  const UkodusScaffold({
    Key? key,
    required this.body,
    this.title,
    this.tabs,
    this.buttons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UkodusColors.background,
      appBar: AppBar(
        backgroundColor:
            title == null ? UkodusColors.background : UkodusColors.accent,
        foregroundColor: UkodusColors.font,
        elevation: 0.0,
        title: title != null
            ? Text(
                title!,
                style: const TextStyle(
                  color: UkodusColors.font,
                ),
              )
            : const Text(''),
        bottom: tabs,
        actions: buttons,
      ),
      body: body,
    );
  }
}
