import 'package:ukodus/business_logic/board/board.dart';
import 'package:ukodus/data/models/game_model.dart';

class BoardX extends Board {
  BoardX(GameModel model) {
    gameModel = model;
  }

  /// This method returns true if indexes make both diagonals.
  @override
  bool getIsAdditionalCondition(int i, int j) {
    // Diagonals:
    // 0,0                             0,8
    //     1,1                     1,7
    //         2,2             2,6
    //             3,3     3,5
    //                 4,4
    //             5,3     5,5
    //         6,2             6,6
    //     7,1                     7,7
    // 8,0                             8,8

    // Numeration starts from 0 so we need to add -1 to size:
    const size = Board.size - 1;

    final diagonal1 = (i == j);
    final diagonal2 = (j == size - i);
    return diagonal1 || diagonal2;
  }

  /// This method checks if game can be ended.
  /// We check rows, columns, 3x3 squares and both diagonals.
  @override
  bool check() {
    if (!checkRows()) {
      return false;
    }

    if (!checkColumns()) {
      return false;
    }

    if (!check3x3()) {
      return false;
    }

    if (!_checkDiagonal1()) {
      return false;
    }

    if (!_checkDiagonal2()) {
      return false;
    }

    return true;
  }

  /// This method checks if first diagonal has correct numbers.
  bool _checkDiagonal1() {
    // We count how many times each number (from 1 to [_maxNumber])
    // appear in a first diagonal:
    final counts = List<int>.generate(maxNumberOnBoard, (index) => 0);
    for (var i = 0; i < Board.size; i++) {
      checkOneTile(counts, i, i);
    }

    if (!checkOneRule(counts)) {
      return false;
    }

    return true;
  }

  /// This method checks if second diagonal has correct numbers.
  bool _checkDiagonal2() {
    // We count how many times each number (from 1 to [_maxNumber])
    // appear in a second diagonal:
    final counts = List<int>.generate(maxNumberOnBoard, (index) => 0);
    for (var i = 0; i < Board.size; i++) {
      // -1 because [Board.size - 0] is out of the range:
      checkOneTile(counts, i, Board.size - i - 1);
    }

    if (!checkOneRule(counts)) {
      return false;
    }

    return true;
  }
}
