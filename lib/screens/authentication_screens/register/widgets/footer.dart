import 'package:flutter/widgets.dart';

class Footer extends StatelessWidget {
  final VoidCallback function;
  const Footer({Key? key, required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            'Already have an account?',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: function,
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
    );
  }
}
