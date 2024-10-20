import 'package:flutter/material.dart';
import 'package:islami_app/constants/AppColors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      canvasColor: Appcolors.primaryColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          iconTheme: IconThemeData(size: 28, color: Colors.black)),
      textTheme: TextTheme(
          titleMedium: TextStyle(
              color: Colors.black, fontSize: 32, fontWeight: FontWeight.w700),
          bodyMedium: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
          bodySmall: TextStyle(
              color: Colors.black, fontSize: 28, fontWeight: FontWeight.w400)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Appcolors.primaryColor,
          selectedItemColor: Colors.black,
          selectedIconTheme: IconThemeData(size: 40),
          selectedLabelStyle: TextStyle(color: Colors.black),
          unselectedItemColor: Colors.white,
          unselectedIconTheme: IconThemeData(color: Colors.white, size: 32),
          showUnselectedLabels: false));
}
