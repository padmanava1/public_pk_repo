import 'package:breaking_bad_practise/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

import 'make_my_trip_colors.dart';

///add more theme data here as per your need also add separate class for dark theme
class BreakingBadTheme {
  BreakingBadTheme._();

  static ThemeData lightTheme = ThemeData(
      indicatorColor: Colors.green,
    cardColor: Colors.green[100],
      backgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        color: MakeMyTripColors.colorGreen,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.white),
        foregroundColor: Colors.black,
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      textTheme: TextTheme(headline4: AppTextStyles.labelStyleLight),
      scaffoldBackgroundColor: Colors.white,
      drawerTheme: DrawerThemeData(
        scrimColor: Colors.transparent,
        backgroundColor: Colors.green[800],
      ),
      tabBarTheme: const TabBarTheme(
        //indicator: ,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Colors.white,
        unselectedLabelStyle: AppTextStyles.unselectedLabelStyle,
      ),
      dialogBackgroundColor: Colors.green[100],
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: AppTextStyles.hintTextStyle,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.green,
          elevation: 2,
          selectedItemColor: Colors.green[50],
          selectedIconTheme: IconThemeData(color: Colors.green),
          unselectedIconTheme: IconThemeData(color: Colors.white)),
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: Colors.green[100]));

  static ThemeData darkTheme = ThemeData(
    indicatorColor: Colors.green,
    cardColor: Colors.grey,
      backgroundColor: Colors.grey,
      iconTheme: const IconThemeData(color: Colors.white),
      appBarTheme: const AppBarTheme(
        color: MakeMyTripColors.colorBlack,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.white),
        foregroundColor: Colors.black54,
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      dialogBackgroundColor: Colors.blueGrey[200],
      scaffoldBackgroundColor: Colors.black45,
      textTheme: const TextTheme(headline4: AppTextStyles.labelStyleDark),
      drawerTheme: const DrawerThemeData(
        scrimColor: Colors.transparent,
        backgroundColor: Colors.black,
      ),
      tabBarTheme: const TabBarTheme(
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelStyle: AppTextStyles.unselectedLabelStyle,
      ),
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: AppTextStyles.hintTextStyle,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(),
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.blueGrey[200]));
}
