import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class SimpleLoader extends StatelessWidget {
  final double width;
  final double height;

  const SimpleLoader({
    super.key,
    required this.width,
    required this.height
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: ColorConstants.primaryGrey,
      child: const Center(
        child: CircularProgressIndicator()
      )
    ); 
  }
}