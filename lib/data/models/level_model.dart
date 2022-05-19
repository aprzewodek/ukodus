import 'package:ukodus/data/enums/difficulty.dart';
import 'package:ukodus/data/enums/ukodus_type.dart';
import 'package:ukodus/helpers/string_helper.dart';

class LevelModel {
  static const defaultBestScore = 1000;

  late String name;
  late String imageName;
  late UkodusType type;
  late Difficulty difficulty;
  late int bestScore;

  LevelModel({
    required this.name,
    required this.imageName,
    required this.type,
    required this.difficulty,
    this.bestScore = defaultBestScore,
  });

  LevelModel.fromJson(Map<String, dynamic> json) {
    name = json['name'].toString();
    imageName = json['imageName'].toString();
    type = UkodusType.values.byName(json['type']);
    difficulty = Difficulty.values.byName(json['difficulty']);
    bestScore = defaultBestScore;
  }

  String get image {
    return 'images/levels/$imageName.png';
  }

  String get fullName {
    return '${StringHelper.upperCaseFirst(type.name)} $name';
  }
}
