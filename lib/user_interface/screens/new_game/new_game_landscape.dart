import 'package:flutter/material.dart';
import 'package:ukodus/business_logic/controllers/new_game_controller.dart';
import 'package:ukodus/data/models/level_model.dart';
import 'package:ukodus/helpers/ukodus_colors.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';
import 'package:ukodus/user_interface/screens/new_game/new_game_base.dart';

class NewGameLandscape extends NewGameBase {
  final LevelModel model;

  const NewGameLandscape({
    Key? key,
    required NewGameController newGameController,
    required Function() onGameEnd,
    required this.model,
  }) : super(
          key: key,
          newGameController: newGameController,
          onGameEnd: onGameEnd,
        );

  @override
  Widget build(BuildContext context) {
    return _getListItem(context, model);
  }

  Widget _getListItem(BuildContext context, LevelModel model) {
    return Padding(
      padding: const EdgeInsets.all(UkodusDimentions.padding),
      child: Container(
        width: UkodusDimentions.getWidth(context) * 0.9,
        decoration: const BoxDecoration(
          color: UkodusColors.panelBackground,
          borderRadius: BorderRadius.all(
            Radius.circular(UkodusDimentions.borderRatius),
          ),
        ),
        padding: const EdgeInsets.all(UkodusDimentions.paddingBig),
        child: _getListItemContent(context, model),
      ),
    );
  }

  Widget _getListItemContent(BuildContext context, LevelModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          model.image,
          scale: 1.5,
        ),
        const SizedBox(width: UkodusDimentions.paddingBig),
        _getDescription(context),
        const SizedBox(height: UkodusDimentions.paddingBig),
      ],
    );
  }

  Widget _getDescription(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getNameAndPlayButton(context),
        const SizedBox(height: UkodusDimentions.paddingBig),
        getDifficulty(context, model.difficulty),
        const SizedBox(height: UkodusDimentions.paddingBig),
        getBestScore(model.bestScore),
      ],
    );
  }

  Widget _getNameAndPlayButton(BuildContext context) {
    return Row(
      children: [
        getName(context, model.fullName),
        const SizedBox(width: UkodusDimentions.paddingBig * 2),
        getPlayButton(
          context,
          model.type,
          model.fullName,
          model.name,
          model.bestScore,
        ),
      ],
    );
  }
}
