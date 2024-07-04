import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warehouse/constants/my_colors.dart';
import 'package:warehouse/main.dart';

class MyThemes {
  static ThemeData dartTheme = ThemeData(
      colorScheme: ColorScheme.fromSwatch(
          primarySwatch: getMaterialColor(myColor: mainColorBlack),
          backgroundColor: Colors.white),
      scaffoldBackgroundColor: Colors.white,
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          fixedSize: const Size(double.infinity, 45),
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      fontFamily: 'Merriweather',
      appBarTheme: AppBarTheme(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: getMaterialColor(myColor: mainColorBlack),
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        centerTitle: true,
        color: getMaterialColor(myColor: mainColorBlack),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'Merriweather',
        ),
      ));

  static ThemeData deepTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: getMaterialColor(myColor: mainColorOrange),
        backgroundColor: Colors.white),
    scaffoldBackgroundColor: Colors.white,
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        fixedSize: const Size(double.infinity, 45),
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
    fontFamily: 'Merriweather',
    appBarTheme: AppBarTheme(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: getMaterialColor(myColor: mainColorOrange),
        statusBarIconBrightness: Brightness.light, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      centerTitle: true,
      color: getMaterialColor(myColor: mainColorOrange),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: 'Merriweather',
      ),
    ),
  );
}
