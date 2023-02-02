import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;
  final String text;
  final double width;

  const LargeButton({
    super.key,
    required this.color,
    required this.onPressed,
    required this.text,
    required this.width
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(width * .5)
          )
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'NotoSans',
            fontSize: 16,
            fontWeight: FontWeight.w600
          )
        )
      )
    );
  }
}