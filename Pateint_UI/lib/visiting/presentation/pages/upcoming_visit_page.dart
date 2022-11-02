import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pateint_ui/pages/visits_page.dart';
import 'package:pateint_ui/utils/default_theme.dart';
import 'package:pateint_ui/widgets/custom_button.dart';

import '../cubit/bottom_nav_bar_cubit.dart';
import '../cubit/upcoming_visit_page_cubit.dart';

class UpcomingVisitPage extends StatelessWidget {
  const UpcomingVisitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<UpcomingVisitPageCubit>(context);
    var bottomNavBarCuit = BlocProvider.of<BottomNavBarCubit>(context);
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
  builder: (context, state) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Image(
              height: 50,
              width: 50,
              image: const AssetImage('graphics/op-logo.png')),
          actions: [
            SizedBox(
              width: 60,
              child: Stack(
                alignment: Alignment.centerRight,
                children: const [
                  Positioned(
                      left: 10,
                      child: Image(
                          height: 30,
                          width: 30,
                          image: AssetImage('graphics/Ellipse 3.png'))),
                  //Image.asset('graphics/Ellipse 3.png',)), // Back image
                  Positioned(
                      child: Image(
                          height: 30,
                          width: 30,
                          image: AssetImage(
                              'graphics/Ellipse 4.png'))), // Front image
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: DefaultTheme.textHeadlineColor,
                size: 30,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Stack(alignment: Alignment.center, children: const [
                  Positioned(
                      child: Image(
                          image: AssetImage(
                              'graphics/Background Pattern@4x.png'))),
                  Positioned(
                      child: Image(
                    image: AssetImage('graphics/Ellipse 2.png'),
                    height: 140,
                  )),
                  // Positioned(
                  //     bottom: -12.0,
                  //     child: Text(
                  //       'Jack Johnson',
                  //       style: Theme.of(context).textTheme.headline4?.copyWith(
                  //           fontWeight: FontWeight.w600, color: Colors.black),
                  //     ))
                ]),
                Text(
                  'Jack Johnson',
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      fontWeight: FontWeight.w600, color: Colors.black),
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocBuilder<UpcomingVisitPageCubit, UpcomingVisitPageState>(
                  builder: (context, state) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          border: Border.all(color: Colors.grey)),
                      child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 12.0,top: 20.0),
                            child: Text('UpComing Visit',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Theme(
                            data: ThemeData(dividerColor: Colors.transparent).copyWith(primaryColor: DefaultTheme.primaryColor),
                            child: ExpansionTile(

                              onExpansionChanged: (value) {
                                cubit.isExpanded = !cubit.isExpanded;
                                BlocProvider.of<UpcomingVisitPageCubit>(context)
                                    .arrowTapped(value);
                              },
                              title: Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  // Text('UpComing Visit',style: TextStyle(fontSize: 24, color: Colors.black,fontWeight: FontWeight.bold)),
                                  Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Text(
                                      'Mon, Nov 25, 10:30 AM',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Text(
                                      'Established sick visit',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.grey),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Text(
                                      'Elissa Thomas, MD',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.grey),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Text(
                                      'Main Street Pediatrics',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.grey),
                                    ),
                                  ),
                                ],
                              )),
                              leading: const Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Icon(
                                  Icons.account_circle_rounded,
                                  size: 55,
                                ),
                              ),
                              trailing: Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: state is ExpandedState
                                    ? const Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 24,
                                      )
                                    : const Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 24,
                                      ),
                              ),
                              // controlAffinity: ListTileControlAffinity.values.first,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:27.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: Text(
                                          'Mon, Nov 25, 10:30 AM',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: Text(
                                          'Established sick visit',
                                          style: TextStyle(
                                              fontSize: 18, color: Colors.grey),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: Text(
                                          'Elissa Thomas, MD',
                                          style: TextStyle(
                                              fontSize: 18, color: Colors.grey),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: Text(
                                          'Main Street Pediatrics',
                                          style: TextStyle(
                                              fontSize: 18, color: Colors.grey),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: CustomButton(
                                buttonColor: DefaultTheme.primaryColor,
                                buttonText: "Check IN",
                                buttonTextColor: DefaultTheme.backgroundColor,
                                callBack: () {
                                  bottomNavBarCuit.pageIndex = 1;
                                  bottomNavBarCuit.isIconSelectedHome = false;
                                  bottomNavBarCuit.isIconSelectedCalender = true;
                                  bottomNavBarCuit.isIconSelectedMore = false;
                                  BlocProvider.of<BottomNavBarCubit>(context)
                                      .onTapOfNavButton(bottomNavBarCuit.pageIndex);
                                },
                                height: 50,
                                width: double.infinity),
                          )
                        ],
                      ),
                    );
                  },
                ),


              ],
            ),
          ),
        ));
  },
);
  }
}
