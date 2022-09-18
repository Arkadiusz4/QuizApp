import 'package:flutter/material.dart';

class Heading50 extends StatelessWidget {
  const Heading50({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 20,
        top: 50,
      ),
      child: Text(
        'Register',
        style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.w700,
          color: Color(0xFF3083DC),
        ),
      ),
    );
  }
}

class Heading18 extends StatelessWidget {
  const Heading18({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: 10,
        left: 20,
        bottom: 40,
      ),
      child: Text(
        'Please sign up to continue.',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class Heading20 extends StatelessWidget {
  const Heading20({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: 10,
        left: 20,
        bottom: 40,
      ),
      child: Text(
        'Register with',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
