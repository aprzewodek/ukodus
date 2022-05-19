import 'package:flutter/material.dart';
import 'package:ukodus/business_logic/controllers/game_controller.dart';
import 'package:ukodus/helpers/ukodus_colors.dart';
import 'package:ukodus/user_interface/shared/ukodus_label_value.dart';

class Points extends StatefulWidget {
  final GameController gameController;

  const Points({
    Key? key,
    required this.gameController,
  }) : super(key: key);

  @override
  State<Points> createState() => _PointsState();
}

class _PointsState extends State<Points> {
  String _points = '';

  @override
  void initState() {
    super.initState();

    // We don't want to rebuild whole page every time when user points change
    // so we use ChangeNotifier of GameController:
    widget.gameController.addListener(_onPointsChange);

    // Initial value:
    _points = widget.gameController.pointsFormatted;
  }

  @override
  void dispose() {
    widget.gameController.removeListener(_onPointsChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UkodusLabelValue(
      label: 'Points',
      value: _points,
      color: UkodusColors.font,
    );
  }

  void _onPointsChange() {
    setState(() {
      _points = widget.gameController.pointsFormatted;
    });
  }
}
