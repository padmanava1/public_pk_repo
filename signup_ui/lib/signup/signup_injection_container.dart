import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'data/datasources/signup_data_source.dart';
import 'data/datasources/signup_data_source_impl.dart';
import 'data/repositories/signup_repository_impl.dart';
import 'domain/repositories/signup_repository.dart';
import 'domain/usecases/signup_usecase.dart';

import 'presentation/bloc/sign_up_bloc.dart';



GetIt sl = GetIt.instance;

Future<void> init() async {


  //Bloc
  
  sl.registerFactory(() => SignUpBloc(signUpUsecase: sl()));
  

  // Cubit
  

  // Usecase
  sl.registerLazySingleton(() => SignUpUsecase( signUpRepository: sl()));

  //Dio
  sl.registerLazySingleton(() => Dio());

  //Repository
  sl.registerLazySingleton<SignUpRepository>(() => SignUpRepositoryImpl(signUpDataSource: sl()));

  //DataSource
  sl.registerLazySingleton<SignUpDataSource>(() => SignUpDataSourceImpl(dio:sl()));

}