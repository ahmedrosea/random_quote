import 'package:flutter/material.dart';
import 'package:test_app/config/routes/app_routes.dart';
import 'package:test_app/config/themes/app_theme.dart';
import 'package:test_app/core/utils/app_strings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
