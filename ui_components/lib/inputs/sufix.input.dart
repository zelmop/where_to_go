import 'package:flutter/material.dart';

class SufixInput extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String labelText;
  final VoidCallback onPressed;
  final double width;
  final bool obscureText;
  final Function validator;
  
  const SufixInput({
    super.key,
    required this.controller,
    required this.icon,
    required this.labelText,
    required this.onPressed,
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
          ),
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(icon)
          )
        ),
        validator: (value) => validator(value)
      )
    );
  }
}