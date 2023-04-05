import 'package:flutter/material.dart';
import 'package:test_app/core/utils/app_colors.dart';
import 'package:test_app/core/utils/app_strings.dart';

class FavouriteQuoteScreen extends StatelessWidget {
  const FavouriteQuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppStrings.favouriteQuote,
          style: TextStyle(
            fontSize: 30.0,
            color: AppColors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
