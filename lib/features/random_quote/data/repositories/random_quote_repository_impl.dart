import 'package:test_app/core/error/exceptions.dart';
import 'package:test_app/core/network/network_info.dart';
import 'package:test_app/features/random_quote/data/datasources/random_quote_local_data_source.dart';
import 'package:test_app/features/random_quote/data/datasources/random_quote_remote_data_source.dart';
import 'package:test_app/features/random_quote/domain/entities/quote.dart';
import 'package:test_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:test_app/features/random_quote/domain/repositories/random_quote_repository.dart';

class RandomQuoteRepositoryImpl implements RandomQuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;

  RandomQuoteRepositoryImpl({
    required this.networkInfo,
    required this.randomQuoteRemoteDataSource,
    required this.randomQuoteLocalDataSource,
  });

  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteRandomQuote =
            await randomQuoteRemoteDataSource.getRandomQuote();
        return Right(remoteRandomQuote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final cacheRandomQuote =
            await randomQuoteLocalDataSource.getLastQuote();
        return Right(cacheRandomQuote);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
