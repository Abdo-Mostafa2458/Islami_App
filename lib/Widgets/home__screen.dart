import 'package:flutter/material.dart';
import 'package:islami_app/Style/AppColors.dart';
import 'package:islami_app/Widgets/defualt_screen.dart';
import 'package:islami_app/constants/get_path_image.dart';

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
    Sebha(),
    Radioo(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      appTitle: "Islami",
      body: tabs[currentIndex],
      customBottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Appcolors.primaryColor),
        child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(getPathImage("quran.png"))),
                label: "Quran",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(getPathImage("hadeth_ic.png"))),
                label: "Hadeth",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(getPathImage("sebha.png"))),
                label: "Sebha",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(getPathImage("radio.png"))),
                label: "Radio",
              )
            ]),
      ),
    );
  }
}
