import 'package:flutter/material.dart';

class TextStyles {
  static Color color = const Color(0XFF000000);
  static TextStyle headlineLarger = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    color: color,
  );

  static TextStyle headlineMedium = headlineLarger.copyWith(
    fontSize: 40,
  );
}
