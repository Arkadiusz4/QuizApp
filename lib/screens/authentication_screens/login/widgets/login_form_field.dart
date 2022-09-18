import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/text_form_field.dart';

class LoginFormField extends StatelessWidget {
  const LoginFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _passwordController = TextEditingController();
    final _emailController = TextEditingController();

    return Column(
      children: [
        CustomTextFormField(
            controller: _emailController,
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.emailAddress,
            labelText: 'Email',
            prefixIcon: const Icon(Icons.email),
            validator: (value) {
              if (value!.isEmpty) {
                return 'This field is required.';
              } else if (!EmailValidator.validate(value)) {
                return 'Please enter a valid email address.';
              }
              return null;
            },
            obscureText: false),
        CustomTextFormField(
            controller: _passwordController,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.text,
            labelText: 'Password',
            prefixIcon: const Icon(Icons.email),
            validator: (value) {
              if (value!.isEmpty) {
                return 'This field is required.';
              } else if (value.length < 6) {
                return 'Password must be longer than 6 characters.';
              }
              return null;
            },
            obscureText: true),
      ],
    );
  }
}
