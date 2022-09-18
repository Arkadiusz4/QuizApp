import 'package:flutter/material.dart';

class RowRegister extends StatelessWidget {
  const RowRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
