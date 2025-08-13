import 'package:flutter/material.dart';

final ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF9F9FED),
    onPrimary: Colors.white,
    secondary: Color(0xFF9F9FED),
    onSecondary: Colors.white,
    background: Color(0xFF9F9FED),
    onBackground: Colors.white,
    surface: Colors.white,
    onSurface: Color(0xFF9F9FED),
  ),
);

final ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color(0xFF0F0A1F),
  scaffoldBackgroundColor: Colors.white,
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF0F0A1F),
    onPrimary: Color(0xFF1C1533),
    secondary: Color(0xFF1C1533),
    onSecondary: Color(0xFF1C1533),
    background: Color(0xFF0F0A1F),
    onBackground: Color(0xFF0F0A1F),
    surface: Color(0xFF0F0A1F),
    onSurface: Colors.white,
  ),
);
