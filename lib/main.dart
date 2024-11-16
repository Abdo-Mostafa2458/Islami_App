import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Provider/AppConfigration.dart';
import 'package:islami_app/Widgets/Tabs/Hadeth/hadeth_widget.dart';
import 'package:islami_app/Widgets/Tabs/Quran/sura_quran.dart';
import 'package:islami_app/Widgets/home__screen.dart';
import 'package:islami_app/constants/app_routes.dart';
import 'package:provider/provider.dart';

import 'Style/AppTheme.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppLanguageNotifier(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // AppLanguage provider = Provider.of(context) as AppLanguage;
    var provider = Provider.of<AppLanguageNotifier>(context);
    return MaterialApp(
      title: "Islmai",
      debugShowCheckedModeBanner: false,
      // theme: provider.selectedTheme,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: provider.selectedTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.selectedLanguage),
      routes: {
        AppRoutes.homeScreen: (_) => HomeScreen(),
        AppRoutes.suraQuran: (_) => SuraQuran(),
        AppRoutes.hadethWidget: (_) => HadethWidget()
      },
    );
  }
}
