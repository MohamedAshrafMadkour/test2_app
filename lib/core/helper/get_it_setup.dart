import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:test2_app/core/service/api_service.dart';
import 'package:test2_app/features/auth/login/data/login_repo/login_repo.dart';
import 'package:test2_app/features/auth/login/data/login_repo/login_repo_impl.dart';
import 'package:test2_app/features/auth/register/data/repo/register_repo.dart';
import 'package:test2_app/features/auth/register/data/repo/register_repo_impl.dart';
import 'package:test2_app/features/home/data/repo/laptop_repo.dart';
import 'package:test2_app/features/home/data/repo/laptop_repo_impl.dart';

var getIt = GetIt.instance;

void getItSetup() {
  AndroidOptions getAndroidOption() =>
      AndroidOptions(encryptedSharedPreferences: true);
  getIt.registerLazySingleton(
    () => FlutterSecureStorage(aOptions: getAndroidOption()),
  );
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio: Dio()));
  getIt.registerLazySingleton<LaptopRepo>(
    () => HomeRepoImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerLazySingleton<RegisterRepo>(
    () => RegisterRepoImpl(apiService: getIt.get<ApiService>()),
  );
}
