import 'package:ukodus/business_logic/board/board_classic.dart';
import 'package:ukodus/business_logic/board/board_diagonal.dart';
import 'package:ukodus/business_logic/board/board_hyper.dart';
import 'package:ukodus/business_logic/board/board_x.dart';
import 'package:ukodus/data/enums/tile_state.dart';
import 'package:ukodus/data/enums/ukodus_type.dart';
import 'package:ukodus/data/models/game_model.dart';
import 'package:ukodus/data/models/tile_model.dart';

/// Base class to generate the game board.
abstract class Board {
  static const int size = 9;

  late GameModel gameModel;

  late List<List<TileModel>> board;

  int maxNumberOnBoard = 0;

  Board();

  factory Board.byType(GameModel model) {
    switch (model.type) {
      case UkodusType.classic:
        return BoardClassic(model);

      case UkodusType.diagonal:
        return BoardDiagonal(model);

      case UkodusType.x:
        return BoardX(model);

      case UkodusType.hyper:
        return BoardHyper(model);
    }
  }

  List<List<TileModel>> createBoard() {
    var counter = 0;

    board =
        List.generate(size, (index) => _generateRow(index), growable: false);

    for (var i = 0; i < size; i++) {
      for (var j = 0; j < size; j++) {
        board[i][j].number = int.parse(gameModel.numbers[counter]);

        if (board[i][j].number > maxNumberOnBoard) {
          maxNumberOnBoard = board[i][j].number;
        }

        board[i][j].isAdditionalCondition = getIsAdditionalCondition(i, j);

        counter++;
      }
    }

    return board;
  }

  List<TileModel> _generateRow(int index) {
    return List.generate(size, (index) => TileModel.empty());
  }

  /// This method checks if game can be ended.
  bool check();

  /// This method checks if all rows have correct numbers.
  bool checkRows() {
    for (var i = 0; i < size; i++) {
      // We count how many times each number (from 1 to [_maxNumber])
      // appear in a row:
      final counts = List<int>.generate(maxNumberOnBoard, (index) => 0);

      for (var j = 0; j < size; j++) {
        checkOneTile(counts, i, j);
      }

      if (!checkOneRule(counts)) {
        return false;
      }
    }

    return true;
  }

  /// This method checks if all columns have correct numbers.
  bool checkColumns() {
    for (var i = 0; i < size; i++) {
      // We count how many times each number (from 1 to [_maxNumber])
      // appear in a column:
      final counts = List<int>.generate(maxNumberOnBoard, (index) => 0);

      for (var j = 0; j < size; j++) {
        checkOneTile(counts, j, i);
      }

      if (!checkOneRule(counts)) {
        return false;
      }
    }

    return true;
  }

  /// This method checks if all 3x3 squares have correct numbers.
  bool check3x3() {
    for (var i = 0; i < size; i += 3) {
      for (var j = 0; j < size; j += 3) {
        // We count how many times each number (from 1 to [_maxNumber])
        // appear in a 3x3 square:
        final counts = List<int>.generate(maxNumberOnBoard, (index) => 0);

        for (var m = 0; m < 3; m++) {
          for (var n = 0; n < 3; n++) {
            checkOneTile(counts, i + m, j + n);
          }
        }

        if (!checkOneRule(counts)) {
          return false;
        }
      }
    }

    return true;
  }

  void checkOneTile(List<int> counts, int i, int j) {
    if (board[i][j].state == TileState.isOk) {
      // -1 because index start from 0:
      final number = board[i][j].number - 1;
      counts[number]++;
    }
  }

  bool checkOneRule(List<int> counts) {
    for (var i = 0; i < maxNumberOnBoard; i++) {
      if (counts[i] != 1) {
        return false;
      }
    }

    return true;
  }

  /// This method return true if specified tile should be marked on the board
  /// as additional condition. The additional conditions are determined
  /// by the game type.
  bool getIsAdditionalCondition(int i, int j);
}
