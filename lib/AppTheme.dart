import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: Colors.white,
    colorScheme: ColorScheme.light(
      background: Colors.white,
      primary: Colors.white,
      onPrimary: Colors.black,
      secondary: Colors.black,
      onSecondary: Colors.white,
    ),
    iconTheme: IconThemeData(color: Colors.black),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade900,
      primary: Colors.black,
      onPrimary: Colors.white,
      secondary: Colors.white,
      onSecondary: Colors.black,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  );
}