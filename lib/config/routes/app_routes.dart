import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/utils/app_strings.dart';
import 'package:test_app/features/favourite_quote/presentation/screens/favourite_quote_screen.dart';
import 'package:test_app/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:test_app/features/random_quote/presentation/screens/quote_screen.dart';
import 'package:test_app/injection_container.dart';

class Routes {
  static const String initialRoute = "/";
  static const String favouriteQuoteRoute = "/favouriteQuote";
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<RandomQuoteCubit>(),
            child: const QuoteScreen(),
          ),
        );
      case Routes.favouriteQuoteRoute:
        return MaterialPageRoute(
          builder: (context) => const FavouriteQuoteScreen(),
        );
      default:
        return onUndefinedRoute();
    }
  }

  static Route<dynamic> onUndefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(
            AppStrings.undefinedRoute,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
