import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Provider/AppConfigration.dart';
import 'package:islami_app/Style/AppColors.dart';
import 'package:islami_app/Style/AppTheme.dart';
import 'package:islami_app/Widgets/Tabs/Settings/settings.dart';
import 'package:islami_app/Widgets/defualt_screen.dart';
import 'package:islami_app/constants/get_path_image.dart';
import 'package:provider/provider.dart';

import 'Tabs/Hadeth/hadeth_tab.dart';
import 'Tabs/Quran/quran_tab.dart';
import 'Tabs/Radio/radio.dart';
import 'Tabs/Sebha/sebha.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    Radioo(),
    Settings()
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppLanguageNotifier>(context);
    return DefaultScreen(
      appTitle: AppLocalizations.of(context)!.app_title,
      body: tabs[currentIndex],
      customBottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: provider.selectedTheme == AppTheme.lightTheme
                ? Appcolors.primaryColor
                : Appcolors.darkPrimaryColor),
        child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(getPathImage("quran.png"))),
                label: AppLocalizations.of(context)!.quran_tab,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(getPathImage("hadeth_ic.png"))),
                label: AppLocalizations.of(context)!.hadeth_tab,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(getPathImage("sebha.png"))),
                label: AppLocalizations.of(context)!.sebha_tab,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(getPathImage("radio.png"))),
                label: AppLocalizations.of(context)!.radio_tab,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: AppLocalizations.of(context)!.settings_tab,
              ),
            ]),
      ),
    );
  }
}
