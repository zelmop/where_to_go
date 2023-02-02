import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Color color;
  final FontStyle fontStyle;
  final FontWeight fontWeight;
  final String text;
  final double width;
  
  const Header({
    super.key,
    required this.color,
    required this.fontStyle,
    required this.fontWeight,
    required this.text,
    required this.width
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Lato',
          color: color,
          fontSize: 24,
          fontWeight: fontWeight,
          fontStyle: fontStyle
        )
      )
    );
  }
}