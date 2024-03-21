import 'package:flutter/material.dart';

class CustomLightTheme {
  static ThemeData theme = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xffb31824),
      onPrimary: Colors.white,
      secondary: Colors.black,
      onSecondary: Colors.white,
      tertiary: Color(0xffcb2531),
      onTertiary: Colors.white,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
      error: Colors.black,
      onError: Colors.red,
    ),
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      titleLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      bodySmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
    ),
  );
}
