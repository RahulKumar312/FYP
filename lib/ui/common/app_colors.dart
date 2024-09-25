import 'package:flutter/material.dart';

const Color kcPrimaryColor = Color(0xFF3770D5);
const Color kcPrimaryColorlight = Color(0xFFA1C9FF);
const Color kcgreyColorlight = Color.fromARGB(255, 208, 222, 241);
const Color kcPrimaryColorDark = Color(0xFF353A48);
const Color kcDarkGreyColor = Color(0xFF1A1B1E);
const Color kcMediumGrey = Color(0xFF474A54);
const Color kcLightGrey = Color.fromARGB(255, 187, 187, 187);
const Color kcVeryLightGrey = Color(0xFFE8E8E8);
const Color white = Colors.white;
const Color green = Colors.green;
const Color red = Colors.red;
const Color amber = Colors.amber;
const Color kcBackgroundColor = kcDarkGreyColor;

Color getColorWithOpacity(Color colors, double val) {
  return colors.withOpacity(val);
}
