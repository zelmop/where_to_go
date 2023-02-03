import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';

class ThemeConstants {
  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    fillColor: ColorConstants.secondaryGrey,
    filled: true,
    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(width: 1.5, color: ColorConstants.tertiaryGrey)
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(width: 2, color: ColorConstants.primaryColor)
    )
  );
}