import 'package:flutter/material.dart';

extension HexColor on Color {
  static Color hexString(String color) {
    color = color.replaceAll('#', '');
    if (color.length == 6) {
      color = 'FF$color';
    }
    return Color(int.parse(color, radix: 16));
  }
}

class AppColors {
  static Color black = HexColor.hexString('#000000');
  static Color white = HexColor.hexString('#FFFFFF');
  static Color greenFill = HexColor.hexString('#DFF3E8');
  static Color primary = HexColor.hexString('#176B50');
  static Color background = HexColor.hexString('#E4EBE7');
}
