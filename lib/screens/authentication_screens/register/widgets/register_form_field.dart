import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/text_form_field.dart';

class RegisterFormField extends StatelessWidget {
  const RegisterFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _passwordController = TextEditingController();
    final _confirmPasswordController = TextEditingController();
    final _emailController = TextEditingController();
    final _usernameController = TextEditingController();

    return Column(
      children: [
        CustomTextFormField(
          controller: _usernameController,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.text,
          labelText: 'Username',
          prefixIcon: const Icon(Icons.person),
          validator: (value) {
            if (value!.isEmpty) {
              return 'This field is required.';
            }
            return null;
          },
          obscureText: false,
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
            } else if (!EmailValidator.validate(value)) {
              return 'Please enter a valid email address.';
            }
            return null;
          },
          obscureText: false,
        ),
        CustomTextFormField(
          controller: _passwordController,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.text,
          labelText: 'Password',
          prefixIcon: const Icon(Icons.lock),
          validator: (value) {
            if (value!.isEmpty) {
              return 'This field is required.';
            } else if (value.length < 6) {
              return 'Password must be longer than 6 characters.';
            }
            return null;
          },
          obscureText: true,
        ),
        CustomTextFormField(
          controller: _confirmPasswordController,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.text,
          labelText: 'Confirm Password',
          prefixIcon: const Icon(Icons.lock),
          validator: (value) {
            if (value != _passwordController.text) {
              return 'Passwords don\'t match.';
            }
            return null;
          },
          obscureText: true,
        )
      ],
    );
  }
}
