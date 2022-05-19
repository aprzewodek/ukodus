import 'package:flutter/material.dart';
import 'package:ukodus/helpers/ukodus_colors.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';

class UkodusButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isMainButton;

  const UkodusButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.isMainButton = true,
  }) : super(key: key);

  @override
  State<UkodusButton> createState() => _UkodusButtonState();
}

class _UkodusButtonState extends State<UkodusButton> {
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
      child: _getBorder(),
    );
  }

  Widget _getBorder() {
    return Container(
      padding: const EdgeInsets.all(UkodusDimentions.padding),
      decoration: BoxDecoration(
        color: UkodusColors.background,
        borderRadius: BorderRadius.circular(UkodusDimentions.borderRatius),
      ),
      child: _getButtonBody(),
    );
  }

  Widget _getButtonBody() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.all(UkodusDimentions.paddingBig),
      decoration: BoxDecoration(
        color: widget.isMainButton ? UkodusColors.accent : UkodusColors.button,
        borderRadius: BorderRadius.circular(
          _isPressed ? 100 : UkodusDimentions.borderRatius,
        ),
      ),
      child: Icon(
        widget.icon,
        color: UkodusColors.font,
        size: UkodusDimentions.iconSize,
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
