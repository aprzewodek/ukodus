import 'package:flutter/material.dart';
import 'package:ukodus/business_logic/controllers/new_game_controller.dart';
import 'package:ukodus/data/models/level_model.dart';
import 'package:ukodus/helpers/ukodus_colors.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';
import 'package:ukodus/user_interface/screens/new_game/new_game_base.dart';

class NewGamePortrait extends NewGameBase {
  final LevelModel model;

  const NewGamePortrait({
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(model.image),
        ..._getName(context),
        ..._getLine(),
        _getBottom(context),
        const SizedBox(height: UkodusDimentions.paddingBig),
      ],
    );
  }

  List<Widget> _getName(BuildContext context) {
    return [
      const SizedBox(height: UkodusDimentions.paddingBig),
      getName(context, model.fullName),
    ];
  }

  List<Widget> _getLine() {
    return [
      const SizedBox(height: UkodusDimentions.paddingBig),
      Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: UkodusColors.fontDescription,
          ),
        ),
      ),
      const SizedBox(height: UkodusDimentions.paddingBig),
    ];
  }

  Widget _getBottom(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        getDifficulty(context, model.difficulty),
        getBestScore(model.bestScore),
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
