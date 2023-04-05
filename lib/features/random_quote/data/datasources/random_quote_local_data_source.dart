// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/core/error/exceptions.dart';
import 'package:test_app/core/utils/app_strings.dart';

import 'package:test_app/features/random_quote/data/models/quote_model.dart';

abstract class RandomQuoteLocalDataSource {
  Future<QuoteModel> getLastQuote();
  Future<void> cache(QuoteModel quote);
}

class RandomQuoteLocalDataSourceImpl implements RandomQuoteLocalDataSource {
  final SharedPreferences sharedPreferences;
  RandomQuoteLocalDataSourceImpl({
    required this.sharedPreferences,
  });
  @override
  Future<void> cache(QuoteModel quote) async {
    await sharedPreferences.setString(
      AppStrings.latestQuote,
      json.encode(quote),
    );
  }

  @override
  Future<QuoteModel> getLastQuote() {
    final jsonString = sharedPreferences.getString(AppStrings.latestQuote);
    if (jsonString != null) {
      final latestQuote =
          Future.value(QuoteModel.fromJson(json.decode(jsonString)));
      return latestQuote;
    } else {
      throw CacheException();
    }
  }
}
