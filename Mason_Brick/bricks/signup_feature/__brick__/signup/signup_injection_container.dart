import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {

  // Cubit

  sl.registerFactory(() => SignupCubit(signUpUsecase: sl()));

  // Usecase
  sl.registerLazySingleton(() => SignUpUsecase( signupRepository: sl()));

  //Dio
  sl.registerLazySingleton(() => Dio());

  //Repository
  sl.registerLazySingleton<SignupRepository>(() => SignupRepositoryImpl(signUpDataSource: sl()));

  //DataSource
  sl.registerLazySingleton<SignUpDataSource>(() => SignUpDataSourceImpl(dio:sl()));

}