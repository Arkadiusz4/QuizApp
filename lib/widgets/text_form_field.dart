import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.textInputAction,
    required this.textInputType,
    required this.labelText,
    required this.prefixIcon,
    required this.validator,
    required this.obscureText,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final String labelText;
  final Icon prefixIcon;
  final String? Function(String?)? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: TextFormField(
        controller: controller,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          label: Text(labelText),
          hintStyle: const TextStyle(color: Color(0xFF251F47)),
          prefixIcon: prefixIcon,
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
        validator: validator,
        obscureText: obscureText,
      ),
    );
  }
}
