import 'package:flutter/material.dart';
import 'package:quiz_app/screens/authentication_screens/login_screen.dart';
import 'package:quiz_app/screens/authentication_screens/register_screen.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool showLoginScreen = true;

  void toogleScreens() {
    setState(() {
      showLoginScreen = !showLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginScreen) {
      return LoginScreen(showRegisterScreen: toogleScreens);
    } else {
      return RegisterScreen(showLoginScreen: toogleScreens);
    }
  }
}