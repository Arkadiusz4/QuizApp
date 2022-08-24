import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      required this.controller,
      required this.textInputAction,
      required this.textInputType,
      required this.labelText,
      required this.prefixIcon})
      : super(key: key);

  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final String labelText;
  final Icon prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: TextFormField(
        controller: controller,
        textInputAction: textInputAction,
        keyboardType: textInputType,
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
      ),
    );
  }
}
