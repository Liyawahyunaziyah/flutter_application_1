import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/theme/color_pallete.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.Background,
  scaffoldBackgroundColor: AppColors.card,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: AppColors.textPrimary),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.darkBackground,
  scaffoldBackgroundColor: AppColors.darkCard,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.white),
  ),
);
