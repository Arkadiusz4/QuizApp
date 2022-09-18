import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LoginButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF251F47),
            fixedSize: Size(MediaQuery.of(context).size.width, 60),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: const Text(
            'Sign In',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
