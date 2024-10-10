import 'package:contapp/design/colors.dart';
import 'package:flutter/material.dart';

class SysifosThemes {
  SysifosThemes._();
  static ThemeData defaultTheme = ThemeData(
    fontFamily: 'RobotoMono',
    primaryColor: SysifosColors.brandPrimaryColor,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 48.0,
          fontWeight: FontWeight.bold,
          color: SysifosColors.brandLightColor),
      displayMedium: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: SysifosColors.brandLightColor),
      displaySmall: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: SysifosColors.brandLightColor),
      headlineLarge:
          TextStyle(fontSize: 21.0, color: SysifosColors.brandPrimaryColor),
      labelLarge: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.w600,
          color: SysifosColors.brandPrimaryColor),
      labelMedium: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w400,
          color: SysifosColors.brandLigthDarkColor),
      labelSmall: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: SysifosColors.brandDarkColor),
      bodyLarge: TextStyle(fontSize: 14.0),
      bodyMedium: TextStyle(fontSize: 13.0),
      bodySmall: TextStyle(fontSize: 10.0),
    ),
  );
}
