import 'package:flutter/material.dart';

class Divider extends StatelessWidget {
  const Divider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 2,
              width: MediaQuery.of(context).size.width / 3,
              color: const Color(0xFF251F47),
            ),
          ),
          const Text(
            'or',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 2,
              width: MediaQuery.of(context).size.width / 3,
              color: const Color(0xFF251F47),
            ),
          ),
        ],
      ),
    );
  }
}
