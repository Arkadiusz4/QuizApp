import 'package:flutter/material.dart';

class OptionsButton extends StatelessWidget {
  const OptionsButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: const Color(0xFF01172F),
            fixedSize: Size(MediaQuery.of(context).size.width - 40, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 20, color: Color(0xFFF4F3EE)),
        ),
      ),
    );
  }
}
