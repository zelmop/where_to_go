import 'package:flutter/material.dart';

class ChipCommon extends StatelessWidget {
  final VoidCallback onDeleted;
  final String text;

  const ChipCommon({
    super.key,
    required this.onDeleted,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      onDeleted: onDeleted,
      elevation: 2,
      label: Text(text),
      deleteIcon: const Icon(Icons.close, size: 16)
    );
  }
}