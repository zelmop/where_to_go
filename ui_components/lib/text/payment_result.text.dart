import 'package:flutter/material.dart';

class PaymentResultText extends StatelessWidget {
  final String text;

  const PaymentResultText({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'NotoSans',
        fontWeight: FontWeight.w500,
        fontSize: 22,
        fontStyle: FontStyle.italic
      )
    ); 
  }
}