import 'package:flutter/material.dart';

class ResultColumn extends StatelessWidget {
  const ResultColumn(
      {Key? key,
      required this.textColor1,
      required this.textColor2,
      required this.text1,
      required this.subtext1,
      required this.text2,
      required this.subtext2})
      : super(key: key);

  final String text1, subtext1, text2, subtext2;
  final Color textColor1, textColor2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text1,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w800, color: textColor1),
        ),
        Text(
          subtext1,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
        ),
        const SizedBox(height: 10,),
        Text(
          text2,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w800, color: textColor2),
        ),
        Text(
          subtext2,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}
