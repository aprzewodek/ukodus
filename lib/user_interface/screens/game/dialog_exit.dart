import 'package:flutter/material.dart';
import 'package:ukodus/helpers/ukodus_colors.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';
import 'package:ukodus/user_interface/shared/ukodus_message_box.dart';
import 'package:ukodus/user_interface/shared/ukodus_simple_button.dart';

class DialogExit extends StatelessWidget {
  const DialogExit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UkodusMessageBox(
      header: 'Exit',
      child: const Text(
        'Do you want to quit the game and loose your progress?',
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
            _exitGame(context);
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

  void _exitGame(BuildContext context) {
    // Pop returns [true] to exit the screen:
    Navigator.of(context).pop(true);
  }

  void _closeDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}
