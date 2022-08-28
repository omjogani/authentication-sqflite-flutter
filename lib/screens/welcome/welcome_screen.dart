import 'package:authentication/constants.dart';
import 'package:authentication/screens/register/register_screen.dart';
import 'package:authentication/widgets/full_width_button.dart';
import 'package:authentication/widgets/full_width_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isBothValid = false;
  final GlobalKey<FormState> _key = GlobalKey();
  String email = "", password = "";

  void loginSubmitEvent() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RegisterScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Form(
          key: _key,
          autovalidateMode: isBothValid
              ? AutovalidateMode.always
              : AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Login",
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 40.0,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.40,
                  width: size.width * 0.90,
                  child: SvgPicture.asset(
                    "assets/images/authentication.svg",
                  ),
                ),
                FullWidthTextField(
                  controller: _emailController,
                  onChanged: (value) {},
                  onSaved: (value) {
                    email = value!;
                  },
                  onEditingComplete: () {},
                  validator: (str) {},
                  hintText: "Enter Email Address",
                  icon: Icons.email_rounded,
                ),
                const SizedBox(height: 20.0),
                FullWidthTextField(
                  controller: _passwordController,
                  onChanged: (value) {},
                  onSaved: (value) {
                    password = value!;
                  },
                  onEditingComplete: () {},
                  validator: (str) {},
                  hintText: "Enter Password",
                  icon: Icons.lock_outline_rounded,
                ),
                const SizedBox(height: 20.0),
                FullWidthButton(
                  buttonText: "Login",
                  onTap: () => loginSubmitEvent(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
