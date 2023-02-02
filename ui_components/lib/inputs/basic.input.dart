import 'package:flutter/material.dart';

class BasicInput extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final double width;
  final bool obscureText;
  final Function validator;
  
  const BasicInput({
    super.key,
    required this.controller,
    required this.labelText,
    required this.width,
    required this.validator,
    this.obscureText = false
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          label: Text(
            labelText, 
            style: const TextStyle(fontFamily: 'NotoSans')
          )
        ),
        validator: (value) => validator(value)
      )
    );
  }
}