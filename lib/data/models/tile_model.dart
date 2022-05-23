import 'package:ukodus/data/enums/tile_state.dart';

class TileModel {
  int number;
  bool isAdditionalCondition;
  TileState state;

  TileModel({
    required this.number,
    this.isAdditionalCondition = false,
    this.state = TileState.none,
  });

  TileModel.empty()
      : this(
          number: 0,
        );
}
