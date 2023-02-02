import 'package:flutter/material.dart';

class ColorConstants {
  static const Color primaryColor = Color(0xFFFFAE4C);
  static const Color secondaryColor = Color(0xFF65E6F5);
  static const Color primaryGrey = Color(0xFFF3F5F6);
  static const Color secondaryGrey = Color(0xFFEFEFF0);
  static const Color tertiaryGrey = Color(0xFFE8ECF1);

  static Map<int, Color> swatch = {
    50: const Color.fromRGBO(67, 55, 107, .1),
    100: const Color.fromRGBO(67, 55, 107, .2),
    200: const Color.fromRGBO(67, 55, 107, .3),
    300: const Color.fromRGBO(67, 55, 107, .4),
    400: const Color.fromRGBO(67, 55, 107, .5),
    500: const Color.fromRGBO(67, 55, 107, .6),
    600:const Color.fromRGBO(67, 55, 107, .7),
    700:const Color.fromRGBO(67, 55, 107, .8),
    800:const Color.fromRGBO(67, 55, 107, .9),
    900: const Color.fromRGBO(67, 55, 107, 1)
  };

  static MaterialColor primarySwatch = MaterialColor(0xFF43376B, swatch);
}