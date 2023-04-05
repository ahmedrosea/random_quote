import 'dart:convert';

import 'package:test_app/core/end_points/end_points.dart';
import 'package:test_app/core/error/exceptions.dart';
import 'package:test_app/features/random_quote/data/models/quote_model.dart';
import 'package:http/http.dart' as http;

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource {
  final http.Client client;

  RandomQuoteRemoteDataSourceImpl({required this.client});

  @override
  Future<QuoteModel> getRandomQuote() async {
    final randomQuoteUri = Uri.parse(EndPoints.randomQuote);
    final response = await client.get(randomQuoteUri);
    if (response.statusCode == 200) {
      return QuoteModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw ServerException();
    }
  }
}
