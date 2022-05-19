import 'package:flutter/material.dart';
import 'package:ukodus/helpers/ukodus_dimentions.dart';

class UkodusLabelValue extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const UkodusLabelValue({
    Key? key,
    required this.label,
    required this.value,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$label:  ',
          style: TextStyle(
            color: color,
            fontSize: UkodusDimentions.fontSize,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: UkodusDimentions.fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
