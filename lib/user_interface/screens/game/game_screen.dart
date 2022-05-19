import 'package:flutter/material.dart';
import 'package:ukodus/business_logic/controllers/game_controller.dart';
import 'package:ukodus/data/enums/tile_state.dart';
import 'package:ukodus/data/models/game_model.dart';
import 'package:ukodus/data/models/level_model.dart';
import 'package:ukodus/helpers/number_formatter.dart';
import 'package:ukodus/helpers/ukodus_colors.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';
import 'package:ukodus/user_interface/screens/game/dialog_exit.dart';
import 'package:ukodus/user_interface/screens/game/dialog_game_over.dart';
import 'package:ukodus/user_interface/screens/game/dialog_reset.dart';
import 'package:ukodus/user_interface/screens/game/points.dart';
import 'package:ukodus/user_interface/screens/game/tile.dart';
import 'package:ukodus/user_interface/shared/ukodus_label_value.dart';
import 'package:ukodus/user_interface/shared/ukodus_panel.dart';
import 'package:ukodus/user_interface/shared/ukodus_scaffold.dart';

class GameScreen extends StatefulWidget {
  static const routeName = '/game-screen';

  final GameModel gameModel;

  const GameScreen({Key? key, required this.gameModel}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late GameController _gameController;
  int _restarGameCount = 0;

  @override
  void initState() {
    _gameController = GameController(widget.gameModel);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onExit,
      child: UkodusScaffold(
        title: 'UKODUS',
        body: _getBody(),
        buttons: _getButtons(),
      ),
    );
  }

  List<Widget> _getButtons() {
    return [
      IconButton(
        onPressed: _resetGame,
        icon: const Icon(Icons.refresh),
      ),
    ];
  }

  Widget _getBody() {
    final column = List<Widget>.empty(growable: true);
    column.add(_getPoints());
    column.addAll(_getGameBoard());

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: column,
    );
  }

  Widget _getPoints() {
    return Container(
      margin: const EdgeInsets.all(UkodusDimentions.paddingBig),
      child: UkodusPanel(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Points(gameController: _gameController),
            _getBestPoints(),
          ],
        ),
      ),
    );
  }

  Widget _getBestPoints() {
    return UkodusLabelValue(
      label: 'Best',
      value: NumberFormatter.formatPoints(widget.gameModel.bestPoints),
      color: UkodusColors.fontDescription,
    );
  }

  List<Widget> _getGameBoard() {
    final column = List<Widget>.empty(growable: true);

    for (var i = 0; i < 9; i++) {
      if (i == 0) {
        // We want to add horizontal border at the beginning of the board:
        column.add(_getBoxForBorder());
      }

      final row = _getOneRow(i);

      final rowWidget = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: row,
      );

      column.add(rowWidget);

      // Add space to make horizontal border after each 3 rows of numbers
      // (we add 1 to [i] because we want to count from 1, not from 0):
      if ((i + 1) % 3 == 0) {
        column.add(_getBoxForBorder());
      }
    }

    // We need this to restart the game and reload the board
    // (but it's invisible):
    final text = Text(
      '$_restarGameCount',
      style: const TextStyle(
        color: UkodusColors.background,
        fontSize: 1,
      ),
    );
    column.add(text);

    return column;
  }

  List<Widget> _getOneRow(int i) {
    final row = List<Widget>.empty(growable: true);

    for (var j = 0; j < 9; j++) {
      if (j == 0) {
        // We want to add vertical border at the beginning of the board:
        row.add(_getBoxForBorder());
      }

      // We need key with [_restarGameCount] to reload game board when
      // user wants to restart the game:
      final tile = Tile(
        number: _gameController.getNumberAt(i, j),
        verticalPosition: i,
        horizontalPosition: j,
        isAdditionalCondition: _gameController.getIsAdditionalConditionAt(i, j),
        onTileTap: _onTileTap,
        key: Key('${i}_${j}_$_restarGameCount'),
      );

      row.add(tile);

      // Add space to make vertical border after each 3 numbers
      // (we add 1 to [j] because we want to count from 1, not from 0):
      if ((j + 1) % 3 == 0) {
        row.add(_getBoxForBorder());
      }
    }

    return row;
  }

  Widget _getBoxForBorder() {
    return const SizedBox(
      height: UkodusDimentions.padding,
      width: UkodusDimentions.padding,
    );
  }

  Future<void> _resetGame() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return DialogReset(onRestartTap: _restartGame);
      },
    );
  }

  Future<bool> _onExit() async {
    if (_gameController.points == LevelModel.defaultBestScore) {
      // User hasn't press anything - we don't need to show the exit question:
      return true;
    }

    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const DialogExit();
      },
    );

    return result == true;
  }

  void _endGame() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return DialogGameOver(gameEndResult: _gameController.gameResult);
      },
    );
  }

  void _onTileTap(
    int verticalPosition,
    int horizontalPosition,
    TileState tileState,
  ) {
    _gameController.onTileTap(
      verticalPosition,
      horizontalPosition,
      tileState,
    );

    if (_gameController.hasGameEnded()) {
      _endGame();
    }
  }

  void _restartGame() {
    _gameController.reset();

    setState(() {
      _restarGameCount++;
    });
  }
}
