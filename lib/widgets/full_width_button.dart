import 'package:authentication/constants.dart';
import 'package:flutter/material.dart';

class FullWidthButton extends StatelessWidget {
  const FullWidthButton({
    Key? key,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);
  final Function onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: size.width * 0.60,
        height: 60.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: kShadowColor,
                offset: Offset(0, 12),
                blurRadius: 16.0,
              ),
            ],
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color.fromARGB(255, 84, 169, 239),
                Color.fromARGB(255, 102, 121, 231),
              ],
            )),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 25.0,
            ),
          ),
        ),
      ),
    );
  }
}
