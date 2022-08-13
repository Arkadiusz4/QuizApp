import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFCFCFF),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //   mainAxisSize: MainAxisSize.max,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 50),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 20),
              child: Text(
                'Please sign in to continue.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: const Text('Email'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  label: const Text('Password'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
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
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
                child: ElevatedButton(
                  child: Text('Sign In'),
                  onPressed: () {},
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
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 2,
                          width: MediaQuery.of(context).size.width / 3,
                          color: Colors.black,
                        ),
                      ),
                      const Text(
                        'or',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 2,
                          width: MediaQuery.of(context).size.width / 3,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    'Login with',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.facebook)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.email)),
                    ],
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
