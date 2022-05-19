import 'package:flutter/material.dart';
import 'package:ukodus/data/models/game_model.dart';
import 'package:ukodus/user_interface/screens/game/game_screen.dart';
import 'package:ukodus/user_interface/screens/home/home_screen.dart';
import 'package:ukodus/user_interface/screens/how_to_play/how_to_play_screen.dart';
import 'package:ukodus/user_interface/screens/info/info_screen.dart';

import 'user_interface/screens/new_game/new_game_screen.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return _goToHomeScreen();

      case NewGameScreen.routeName:
        return _goToNewGameScreen();

      case HowToPlayScreen.routeName:
        return _goToHowToPlayScreen();

      case InfoScreen.routeName:
        return _goToInfoScreen();

      case GameScreen.routeName:
        return _goToGameScreen(settings);

      default:
        assert(false, 'Need to implement [${settings.name}] route!');
        return null;
    }
  }

  MaterialPageRoute _goToHomeScreen() {
    return MaterialPageRoute(
      builder: (context) {
        return const HomeScreen();
      },
    );
  }

  MaterialPageRoute _goToNewGameScreen() {
    return MaterialPageRoute(
      builder: (context) {
        return const NewGameScreen();
      },
    );
  }

  MaterialPageRoute _goToHowToPlayScreen() {
    return MaterialPageRoute(
      builder: (context) {
        return const HowToPlayScreen();
      },
    );
  }

  MaterialPageRoute _goToInfoScreen() {
    return MaterialPageRoute(
      builder: (context) {
        return const InfoScreen();
      },
    );
  }

  MaterialPageRoute _goToGameScreen(RouteSettings settings) {
    final gameModel = settings.arguments as GameModel;
    return MaterialPageRoute(
      builder: (context) {
        return GameScreen(gameModel: gameModel);
      },
    );
  }
}
