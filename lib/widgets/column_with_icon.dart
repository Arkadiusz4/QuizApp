import 'package:flutter/material.dart';

class ColumnWithIcon extends StatelessWidget {
  const ColumnWithIcon(
      {Key? key,
      required this.backgroundColor,
      required this.icon,
      required this.text})
      : super(key: key);

  final Color backgroundColor;
  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: backgroundColor,
          child: Icon(icon.icon, color: const Color(0xFF65655E)),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(text),
      ],
    );
  }
}
