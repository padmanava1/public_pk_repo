import 'package:breaking_bad_practise/breaking_bad/data/remote/data_sources/breaking_bad_data_source.dart';
import 'package:breaking_bad_practise/breaking_bad/data/remote/data_sources/breaking_bad_data_source_impl.dart';
import 'package:breaking_bad_practise/breaking_bad/data/repositories/breaking_bad_repository_impl.dart';
import 'package:breaking_bad_practise/breaking_bad/domain/repositories/breaking_bad_repository.dart';
import 'package:breaking_bad_practise/breaking_bad/domain/usecases/get_all_episodes_usecase.dart';
import 'package:breaking_bad_practise/breaking_bad/domain/usecases/get_characters_of_episodes_usecase.dart';
import 'package:breaking_bad_practise/breaking_bad/domain/usecases/get_random_characters_usecase.dart';
import 'package:breaking_bad_practise/breaking_bad/domain/usecases/get_random_quotes_by_author.dart';
import 'package:breaking_bad_practise/breaking_bad/presentation/cubit/episode_details_cubit.dart';
import 'package:breaking_bad_practise/breaking_bad/presentation/cubit/homepage_cubit.dart';
import 'package:breaking_bad_practise/breaking_bad/presentation/cubit/shared_pref_cubit.dart';
import 'package:breaking_bad_practise/breaking_bad/presentation/cubit/splash_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => SplashCubit());
  sl.registerLazySingleton(() => PrefCubit());
  sl.registerFactory(() => HomepageCubit(
      getAllEpisodesUsecase: sl(), getRandomCharactersUsecase: sl()));
  sl.registerFactory(() => EpisodeDetailsCubit(getCharactersOfEpisodesUsecase: sl(), getRandomQuotesByAuthorUsecase: sl()));


  sl.registerLazySingleton(
      () => GetAllEpisodesUsecase(breakingBadRepository: sl()));
  sl.registerLazySingleton(() => GetCharactersOfEpisodesUsecase(breakingBadRepository: sl()));

  sl.registerLazySingleton(() => GetRandomQuotesByAuthorUsecase(breakingBadRepository: sl()));
  sl.registerLazySingleton(() => GetRandomCharactersUsecase(breakingBadRepository: sl()));

  sl.registerLazySingleton<BreakingBadRepository>(
      () => BreakingBadRepositoryImpl(breakingBadDataSource: sl()));

  sl.registerLazySingleton<BreakingBadDataSource>(
      () => BreakingBadDataSourceImpl(dio: sl()));

  sl.registerLazySingleton(() => Dio());
}
