import 'package:breaking_bad_api/breaking_bad/data/data_sources/remote/breaking_bad_remote_database.dart';
import 'package:breaking_bad_api/breaking_bad/data/repositories/breaking_bad_repository_impl.dart';
import 'package:breaking_bad_api/breaking_bad/domain/repositories/breaking_bad_repository.dart';
import 'package:breaking_bad_api/breaking_bad/domain/use_cases/addStudent.dart';
import 'package:breaking_bad_api/breaking_bad/domain/use_cases/getAllCharacterUsecase.dart';
import 'package:breaking_bad_api/breaking_bad/domain/use_cases/getStudents.dart';
import 'package:breaking_bad_api/breaking_bad/presentation/cubit/breaking_bad_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

var sl = GetIt.instance;

Future<void> init() async {
  // Bloc

  sl.registerFactory(() => BreakingBadCubit(getAllCharacterUsecase: sl(),addStudent: sl(), getallstudents: sl()));

  sl.registerLazySingleton<BreakingBadRepository>(
      () => BreakingBadRepositoryImpl(breakingBadRemoteDatabase: sl()));
  sl.registerLazySingleton<BreakingBadRemoteDatabase>(
      () => BreakkingBadRemoteDatabaseImpl(dio: sl()));
  sl.registerLazySingleton(() => GetAllCharacterUsecase(sl()));
  sl.registerLazySingleton(() => AddStudent(repository: sl()));

  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => getAllStudents(sl()));
}
