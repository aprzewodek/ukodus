import 'package:flutter/material.dart';
import 'package:ukodus/helpers/ukodus_assets.dart';
import 'package:ukodus/helpers/ukodus_colors.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';
import 'package:ukodus/user_interface/screens/how_to_play/how_to_play_screen.dart';
import 'package:ukodus/user_interface/screens/info/info_screen.dart';
import 'package:ukodus/user_interface/screens/new_game/new_game_screen.dart';
import 'package:ukodus/user_interface/shared/ukodus_button.dart';
import 'package:ukodus/user_interface/shared/ukodus_panel.dart';

class HomeBase extends StatelessWidget {
  const HomeBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // build is overriden in child classes: HomePortrait and HomeLandscape.
    return Container();
  }

  Widget getLogo(BuildContext context) {
    final scale = UkodusDimentions.getHeight(context) < 710 ? 2.2 : 1.0;

    return Center(
      child: Container(
        padding: const EdgeInsets.all(UkodusDimentions.padding),
        decoration: BoxDecoration(
          color: UkodusColors.panelBackground,
          borderRadius: BorderRadius.circular(UkodusDimentions.borderRatius),
        ),
        child: Image.asset(
          UkodusAssets.help01,
          scale: scale,
        ),
      ),
    );
  }

  Widget getTitlePanel(BuildContext context) {
    return UkodusPanel(
      title: _getTitle(context),
      buttons: _getButtons(context),
    );
  }

  Widget _getTitle(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _getTitleTextWidget(context, 'Play ', false),
            _getTitleTextWidget(context, 'UKODUS', true),
          ],
        ),
        _getTitleTextWidget(context, 'The backward Sudoku.', false),
      ],
    );
  }

  Widget _getTitleTextWidget(BuildContext context, String text, bool isBold) {
    return Padding(
      padding: const EdgeInsets.all(UkodusDimentions.padding),
      child: Text(
        text,
        style: isBold
            ? Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: UkodusColors.font)
            : Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: UkodusColors.font),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _getButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        UkodusButton(
          icon: Icons.help_outline,
          onTap: () {
            _goToHowToPlayPage(context);
          },
          isMainButton: false,
        ),
        UkodusButton(
          icon: Icons.play_arrow,
          onTap: () {
            _goToNewGamePage(context);
          },
        ),
        UkodusButton(
          icon: Icons.info_outline,
          onTap: () {
            _goToInfoPage(context);
          },
          isMainButton: false,
        ),
      ],
    );
  }

  void _goToHowToPlayPage(BuildContext context) {
    Navigator.of(context).pushNamed(HowToPlayScreen.routeName);
  }

  void _goToNewGamePage(BuildContext context) {
    Navigator.of(context).pushNamed(NewGameScreen.routeName);
  }

  void _goToInfoPage(BuildContext context) {
    Navigator.of(context).pushNamed(InfoScreen.routeName);
  }
}
