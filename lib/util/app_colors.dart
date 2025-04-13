import 'package:flutter/material.dart';

class AppColors {
  static const MaterialColor pinkPrimary =
      MaterialColor(_pinkPrimaryValue, <int, Color>{
    50: Color(0xFFFCE4EC),
    100: Color(0xFFF8BBD0),
    200: Color(0xFFF48FB1),
    300: Color(0xFFF06292),
    400: Color(0xFFEC407A),
    500: Color(_pinkPrimaryValue), // Base color
    600: Color(0xFFD81B60),
    700: Color(0xFFC2185B),
    800: Color(0xFFAD1457),
    900: Color(0xFF880E4F),
  });

  static const int _pinkPrimaryValue = 0xFFE91E63; // main pink (500)

  static const Color secondary =
      Color(0xFF673AB7); // Deep Purple (Material Purple 500)

  // Optionally, you can define accent shades too
  static const Color pinkAccent = Color(0xFFFF4081); // pinkAccent[200]
  static const Color secondaryAccent = Color(0xFF7C4DFF); // purpleAccent[400]
}
