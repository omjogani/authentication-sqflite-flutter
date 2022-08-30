import 'package:authentication/constants.dart';
import 'package:authentication/model/user_model.dart';
import 'package:authentication/screens/welcome/welcome_screen.dart';
import 'package:authentication/services/auth_services.dart';
import 'package:authentication/widgets/full_width_button.dart';
import 'package:authentication/widgets/full_width_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isBothValid = false;
  final GlobalKey<FormState> _key = GlobalKey();
  String emailLocal = "Om", passwordLocal = "om";
  DBHelper? dbHelper = DBHelper();

  void singupSubmitEvent() {
    String emailToBeSent = _emailController.text.trim();
    String passwordToBeSent = _passwordController.text.trim();
    dbHelper!
        .insert(
      User(email: emailToBeSent, password: passwordToBeSent),
    ).then((value) {
      const snackBar = SnackBar(
        backgroundColor: Colors.green,
        content: Text('Registered Successfully'),
        duration: Duration(seconds: 1),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }).onError((error, stackTrace) {
      const snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text('Something Went Wrong!!'),
        duration: Duration(seconds: 1),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
    
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const WelcomeScreen(),
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
                  "Register",
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
                  buttonText: "Sign Up",
                  onTap: () => singupSubmitEvent(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
