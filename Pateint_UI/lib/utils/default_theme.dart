import 'package:flutter/material.dart';

class DefaultTheme {
  bool isDark;

  DefaultTheme({required this.isDark});

  ThemeData get themeData {
    TextTheme textTheme =
        (isDark ? ThemeData.dark() : ThemeData.light()).textTheme;

    ColorScheme scheme = ColorScheme(
        primary: primaryColor,
        primaryVariant: primaryColor,
        secondary: secondaryColor,
        secondaryVariant: secondaryColor,
        surface: backgroundColor,
        background: backgroundColor,
        error: errorColor,
        onPrimary: backgroundColor,
        onSecondary: backgroundColor,
        onSurface: textColor,
        onBackground: textColor,
        onError: backgroundColor,
        brightness: isDark ? Brightness.dark : Brightness.light);

    return ThemeData.from(colorScheme: scheme, textTheme: textTheme).copyWith(
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: textColor),
          bodyText2: TextStyle(color: textColor),
          caption: TextStyle(color: textColor),
          overline: TextStyle(color: textColor),
          subtitle1: TextStyle(color: textColor),
          subtitle2: TextStyle(color: textColor),
          headline1: TextStyle(color: textHeadlineColor),
          headline2: TextStyle(color: textHeadlineColor),
          headline3: TextStyle(color: textHeadlineColor),
          headline4: TextStyle(color: textHeadlineColor),
          headline5:
              TextStyle(color: textHeadlineColor, fontWeight: FontWeight.bold),
          headline6: TextStyle(color: textHeadlineColor),
        ),
        appBarTheme: const AppBarTheme(elevation: 0),
        inputDecorationTheme: InputDecorationTheme(
            labelStyle: const TextStyle(color: textColor),
            floatingLabelStyle: const TextStyle(color: primaryColor),
            prefixStyle: const TextStyle(color: textColor),
            suffixStyle: const TextStyle(color: textColor),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: inputBorderWidth, color: inputBorderColor),
                borderRadius: BorderRadius.circular(inputRadius)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: inputBorderWidth, color: inputBorderColor),
                borderRadius: BorderRadius.circular(inputRadius))),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                shadowColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(
                    vertical: buttonVerticalPadding,
                    horizontal: buttonHorizontalPadding),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(buttonRadius)))),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: buttonVerticalPadding,
                    horizontal: buttonHorizontalPadding),
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(buttonRadius)))),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(buttonRadius)))));
  }

  static ThemeData light() {
    return DefaultTheme(isDark: false).themeData;
  }

  static ThemeData dark() {
    return DefaultTheme(isDark: true).themeData;
  }

  static const backgroundColor = Colors.white;
  static const primaryColor = Color(0xff007acc);
  static const secondaryColor = Color(0xffe46954);
  static const textColor = Color(0xff5a7481);
  static const textHeadlineColor = Color(0xff263238);
  static const inputBorderColor = Color(0xffdce3e8);
  static const errorColor = Color(0xffc31c47);
  static const backColor = Color(0xffeceff1);

  static const buttonRadius = 100.0;
  static const inputRadius = 4.0;
  static const inputBorderWidth = 1.0;
  static const buttonVerticalPadding = 20.0;
  static const buttonHorizontalPadding = 12.0;
}
