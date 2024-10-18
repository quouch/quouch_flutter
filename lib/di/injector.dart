import 'package:authentication_repository/authentication_repository.dart';
import 'package:cache/cache.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quouch_app/flavors.dart';
import 'package:user_repository/user_repository.dart';

///dependency injection- Creates Singleton objects
final getIt = GetIt.instance;

void setup() async {
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => CacheClient());
  getIt.registerLazySingleton(() => AuthenticationRepository(
      dio: getIt(), cache: getIt(), apiBaseUrl: F.apiBaseUrl));
  getIt.registerLazySingleton(
      () => UserRepository(cache: getIt(), apiBaseUrl: F.apiBaseUrl));
}
