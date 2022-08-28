import 'dart:html';

import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFFFCFCFF),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(children: [
        const Text('Forgot password'),
        Icon(Icons.lock),
        Text('Did somone forget their password?'),
        Text('That\'s ok...'),
        Text(
            'Just enter the email address you have used to register with us and we will send you a reset link.'),
        TextFormField(),
        ElevatedButton(onPressed: () {}, child: Text('Send')),
      ]),
    );
  }
}
