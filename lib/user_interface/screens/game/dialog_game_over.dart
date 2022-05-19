import 'package:flutter/material.dart';
import 'package:ukodus/data/enums/game_end_result.dart';
import 'package:ukodus/helpers/ukodus_assets.dart';
import 'package:ukodus/helpers/ukodus_colors.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';
import 'package:ukodus/user_interface/shared/ukodus_message_box.dart';
import 'package:ukodus/user_interface/shared/ukodus_simple_button.dart';

class DialogGameOver extends StatelessWidget {
  final GameEndResult gameEndResult;

  const DialogGameOver({
    Key? key,
    required this.gameEndResult,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UkodusMessageBox(
      isBig: true,
      header: 'Game over',
      child: Column(
        children: [
          _getImage(),
          const SizedBox(height: UkodusDimentions.paddingBig * 2),
          _getText(),
        ],
      ),
      buttons: [
        UkodusSimpleButton(
          label: 'Close',
          onTap: () {
            _closeDialog(context);
          },
        ),
      ],
    );
  }

  Image _getImage() {
    var imageName = '';

    switch (gameEndResult) {
      case GameEndResult.won:
        imageName = UkodusAssets.won;
        break;

      case GameEndResult.bestScore:
        imageName = UkodusAssets.best;
        break;

      case GameEndResult.lost:
        imageName = UkodusAssets.lost;
        break;

      default:
        imageName = '';
    }

    return Image.asset(
      imageName,
      height: UkodusDimentions.dialogImageSize,
    );
  }

  Widget _getText() {
    var message = '';

    switch (gameEndResult) {
      case GameEndResult.lost:
        message = 'You lost! Try again.';
        break;

      case GameEndResult.won:
        message = 'Congratulations! You won!';
        break;

      case GameEndResult.bestScore:
        message = 'Congratulations! New high score!';
        break;

      default:
        message = '';
        break;
    }

    return Text(
      message,
      style: const TextStyle(
        color: UkodusColors.font,
        fontSize: UkodusDimentions.fontSize,
      ),
      textAlign: TextAlign.center,
    );
  }

  void _closeDialog(BuildContext context) {
    // Close dialog:
    Navigator.of(context).pop();

    // Close game screen:
    Navigator.of(context).pop();
  }
}
