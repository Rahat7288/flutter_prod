import 'package:flutter/material.dart';
import 'package:flutter_prod/app/view/theme/app_colors.dart';

abstract class AppTheme {
  AppColors get colors;
  TextTheme get textTheme;
  ThemeData get themeData;
  FilledButtonTheme get filledButtonTheme;
  OutlinedButtonTheme get outlinedButtonTheme;
}
