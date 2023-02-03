import 'package:flutter/material.dart';

class NameTileText extends StatelessWidget {
  final String name;

  const NameTileText({
    super.key,
    required this.name
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      name.substring(0,1).toUpperCase() + name.substring(1),
      style: const TextStyle(
        fontFamily: 'NotoSans',
        fontWeight: FontWeight.w700,
        fontSize: 18
      )
    );
  }
}