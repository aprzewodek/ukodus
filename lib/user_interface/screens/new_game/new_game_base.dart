import 'package:flutter/material.dart';
import 'package:ukodus/business_logic/controllers/new_game_controller.dart';
import 'package:ukodus/data/enums/difficulty.dart';
import 'package:ukodus/data/enums/ukodus_type.dart';
import 'package:ukodus/data/models/game_model.dart';
import 'package:ukodus/helpers/number_formatter.dart';
import 'package:ukodus/helpers/ukodus_colors.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';
import 'package:ukodus/user_interface/screens/game/game_screen.dart';
import 'package:ukodus/user_interface/shared/ukodus_label_value.dart';
import 'package:ukodus/user_interface/shared/ukodus_simple_button.dart';

class NewGameBase extends StatelessWidget {
  final NewGameController newGameController;
  final Function onGameEnd;

  const NewGameBase({
    Key? key,
    required this.newGameController,
    required this.onGameEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget getName(BuildContext context, String name) {
    return Text(
      name,
      style: Theme.of(context).textTheme.headline4!.copyWith(
            color: UkodusColors.font,
          ),
    );
  }

  Widget getDifficulty(BuildContext context, Difficulty difficulty) {
    return Row(
      children: [
        const Text(
          'Difficulty: ',
          style: TextStyle(
            color: UkodusColors.fontDescription,
            fontSize: UkodusDimentions.fontSize,
          ),
        ),
        Icon(
          _getDifficultyIcon(difficulty),
          color: UkodusColors.accent,
          size: UkodusDimentions.iconSize,
        ),
      ],
    );
  }

  Widget getPlayButton(
    BuildContext context,
    UkodusType type,
    String fullName,
    String name,
    int bestPoints,
  ) {
    return UkodusSimpleButton(
      key: Key('play-$type-$fullName'),
      label: 'Play',
      onTap: () async {
        final level = await newGameController.loadGame(type, name);
        if (level != null) {
          final model = GameModel(
            level: level,
            type: type,
            fullName: fullName,
            bestPoints: bestPoints,
          );

          Navigator.of(context)
              .pushNamed(
                GameScreen.routeName,
                arguments: model,
              )
              .then((value) => onGameEnd());
        }
      },
    );
  }

  Widget getBestScore(int bestScore) {
    return UkodusLabelValue(
      label: 'Best',
      value: NumberFormatter.formatPoints(bestScore),
      color: UkodusColors.fontDescription,
    );
  }

  IconData _getDifficultyIcon(Difficulty difficulty) {
    switch (difficulty) {
      case Difficulty.easy:
        return Icons.filter_1;

      case Difficulty.normal:
        return Icons.filter_2;

      case Difficulty.hard:
        return Icons.filter_3;
    }
  }
}
