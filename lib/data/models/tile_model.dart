import 'package:ukodus/data/enums/tile_state.dart';

class TileModel {
  int horizontalPosition;
  int verticalPosition;
  int number;
  bool isAdditionalCondition;
  TileState state;

  TileModel({
    required this.horizontalPosition,
    required this.verticalPosition,
    required this.number,
    this.isAdditionalCondition = false,
    this.state = TileState.none,
  });

  TileModel.empty()
      : this(
          horizontalPosition: 0,
          verticalPosition: 0,
          number: 0,
        );
}
