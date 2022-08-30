import 'package:authentication/constants.dart';
import 'package:authentication/screens/register/register_screen.dart';
import 'package:authentication/screens/welcome/welcome_screen.dart';
import 'package:authentication/services/auth_services.dart';
import 'package:authentication/widgets/full_width_button.dart';
import 'package:authentication/widgets/full_width_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isBothValid = false;
  final GlobalKey<FormState> _key = GlobalKey();
  String emailLocal = "", passwordLocal = "";
  DBHelper? dbHelper = DBHelper();

  void successNavigation(){
     Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        ),
      );
  }
  void loginSubmitEvent() async {
    final String emailToBeSent = _emailController.text.trim();
    final String passwordToBeSent = _passwordController.text.trim();
    var response = await dbHelper!.isEmailExist(emailToBeSent,passwordToBeSent);
    if (response) {
      successNavigation();
    } else {
      const snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text('User not Found!!'),
        duration: Duration(seconds: 1),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
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
                    emailLocal = value!;
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
                    passwordLocal = value!;
                  },
                  onEditingComplete: () {},
                  validator: (str) {},
                  hintText: "Enter Password",
                  isObscureText: true,
                  icon: Icons.lock_outline_rounded,
                ),
                const SizedBox(height: 20.0),
                FullWidthButton(
                  buttonText: "Login",
                  onTap: () => loginSubmitEvent(),
                ),
                const SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 20.0,
                    )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
