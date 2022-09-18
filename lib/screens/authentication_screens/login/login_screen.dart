import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/screens/authentication_screens/forget_password_screen.dart';
import 'package:quiz_app/screens/auth/utils.dart';
import 'package:quiz_app/screens/authentication_screens/login/widgets/forgot_password_button.dart';
import 'package:quiz_app/screens/authentication_screens/login/widgets/headings.dart';
import 'package:quiz_app/screens/authentication_screens/login/widgets/login_button.dart';
import 'package:quiz_app/screens/authentication_screens/login/widgets/login_form_field.dart';
import 'package:quiz_app/screens/authentication_screens/login/widgets/row_login.dart';
import 'package:quiz_app/screens/authentication_screens/register/widgets/footer.dart';
import 'package:quiz_app/widgets/text_form_field.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback showRegisterScreen;
  const LoginScreen({Key? key, required this.showRegisterScreen})
      : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _form = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  Future login() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                height: 250,
                width: 250,
                child: LoadingAnimationWidget.dotsTriangle(
                    color: const Color(0xFF3083DC), size: 100),
              ),
            ));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message, Colors.red);
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  Future loginWithGoogle() async {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFCFCFF),
        body: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisSize: MainAxisSize.max,
              children: [
                const Heading50Login(),
                const Heading18Login(),
                const LoginFormField(),
                const ForgotPasswordButton(),
                LoginButton(onPressed: login),
                Center(
                  child: Column(
                    children: [
                      const Divider(),
                      const Heading20Login(),
                      const RowLogin(),
                      Footer(function: widget.showRegisterScreen),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
