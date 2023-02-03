import 'package:flutter/material.dart';

class NickTileText extends StatelessWidget {
  final String nick;

  const NickTileText({
    super.key,
    required this.nick
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      nick,
      style: const TextStyle(
        fontFamily: 'NotoSans',
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: Colors.blueGrey,
        fontStyle: FontStyle.italic
      )
    );
  }
}