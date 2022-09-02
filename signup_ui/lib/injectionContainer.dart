
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_application/news_app/data/data_sources/newsDataSource.dart';
import 'package:news_application/news_app/data/repositories/news_repo_impl.dart';
import 'package:news_application/news_app/domain/repositories/news_repository.dart';
import 'package:news_application/news_app/domain/use_cases/headlines_usecase.dart';
import 'package:news_application/news_app/presentation/cubit/news_cubit.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  // Bloc

  sl.registerFactory(() => NewsCubit(newsUsecase: sl()));

  sl.registerLazySingleton(() => NewsUsecase(sl()));

  sl.registerLazySingleton(() => Dio());

  sl.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(newsRemoteDataSource: sl()));

  sl.registerLazySingleton<NewsRemoteDataSource>(() => NewsRemoteDataSourceImpl(dio:sl()));

}
