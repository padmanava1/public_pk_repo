import 'package:breaking_bad_practise/breaking_bad/presentation/cubit/episode_details_cubit.dart';
import 'package:breaking_bad_practise/breaking_bad/presentation/cubit/homepage_cubit.dart';
import 'package:breaking_bad_practise/breaking_bad/presentation/cubit/shared_pref_cubit.dart';
import 'package:breaking_bad_practise/breaking_bad/presentation/cubit/splash_cubit.dart';
import 'package:breaking_bad_practise/breaking_bad/presentation/pages/splash_screen.dart';
import 'package:breaking_bad_practise/core/theme/make_my_trip_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

PrefCubit? cubit ;
void main() async {
  await di.init();
  WidgetsFlutterBinding.ensureInitialized();
  cubit =  sl<PrefCubit>();
 await  cubit?.setupLocalStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return MultiBlocProvider(
       providers: [
         BlocProvider(
           create: (context) => sl<SplashCubit>()..showSplash(),
         ),
         BlocProvider(
           create: (context) => sl<HomepageCubit>()..showAllEpisodes(),
         ),
         BlocProvider(
           create: (context) => sl<EpisodeDetailsCubit>(),
         ),

       ],
       child: GetMaterialApp(
         theme: cubit!.getDarkMode()?BreakingBadTheme.darkTheme : BreakingBadTheme.lightTheme ,
         debugShowCheckedModeBanner: false,
         title: 'Breaking Bad App',
         home: const SplashScreen(),
       ),
     );
   }

}
