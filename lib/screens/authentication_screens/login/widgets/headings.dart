import 'package:flutter/material.dart';

class Heading50Login extends StatelessWidget {
  const Heading50Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 20,
        top: 50,
      ),
      child: Text(
        'Login',
        style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.w700,
          color: Color(0xFF3083DC),
        ),
      ),
    );
  }
}

class Heading18Login extends StatelessWidget {
  const Heading18Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: 10,
        left: 20,
        bottom: 40,
      ),
      child: Text(
        'Please sign in to continue.',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class Heading20Login extends StatelessWidget {
  const Heading20Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: 10,
        left: 20,
        bottom: 40,
      ),
      child: Text(
        'Login with',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
