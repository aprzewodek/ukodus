import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:ukodus/data/enums/ukodus_type.dart';
import 'package:ukodus/data/models/level_model.dart';
import 'package:ukodus/helpers/ioc.dart';
import 'package:ukodus/helpers/logger.dart';
import 'package:ukodus/helpers/ukodus_assets.dart';

class NewGameController {
  Future<List<LevelModel>> loadLevels() async {
    try {
      final jsonString = await rootBundle.loadString(UkodusAssets.levels);
      final data = await json.decode(jsonString);
      final levels = data['levels'] as List;
      final result = List.generate(
        levels.length,
        (index) => LevelModel.fromJson(levels[index]),
      );

      await _loadBestScores(result);

      return result;
    } catch (ex, stackTrace) {
      Logger().log(exception: ex, stackTrace: stackTrace);
      return List<LevelModel>.empty();
    }
  }

  Future<String?> loadGame(UkodusType type, String name) async {
    try {
      final path = 'json/${type.name.substring(0, 1)}$name.json';
      final jsonString = await rootBundle.loadString(path);
      final data = await json.decode(jsonString);
      final levels = data['level'] as String;
      return levels;
    } catch (ex, stackTrace) {
      Logger().log(exception: ex, stackTrace: stackTrace);
      return null;
    }
  }

  Future<void> _loadBestScores(List<LevelModel> levels) async {
    for (var level in levels) {
      final bestScore = await IoC().sharedPreferences.getInt(level.fullName);
      if (bestScore != null) {
        level.bestScore = bestScore;
      }
    }
  }
}
