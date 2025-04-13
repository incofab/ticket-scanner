import 'package:flutter/material.dart';

class K {
  static Color? textLight = Colors.grey[300];
  static Color? textColor = Colors.grey[600];
  static Color? textDark = Colors.grey[900];

  static String ucfirst(String? s) {
    if (s?.isEmpty ?? true) return '';
    return s![0].toUpperCase() + s.substring(1).toLowerCase();
  }

  static String pluralize(int value, String s) {
    if (value < 2) return '$value$s';
    return '$value${s}s';
  }

  static double roundToDecimal(double value, [int decimalPlaces = 2]) {
    double scaledValue = value * (10 * decimalPlaces);
    int roundedInt = scaledValue.round(); // 314
    return roundedInt / (10 * decimalPlaces); // 3.14
  }

  static WidgetStateProperty<Color> buttonBg =
      WidgetStateProperty.resolveWith((final Set<WidgetState> states) {
    if (states.contains(WidgetState.pressed)) {
      return Colors.grey.shade800;
    }
    return Colors.grey.shade900;
  });

  static WidgetStateProperty<Color> buttonForegroundColor =
      WidgetStateProperty.all(Colors.white);
}
