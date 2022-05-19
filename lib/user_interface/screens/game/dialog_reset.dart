import 'package:flutter/material.dart';
import 'package:ukodus/helpers/ukodus_colors.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';
import 'package:ukodus/user_interface/shared/ukodus_message_box.dart';
import 'package:ukodus/user_interface/shared/ukodus_simple_button.dart';

class DialogReset extends StatelessWidget {
  final Function() onRestartTap;

  const DialogReset({Key? key, required this.onRestartTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UkodusMessageBox(
      header: 'Restart',
      child: const Text(
        'Do you want to restart the game and loose your progress?',
        style: TextStyle(
          color: UkodusColors.font,
          fontSize: UkodusDimentions.fontSize,
        ),
        textAlign: TextAlign.center,
      ),
      buttons: [
        UkodusSimpleButton(
          label: 'Yes',
          onTap: () {
            _restartGame(context);
          },
        ),
        UkodusSimpleButton(
          label: 'No',
          onTap: () {
            _closeDialog(context);
          },
        ),
      ],
    );
  }

  void _closeDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _restartGame(BuildContext context) {
    onRestartTap();

    Navigator.of(context).pop();
  }
}
