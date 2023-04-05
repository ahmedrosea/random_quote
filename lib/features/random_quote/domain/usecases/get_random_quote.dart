import 'package:dartz/dartz.dart';
import 'package:test_app/core/error/failures.dart';
import 'package:test_app/core/usecases/usecase.dart';
import 'package:test_app/features/random_quote/domain/entities/quote.dart';
import 'package:test_app/features/random_quote/domain/repositories/random_quote_repository.dart';

class GetRandomQuote implements UseCase<Quote, NoParams> {
  final RandomQuoteRepository randomQuoteRepository;
  GetRandomQuote({required this.randomQuoteRepository});
  @override
  Future<Either<Failure, Quote>> call(NoParams params) =>
      randomQuoteRepository.getRandomQuote();
}
