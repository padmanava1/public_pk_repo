import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pateint_ui/cubit/visits_cubit.dart';
import 'package:pateint_ui/utils/default_theme.dart';

import '../cubit/upcoming_visit_page_cubit.dart';
import '../widgets/visits_list_tile.dart';

class VisitsPage extends StatelessWidget {
  const VisitsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var cubit = BlocProvider.of<UpcomingVisitPageCubit>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leadingWidth: 80,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
                height: 24,
                width: 24,
                image: AssetImage('graphics/ellipse.png')),
            SizedBox(
              width: 5,
            ),
            Text(
              'Visits',
              style: TextStyle(fontSize: 18, color: Colors.black),
            )
          ],
        ),
      ),
      body: Scaffold(
        backgroundColor: DefaultTheme.backgroundColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 14.0,
              horizontal: 12.0,
            ),
            child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return BlocProvider(
                    create: (context) => VisitsCubit(),
                    child: VisitsListTile(index: index,
                      // isTileExpanded: false,
                    ),
                  );
                }),
          )),
    );
  }
}
