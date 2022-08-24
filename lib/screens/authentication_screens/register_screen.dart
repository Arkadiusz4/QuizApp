import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/widgets/text_form_field.dart';

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
              //   mainAxisSize: MainAxisSize.max,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 50),
                  child: Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF3083DC)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, left: 20, bottom: 40),
                  child: Text(
                    'Please sign up to continue.',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                  ),
                ),
                CustomTextFormField(
                  controller: _usernameController,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.text,
                  labelText: 'Username',
                  prefixIcon: const Icon(Icons.person),
                  validator: null,
                  obscurText: false,
                ),
                CustomTextFormField(
                  controller: _emailController,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress,
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field is required.';
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'Please enter a valid email address.';
                    }
                    return null;
                  },
                  obscurText: false,
                ),
                CustomTextFormField(
                  controller: _passwordController,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.text,
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  validator: null,
                  obscurText: true,
                ),
                CustomTextFormField(
                  controller: _confirmPasswordController,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.text,
                  labelText: 'Confirm Password',
                  prefixIcon: const Icon(Icons.lock),
                  validator: null,
                  obscurText: true,
                ),
                Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, top: 30),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF251F47),
                        fixedSize: Size(MediaQuery.of(context).size.width, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w600),
                      ),
                      onPressed: register,
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                height: 2,
                                width: MediaQuery.of(context).size.width / 3,
                                color: const Color(0xFF251F47),
                              ),
                            ),
                            const Text(
                              'or',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                height: 2,
                                width: MediaQuery.of(context).size.width / 3,
                                color: const Color(0xFF251F47),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text(
                          'Register with',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF251F47)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.facebook,
                                  color: Color(0xFF3083DC),
                                  size: 40,
                                )),
                            const SizedBox(
                              width: 20,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.email,
                                color: Color(0xFF3083DC),
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, bottom: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'Already have an account?',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: widget.showLoginScreen,
                              child: const Text(
                                'Sign In!',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF3083DC),
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
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
