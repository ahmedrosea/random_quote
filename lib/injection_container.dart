import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/core/network/network_info.dart';
import 'package:test_app/features/random_quote/data/datasources/random_quote_local_data_source.dart';
import 'package:test_app/features/random_quote/data/datasources/random_quote_remote_data_source.dart';
import 'package:test_app/features/random_quote/data/repositories/random_quote_repository_impl.dart';
import 'package:test_app/features/random_quote/domain/repositories/random_quote_repository.dart';
import 'package:test_app/features/random_quote/domain/usecases/get_random_quote.dart';
import 'package:test_app/features/random_quote/presentation/cubit/random_quote_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! features
  sl.registerFactory(
    () => RandomQuoteCubit(
      getRandomQuoteUseCase: sl(),
    ),
  );
  sl.registerLazySingleton<GetRandomQuote>(
    () => GetRandomQuote(
      randomQuoteRepository: sl(),
    ),
  );
  sl.registerLazySingleton<RandomQuoteRepository>(
    () => RandomQuoteRepositoryImpl(
      networkInfo: sl(),
      randomQuoteRemoteDataSource: sl(),
      randomQuoteLocalDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<RandomQuoteRemoteDataSource>(
    () => RandomQuoteRemoteDataSourceImpl(
      client: sl(),
    ),
  );
  sl.registerLazySingleton<RandomQuoteLocalDataSource>(
    () => RandomQuoteLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );
  //! core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(),
  );
  //! externals
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
}
