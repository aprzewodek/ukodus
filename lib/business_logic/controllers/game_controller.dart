import 'package:flutter/material.dart';
import 'package:ukodus/business_logic/board/board.dart';
import 'package:ukodus/data/enums/game_end_result.dart';
import 'package:ukodus/data/enums/tile_state.dart';
import 'package:ukodus/data/models/game_model.dart';
import 'package:ukodus/helpers/ioc.dart';
import 'package:ukodus/helpers/number_formatter.dart';

class GameController extends ChangeNotifier {
  late GameModel _gameModel;
  late Board _board;
  late int points;
  GameEndResult gameResult = GameEndResult.none;

  String get pointsFormatted {
    return NumberFormatter.formatPoints(points);
  }

  GameController(GameModel gameModel) {
    _gameModel = gameModel;

    reset();
  }

  String getNumberAt(int verticalPosition, int horizontalPosition) {
    if (_board.board.length > verticalPosition &&
        _board.board[verticalPosition].length > horizontalPosition) {
      return _board.board[verticalPosition][horizontalPosition].number
          .toString();
    }

    return '';
  }

  bool getIsAdditionalConditionAt(
      int verticalPosition, int horizontalPosition) {
    if (_board.board.length > verticalPosition &&
        _board.board[verticalPosition].length > horizontalPosition) {
      return _board
          .board[verticalPosition][horizontalPosition].isAdditionalCondition;
    }

    return false;
  }

  void onTileTap(
    int verticalPosition,
    int horizontalPosition,
    TileState tileState,
  ) {
    _board.board[verticalPosition][horizontalPosition].state = tileState;

    points--;

    // We don't want to rebuild game board every time user taps tile,
    // so we use [notifyListeners]:
    notifyListeners();
  }

  bool hasGameEnded() {
    final result = _board.check();

    if (result) {
      _setGameResult();
    }

    return result;
  }

  void reset() {
    _board = Board.byType(_gameModel);
    _board.createBoard();

    gameResult = GameEndResult.none;

    points = 1000;

    notifyListeners();
  }

  void _setGameResult() {
    if (points < 1) {
      gameResult = GameEndResult.lost;
    } else if (points < _gameModel.bestPoints) {
      // Best points represents fewer moves - the lower, the better.
      gameResult = GameEndResult.bestScore;
      _saveBestScore();
    } else {
      gameResult = GameEndResult.won;
    }
  }

  Future<void> _saveBestScore() async {
    await IoC().sharedPreferences.saveInt(_gameModel.fullName, points);
  }
}
