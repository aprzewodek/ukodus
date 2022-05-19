import 'package:flutter/material.dart';
import 'package:ukodus/data/enums/ukodus_type.dart';

class GameModel {
  String level;
  UkodusType type;
  int bestPoints;
  String fullName;

  GameModel({
    required this.level,
    required this.type,
    required this.fullName,
    this.bestPoints = 0,
  });

  List<String> get numbers {
    final num = level.characters.toList();
    return num;
  }
}
