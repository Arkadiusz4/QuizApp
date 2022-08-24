import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quiz_app/main.dart';

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
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
    // try {

    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'user-not-found') {
    //     print('No user found for that email.');
    //   } else if (e.code == 'wrong-password') {
    //     print('Wrong password provided for that user.');
    //   }
    // }
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
                    'Login',
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF3083DC)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, left: 20),
                  child: Text(
                    'Please sign in to continue.',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                  child: TextFormField(
                    controller: _emailController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      label: const Text('Email'),
                      hintStyle: const TextStyle(color: Color(0xFF251F47)),
                      prefixIcon: const Icon(Icons.email),
                      prefixIconColor: const Color(0xFF251F47),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xFF251F47),
                          width: 2.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required.';
                      }
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'Please enter a valid email address.';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      label: const Text('Password'),
                      prefixIcon: const Icon(Icons.lock),
                      prefixIconColor: const Color(0xFF251F47),
                      hintStyle: const TextStyle(color: Color(0xFF251F47)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xFF251F47),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20, top: 10),
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF3083DC)),
                    ),
                  ),
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
                        'Sign In',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w600),
                      ),
                      onPressed: login,
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
                          'Login with',
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
                              'Don\'t have an account?',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: widget.showRegisterScreen,
                              child: const Text(
                                'Create one.',
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