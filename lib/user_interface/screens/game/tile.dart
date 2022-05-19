import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:ukodus/data/enums/tile_state.dart';
import 'package:ukodus/helpers/ukodus_colors.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';

class Tile extends StatefulWidget {
  final String number;
  final bool isAdditionalCondition;
  final int horizontalPosition;
  final int verticalPosition;
  final Function(int, int, TileState) onTileTap;

  const Tile({
    Key? key,
    required this.number,
    required this.horizontalPosition,
    required this.verticalPosition,
    required this.onTileTap,
    this.isAdditionalCondition = false,
  }) : super(key: key);

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  TileState _tileState = TileState.none;

  @override
  Widget build(BuildContext context) {
    const minSize = UkodusDimentions.minTileSize;
    var maxSize = MediaQuery.of(context).size.shortestSide / 12;
    if (maxSize < minSize) {
      maxSize = minSize;
    }

    return Listener(
      onPointerUp: (_) {
        _changeTileState();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        constraints: BoxConstraints(
          minWidth: minSize,
          minHeight: minSize,
          maxWidth: maxSize,
          maxHeight: maxSize,
        ),
        decoration: _getDecoration(),
        child: _getText(),
      ),
    );
  }

  BoxDecoration _getDecoration() {
    return BoxDecoration(
      color: widget.isAdditionalCondition
          ? UkodusColors.tileBackgroundAdditionalCondition
          : UkodusColors.tileBackground,
      border: Border.all(),
      boxShadow: _getTileShadow(),
    );
  }

  List<BoxShadow> _getTileShadow() {
    // Pressed tile has shadow on top-left corner,
    // unpressed tile has shadow on bottom-right corner:
    var multiplier = _tileState == TileState.none ? -1 : 1;

    return [
      BoxShadow(
        offset: Offset(
          multiplier * UkodusDimentions.tileShadowOffset,
          multiplier * UkodusDimentions.tileShadowOffset,
        ),
        color: UkodusColors.tileShadow,
        blurRadius: UkodusDimentions.tileShadowBlur,
        inset: true,
      ),
    ];
  }

  Widget _getText() {
    return Center(
      child: Text(
        widget.number,
        style: TextStyle(
          color: _getTextColor(),
          fontSize: _tileState == TileState.isBad
              ? UkodusDimentions.fontSizeSmall
              : UkodusDimentions.fontSize,
          fontWeight: FontWeight.bold,
          shadows: _getTextShadow(),
        ),
      ),
    );
  }

  Color _getTextColor() {
    switch (_tileState) {
      case TileState.none:
        return UkodusColors.fontGame;

      case TileState.isOk:
        return UkodusColors.fontTileOk;

      case TileState.isBad:
        return UkodusColors.fontTileBad;
    }
  }

  List<BoxShadow> _getTextShadow() {
    switch (_tileState) {
      case TileState.none:
        return [
          const BoxShadow(inset: true),
        ];

      case TileState.isOk:
      case TileState.isBad:
        return [
          _getCornerShadow(-1, -1, _tileState),
          _getCornerShadow(-1, 1, _tileState),
          _getCornerShadow(1, -1, _tileState),
          _getCornerShadow(1, 1, _tileState),
        ];
    }
  }

  BoxShadow _getCornerShadow(
    int xMultiplier,
    int yMultiplier,
    TileState tileState,
  ) {
    return BoxShadow(
      offset: Offset(
        xMultiplier * UkodusDimentions.tileShadowOffset,
        yMultiplier * UkodusDimentions.tileShadowOffset,
      ),
      color: _getTextShadowColor(),
      blurRadius: UkodusDimentions.tileShadowBlur,
      inset: true,
    );
  }

  Color _getTextShadowColor() {
    switch (_tileState) {
      case TileState.none:
        return UkodusColors.tileBackground;

      case TileState.isOk:
        return UkodusColors.tileOk;

      case TileState.isBad:
        return UkodusColors.tileBad;
    }
  }

  void _changeTileState() {
    setState(() {
      switch (_tileState) {
        case TileState.none:
          _tileState = TileState.isOk;
          break;

        case TileState.isOk:
          _tileState = TileState.isBad;
          break;

        case TileState.isBad:
          _tileState = TileState.none;
          break;
      }
    });

    widget.onTileTap(
      widget.verticalPosition,
      widget.horizontalPosition,
      _tileState,
    );
  }
}
