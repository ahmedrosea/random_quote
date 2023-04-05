import 'package:flutter/material.dart';
import 'package:test_app/core/utils/app_colors.dart';
import 'package:test_app/core/utils/app_strings.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    hintColor: AppColors.hint,
    fontFamily: AppStrings.fontFamily,
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
          fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        height: 1.3,
        color: Colors.white,
      ),
    ),
  );
}
