import 'package:dartz/dartz.dart';
import 'package:test_app/core/error/failures.dart';
import 'package:test_app/features/random_quote/domain/entities/quote.dart';

abstract class RandomQuoteRepository {
  Future<Either<Failure, Quote>> getRandomQuote();
}
