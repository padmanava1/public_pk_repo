import 'package:get_it/get_it.dart';
import 'package:pateint_ui/cubit/sign_forms_cubit.dart';
import 'package:pateint_ui/visiting/data/data_sources/visiting_data_source_impl.dart';
import 'package:pateint_ui/visiting/presentation/cubit/upcoming_visit_page_cubit.dart';
import 'package:pateint_ui/visiting/presentation/cubit/visit_details_cubit.dart';
import 'package:pateint_ui/visiting/presentation/cubit/visits_cubit.dart';

import '../cubit/questionare_cubit.dart';
import 'data/data_sources/visiting_data_source.dart';
import 'data/repositories/visiting_repository_impl.dart';
import 'domain/repositories/visiting_repository.dart';
import 'domain/use_cases/all_visits_usecase.dart';
import 'domain/use_cases/upcoming_visit_usecase.dart';
import 'presentation/cubit/bottom_nav_bar_cubit.dart';

var sl = GetIt.instance;

Future<void> init() async{
   
  //Cubit
  sl.registerFactory(() => BottomNavBarCubit());
  sl.registerFactory(() => UpcomingVisitPageCubit(upcomingVisitUsecase: sl()));
  sl.registerFactory(() => VisitsCubit(allVisitsUsecase: sl()));
  sl.registerFactory(() => VisitDetailsCubit(upcomingVisitUsecase: sl()));
  sl.registerFactory(() => SignFormsCubit());
  sl.registerFactory(() => QuestionareCubit());


  //Usecase
  sl.registerLazySingleton(() => AllVisitsUsecase(visitingRepository: sl()));
  sl.registerLazySingleton(() => UpcomingVisitUsecase(visitingRepository: sl()));
  
  //Repository

  sl.registerLazySingleton<VisitingRepository>
    (() => VisitingRepositoryImpl(visitingDataSource: sl()));
  
  //Data source
  sl.registerLazySingleton<VisitingDataSource>
    (() => VisitingDataSourceImpl());
}