import 'package:flutter/material.dart';
import 'package:flutter_prod/app/view/theme/app_colors.dart';
import 'package:flutter_prod/app/view/theme/app_theme.dart';

class LightTheme extends AppTheme {
  @override
  AppColors get colors => LightColors();

  @override
  FilledButtonTheme get filledButtonTheme => throw UnimplementedError();

  @override
  OutlinedButtonTheme get outlinedButtonTheme => throw UnimplementedError();

  @override
  TextTheme get textTheme => TextTheme();

  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: colors.background,
          foregroundColor: colors.surface900,
          //TODO: refactor it letter
          titleTextStyle: TextStyle(
            color: colors.surface900,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}

class LightColors extends AppColors {
  @override
  Color get background => const Color(0xffF5F5F5);

  @override
  Color get error => const Color(0xffB00020);

  @override
  // TODO: implement primary
  Color get primary => throw UnimplementedError();

  @override
  // TODO: implement primary2nd
  Color get primary2nd => throw UnimplementedError();

  @override
  // TODO: implement primary3rd
  Color get primary3rd => throw UnimplementedError();

  @override
  // TODO: implement primary4th
  Color get primary4th => throw UnimplementedError();

  @override
  // TODO: implement primary5th
  Color get primary5th => throw UnimplementedError();

  @override
  // TODO: implement primary6th
  Color get primary6th => throw UnimplementedError();

  @override
  // TODO: implement secondary
  Color get secondary => throw UnimplementedError();

  @override
  // TODO: implement secondary2nd
  Color get secondary2nd => throw UnimplementedError();

  @override
  // TODO: implement secondary3rd
  Color get secondary3rd => throw UnimplementedError();

  @override
  // TODO: implement secondary4th
  Color get secondary4th => throw UnimplementedError();

  @override
  // TODO: implement secondary5th
  Color get secondary5th => throw UnimplementedError();

  @override
  // TODO: implement secondary6th
  Color get secondary6th => throw UnimplementedError();

  @override
  // TODO: implement success
  Color get success => throw UnimplementedError();

  @override
  // TODO: implement surface100
  Color get surface100 => throw UnimplementedError();

  @override
  // TODO: implement surface200
  Color get surface200 => throw UnimplementedError();

  @override
  // TODO: implement surface300
  Color get surface300 => throw UnimplementedError();

  @override
  // TODO: implement surface400
  Color get surface400 => throw UnimplementedError();

  @override
  // TODO: implement surface50
  Color get surface50 => throw UnimplementedError();

  @override
  // TODO: implement surface500
  Color get surface500 => throw UnimplementedError();

  @override
  // TODO: implement surface600
  Color get surface600 => throw UnimplementedError();

  @override
  // TODO: implement surface700
  Color get surface700 => throw UnimplementedError();

  @override
  // TODO: implement surface800
  Color get surface800 => throw UnimplementedError();

  @override
  // TODO: implement surface900
  Color get surface900 => throw UnimplementedError();

  @override
  // TODO: implement warning
  Color get warning => throw UnimplementedError();
}
