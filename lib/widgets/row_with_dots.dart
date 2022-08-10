import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/dots.dart';

class RowWithDots extends StatelessWidget {
  const RowWithDots(
      {Key? key,
      required this.dotsColor,
      required this.textColor,
      required this.text,
      required this.subtext})
      : super(key: key);

  final Color dotsColor, textColor;
  final String text, subtext;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Dots(color: dotsColor),
        const SizedBox(
          width: 10,
        ),
        Column(
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w800, color: textColor),
            ),
            Text(
              subtext,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ],
    );
  }
}
