  import 'package:flutter/material.dart';

String colorToString(Color color) {
    return 'Color(0x${color.value.toRadixString(16).padLeft(8, '0')})';
}

Color stringToColor(String colorString) {
  String hexString = colorString.substring(8, 16);
  int colorValue = int.parse(hexString, radix: 16);
  return Color(colorValue);
}