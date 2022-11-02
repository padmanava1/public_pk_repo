import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pateint_ui/cubit/questionare_cubit.dart';
import 'package:pateint_ui/visiting/injection_container.dart' as di;
import 'package:pateint_ui/visiting/injection_container.dart';
import 'package:pateint_ui/visiting/presentation/cubit/visit_details_cubit.dart';
import 'package:pateint_ui/visiting/presentation/cubit/visits_cubit.dart';
import 'package:pateint_ui/utils/default_theme.dart';
import 'visiting/presentation/cubit/bottom_nav_bar_cubit.dart';
import 'visiting/presentation/pages/bottom_nav_bar_pages.dart';
import 'cubit/sign_forms_cubit.dart';
import 'visiting/presentation/cubit/upcoming_visit_page_cubit.dart';


void main() async{
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<SignFormsCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<QuestionareCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<UpcomingVisitPageCubit>()..showUpcomingVisit(),
        ),
        BlocProvider(
          create: (context) => sl<BottomNavBarCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<VisitsCubit>()..showAllVisits(),
        ),
        BlocProvider(
          create: (context) => sl<VisitDetailsCubit>()..showVisitDetails(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue ,
        ).copyWith(primaryColor: DefaultTheme.errorColor,),
        home:
        BottomNavBar()
        //SignFormPage(),
        // const SignedPage(),
        //QuestionarePage(),
      ),
    );
  }
}

