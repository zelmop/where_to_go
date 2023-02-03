import 'package:flutter/material.dart';

class NoItems extends StatelessWidget {
  final String text;

  const NoItems({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'NotSans',
          color: Colors.blueGrey,
          fontStyle: FontStyle.italic,
          fontSize: 16
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}