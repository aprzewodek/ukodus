import 'package:ukodus/business_logic/board/board.dart';
import 'package:ukodus/data/models/game_model.dart';

class BoardDiagonal extends Board {
  BoardDiagonal(GameModel model) {
    gameModel = model;
  }

  /// This method returns true if indexes make a diagonal.
  @override
  bool getIsAdditionalCondition(int i, int j) {
    // Diagonal:
    // 0,0
    //     1,1
    //         2,2
    //             3,3
    //                 4,4
    //                     5,5
    //                         6,6
    //                             7,7
    //                                 8,8
    return i == j;
  }

  /// This method checks if game can be ended.
  /// We check rows, columns, 3x3 squares and diagonal.
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

    if (!_checkDiagonal()) {
      return false;
    }

    return true;
  }

  /// This method checks if diagonal has correct numbers.
  bool _checkDiagonal() {
    // We count how many times each number (from 1 to [_maxNumber])
    // appear in a diagonal:
    final counts = List<int>.generate(maxNumberOnBoard, (index) => 0);
    for (var i = 0; i < Board.size; i++) {
      checkOneTile(counts, i, i);
    }

    if (!checkOneRule(counts)) {
      return false;
    }

    return true;
  }
}
