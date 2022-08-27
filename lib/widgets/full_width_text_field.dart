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
  }) : super(key: key);
  final String hintText;
  final FormFieldSetter<String> onSaved;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;
  final FormFieldValidator<String> validator;
  final Function onEditingComplete;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.90,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        onChanged: onChanged,
        onEditingComplete: () => onEditingComplete(),
        onSaved: onSaved,
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: "Provide",
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
