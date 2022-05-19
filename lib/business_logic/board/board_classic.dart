import 'package:ukodus/data/models/game_model.dart';

import 'board.dart';

class BoardClassic extends Board {
  BoardClassic(GameModel model) {
    gameModel = model;
  }

  /// In classic mode there is no additional conditions.
  @override
  bool getIsAdditionalCondition(int i, int j) {
    return false;
  }

  /// This method checks if game can be ended.
  /// We check rows, columns and 3x3 squares.
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

    return true;
  }
}
