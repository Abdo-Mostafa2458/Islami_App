import 'package:flutter/material.dart';
import 'package:islami_app/Style/AppTheme.dart';
import 'package:islami_app/Widgets/Tabs/Quran/sura_quran.dart';
import 'package:islami_app/constants/app_routes.dart';
import 'package:islami_app/home__screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islami App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routes: {
        AppRoutes.homeScreen: (_) => const HomeScreen(),
        AppRoutes.suraQuran: (_) => SuraQuran()
      },
    );
  }
}
