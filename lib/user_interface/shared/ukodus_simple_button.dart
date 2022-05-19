import 'package:flutter/material.dart';
import 'package:ukodus/helpers/ukodus_colors.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';

class UkodusSimpleButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const UkodusSimpleButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  State<UkodusSimpleButton> createState() => _UkodusSimpleButtonState();
}

class _UkodusSimpleButtonState extends State<UkodusSimpleButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: _onPointerUp,
      onPointerDown: _onPointerDown,
      child: _getButton(),
    );
  }

  Widget _getButton() {
    return Center(
      child: _getButtonBody(),
    );
  }

  Widget _getButtonBody() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(
        vertical: UkodusDimentions.padding,
        horizontal: UkodusDimentions.paddingBig,
      ),
      decoration: BoxDecoration(
        color: UkodusColors.accent,
        borderRadius: BorderRadius.circular(
          _isPressed ? 100 : UkodusDimentions.borderRatius,
        ),
      ),
      child: Text(
        widget.label,
        style: Theme.of(context).textTheme.headline6!.copyWith(
              color: UkodusColors.font,
            ),
      ),
    );
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });

    widget.onTap();
  }

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }
}
