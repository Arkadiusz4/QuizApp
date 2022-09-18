import 'package:flutter/material.dart';
import 'package:quiz_app/screens/authentication_screens/forget_password_screen.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 20, top: 10),
        child: GestureDetector(
          onTap: (() => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const ForgetPasswordScreen()))),
          child: const Text(
            'Forget Password?',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF3083DC)),
          ),
        ),
      ),
    );
  }
}
