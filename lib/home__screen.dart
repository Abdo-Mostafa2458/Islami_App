import 'package:flutter/material.dart';
import 'package:islami_app/Style/AppColors.dart';
import 'package:islami_app/constants/get_path_image.dart';

import 'Widgets/Tabs/Hadeth/hadeth.dart';
import 'Widgets/Tabs/Quran/quran.dart';
import 'Widgets/Tabs/Radio/radio.dart';
import 'Widgets/Tabs/Sebha/sebha.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> tabs = [
    Quran(),
    Hadeth(),
    Sebha(),
    Radioo(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          getPathImage("main_background.png"),
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              "Islami",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          body: tabs[currentIndex],
          bottomNavigationBar: Theme(
            data:
                Theme.of(context).copyWith(canvasColor: Appcolors.primaryColor),
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
        )
      ],
    );
  }
}