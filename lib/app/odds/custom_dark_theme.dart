import 'package:flutter/material.dart';

class CustomDarkTheme {
  static ThemeData theme = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb31824),
      onPrimary: Colors.white,
      secondary: Colors.white,
      onSecondary: Colors.black,
      tertiary: Color(0xffcb2531),
      onTertiary: Colors.white,
      background: Colors.black,
      onBackground: Colors.white,
      surface: Colors.black,
      onSurface: Colors.white,
      error: Colors.black,
      onError: Colors.red,
    ),
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      titleLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      bodySmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
    ),
  );
}