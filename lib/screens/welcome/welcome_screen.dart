import 'package:authentication/widgets/full_width_text_field.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isBothValid = false;
  final GlobalKey<FormState> _key = GlobalKey();
  String email = "", password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _key,
          autovalidateMode: isBothValid
              ? AutovalidateMode.always
              : AutovalidateMode.onUserInteraction,
          child: FullWidthTextField(
            controller: _emailController,
            onChanged: (value) {},
            onSaved: (value) {
              email = value!;
            },
            onEditingComplete: () {},
            validator: (str) {},
            hintText: "Enter Email Address",
          ),
        ),
      ),
    );
  }
}
