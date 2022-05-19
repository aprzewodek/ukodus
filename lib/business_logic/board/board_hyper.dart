import 'package:ukodus/data/models/game_model.dart';

import 'board.dart';

class BoardHyper extends Board {
  BoardHyper(GameModel model) {
    gameModel = model;
  }

  /// This method returns true if indexes make 4 boxes inside game board.
  @override
  bool getIsAdditionalCondition(int i, int j) {
    // Boxes are in:
    //   X     X     X     X     X     X     X     X     X
    //   X    1,1   1,2   1,3    X    1,5   1,6   1,7    X
    //   X    2,1   2,2   2,3    X    2,5   2,6   2,7    X
    //   X    3,1   3,2   3,3    X    3,5   3,6   3,7    X
    //   X     X     X     X     X     X     X     X     X
    //   X    5,1   5,2   5,3    X    5,5   5,6   5,7    X
    //   X    6,1   6,2   6,3    X    6,5   6,6   6,7    X
    //   X    7,1   7,2   7,3    X    7,5   7,6   7,7    X
    //   X     X     X     X     X     X     X     X     X
    if ((i == 1 || i == 2 || i == 3 || i == 5 || i == 6 || i == 7) &&
        (j == 1 || j == 2 || j == 3 || j == 5 || j == 6 || j == 7)) {
      return true;
    }

    return false;
  }

  /// This method checks if game can be ended.
  /// We check rows, columns, 3x3 squares and additional 3x3 squares.
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

    if (!_checkBox(1, 4, 1, 4)) {
      return false;
    }

    if (!_checkBox(5, 8, 1, 4)) {
      return false;
    }

    if (!_checkBox(1, 4, 5, 8)) {
      return false;
    }

    if (!_checkBox(5, 8, 5, 8)) {
      return false;
    }

    return true;
  }

  /// This method checks if specified 3x3 square has correct numbers.
  bool _checkBox(int iStart, int iStop, int jStart, jStop) {
    for (var i = iStart; i < iStop; i++) {
      for (var j = jStart; j < jStop; j++) {
        // We count how many times each number (from 1 to [_maxNumber])
        // appear in a 3x3 square:
        final counts = List<int>.generate(maxNumberOnBoard, (index) => 0);

        for (var m = 0; m < 3; m++) {
          for (var n = 0; n < 3; n++) {
            checkOneTile(counts, i, j);
          }
        }

        if (!checkOneRule(counts)) {
          return false;
        }
      }
    }

    return true;
  }
}
