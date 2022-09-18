import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/screens/auth/utils.dart';
import 'package:quiz_app/screens/authentication_screens/register/widgets/footer.dart';
import 'package:quiz_app/screens/authentication_screens/register/widgets/headings.dart';
import 'package:quiz_app/screens/authentication_screens/register/widgets/register_button.dart';
import 'package:quiz_app/screens/authentication_screens/register/widgets/register_form_field.dart';
import 'package:quiz_app/screens/authentication_screens/register/widgets/row_register.dart';

class RegisterScreen extends StatefulWidget {
  final VoidCallback showLoginScreen;

  const RegisterScreen({Key? key, required this.showLoginScreen})
      : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _form = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  Future register() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) return;

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
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message, Colors.red);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

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
              children: [
                const Heading50(),
                const Heading18(),
                const RegisterFormField(),
                RegisterButton(onPressed: register),
                Center(
                  child: Column(
                    children: [
                      const Divider(),
                      const Heading20(),
                      const RowRegister(),
                      Footer(
                        function: widget.showLoginScreen,
                      ),
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
