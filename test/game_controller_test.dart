import 'package:flutter_test/flutter_test.dart';
import 'package:ukodus/business_logic/controllers/game_controller.dart';
import 'package:ukodus/data/enums/game_end_result.dart';
import 'package:ukodus/data/enums/ukodus_type.dart';
import 'package:ukodus/data/models/game_model.dart';

void main() {
  test('Game result should be "none"', _gameResultNone);
  test('Points format', _getPointsFormat);
  test('Get number at', _getNumberAt);
  test('Is additional condition', _isAdditionalCondition);
  test('Is not additional condition', _isNotAdditionalCondition);
  test('No points', _noPoints);
  test('234 points', _points234);
}

void _gameResultNone() {
  final controller = _getGameController();

  expect(controller.gameResult, GameEndResult.none);
}

void _getPointsFormat() {
  final controller = _getGameController();
  controller.points = 100;

  expect(controller.pointsFormatted, '0100');
}

void _getNumberAt() {
  final controller = _getGameController();
  final number = controller.getNumberAt(0, 1);

  expect(number, '4');
}

void _isAdditionalCondition() {
  final controller = _getGameController(UkodusType.diagonal);
  final condition = controller.getIsAdditionalConditionAt(3, 3);

  expect(condition, true);
}

void _isNotAdditionalCondition() {
  final controller = _getGameController();
  final condition = controller.getIsAdditionalConditionAt(3, 3);

  expect(condition, false);
}

void _noPoints() {
  final controller = _getGameController();
  controller.points = 0;

  expect(controller.hasGameEnded(), true);
}

void _points234() {
  final controller = _getGameController();
  controller.points = 234;

  expect(controller.hasGameEnded(), false);
}

GameController _getGameController([UkodusType type = UkodusType.classic]) {
  final gameModel = _getGameModel(type);
  return GameController(gameModel);
}

GameModel _getGameModel(UkodusType type) {
  return GameModel(
    fullName: 'Classic 01',
    level:
        '542621315636415241123322546423551664461643325651261134215244263334156232156232451',
    type: type,
    bestPoints: 100,
  );
}
