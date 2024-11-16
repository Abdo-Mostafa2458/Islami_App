import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Provider/AppConfigration.dart';
import 'package:islami_app/Style/AppColors.dart';
import 'package:islami_app/constants/get_path_image.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double turns = 0.0;
  int index = 0;
  List<String> azkaar = [
    'سبحان الله',
    'الحمد لله',
    'الله اكبر',
    'لا اله الا الله',
    'لا حول ولا قوه الا بالله',
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppLanguageNotifier>(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 42, top: 15),
                      child: provider.selectedTheme == ThemeMode.light
                          ? Image.asset(getPathImage("head of seb7a_light.png"))
                          : Image.asset(
                              getPathImage("head of seb7a_light.png"),
                              color: Appcolors.goldenColor,
                            )),
                  Container(
                      margin: const EdgeInsets.only(top: 55),
                      child: InkWell(
                          onTap: () {
                            onTap();
                          },
                          child: AnimatedRotation(
                              turns: turns,
                              duration: const Duration(milliseconds: 200),
                              child: provider.selectedTheme ==
                                  ThemeMode.light
                                  ? Image.asset(
                                      getPathImage("body of seb7a_light.png"))
                                  : Image.asset(
                                      getPathImage("body of seb7a_light.png"),
                                      color: Appcolors.goldenColor,
                                    )))),
                ],
              ),
            ),
            Text(
              AppLocalizations.of(context)!.number_of_praises,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: provider.selectedTheme == ThemeMode.light
                      ? Colors.black
                      : Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                width: 75,
                height: 75,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: provider.selectedTheme == ThemeMode.light
                      ? Appcolors.buttonColor
                      : Appcolors.darkPrimaryColor,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Text(
                  "$counter",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: provider.selectedTheme == ThemeMode.light
                          ? Colors.black
                          : Colors.white),
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
                height: 50,
                padding:
                const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                decoration: BoxDecoration(
                  color: provider.selectedTheme == ThemeMode.light
                      ? Appcolors.primaryColor
                      : Appcolors.goldenColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  azkaar[index],
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: provider.selectedTheme == ThemeMode.light
                          ? Colors.white
                          : Colors.black),
                  textAlign: TextAlign.center,
                )),
            const Spacer(),
          ],
        ),
      ],
    );
  }

  void onTap() {
    // counter == 33 ? counter = 0 : counter++;
    if (counter == 32) {
      index++;
      if (index == azkaar.length) {
        index = 0;
      }
      // index==Azkaar.length-1 ? index=0:index++;
      counter = 0;
    } else {
      counter++;
    }
    //another syntax
    // counter++;
    // if(counter%33==0){
    //   index++;
    //   counter++;
    //   counter=0;
    // }
    // if(index==Azkaar.length){
    //   index=0;
    // }
    setState(() {
      turns += 0.10;
    });
  }
}
