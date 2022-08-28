import 'package:authentication/constants.dart';
import 'package:flutter/material.dart';

class FullWidthTextField extends StatelessWidget {
  const FullWidthTextField({
    Key? key,
    this.hintText = "Enter Value",
    required this.onSaved,
    required this.controller,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
    required this.validator,
    required this.onEditingComplete,
    required this.icon,
    this.isObscureText = false,
  }) : super(key: key);
  final String hintText;
  final FormFieldSetter<String> onSaved;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;
  final FormFieldValidator<String> validator;
  final Function onEditingComplete;
  final IconData icon;
  final bool isObscureText;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.90,
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 15.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: kShadowColor,
            offset: Offset(0, 12),
            blurRadius: 16.0,
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        onChanged: onChanged,
        onEditingComplete: () => onEditingComplete(),
        onSaved: onSaved,
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isObscureText,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.black,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
