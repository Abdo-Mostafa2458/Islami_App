import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Provider/AppConfigration.dart';
import 'package:islami_app/Style/AppColors.dart';
import 'package:islami_app/Widgets/Tabs/Settings/localization_language_widget.dart';
import 'package:provider/provider.dart';

import '../../../Style/AppTheme.dart';
import 'localization_theme_widget.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppLanguageNotifier>(context);
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.language),
          InkWell(
            onTap: () {
              dropMenuLanguage();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                      color: provider.selectedTheme == AppTheme.lightTheme
                          ? Appcolors.primaryColor
                          : Appcolors.goldenColor,
                      width: 3)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.selectedLanguage == 'en'
                      ? AppLocalizations.of(context)!.english
                      : AppLocalizations.of(context)!.arabic),
                  Icon(
                    Icons.arrow_drop_down,
                    color: provider.selectedTheme == AppTheme.lightTheme
                        ? Colors.black
                        : Colors.white,
                  )
                ],
              ),
            ),
          ),
          Text(AppLocalizations.of(context)!.theme),
          InkWell(
            onTap: () {
              dropMenuTheme();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                      color: provider.selectedTheme == AppTheme.lightTheme
                          ? Appcolors.primaryColor
                          : Appcolors.goldenColor,
                      width: 3)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.selectedTheme == AppTheme.lightTheme
                      ? AppLocalizations.of(context)!.light
                      : AppLocalizations.of(context)!.dark),
                  Icon(
                    Icons.arrow_drop_down,
                    color: provider.selectedTheme == AppTheme.lightTheme
                        ? Colors.black
                        : Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void dropMenuLanguage() {
    showModalBottomSheet(
      context: context,
      builder: (context) => LocalizationLanguageWidget(),
    );
  }

  void dropMenuTheme() {
    showModalBottomSheet(
      context: context,
      builder: (context) => LocalizationThemeWidget(),
    );
  }
// void dropMenuTheme() {
//   showModalBottomSheet(
//     context: context,
//     builder: (context) => Container(
//       width: double.infinity,
//       padding: EdgeInsets.all(20),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(topLeft: Radius.circular(24),topRight: Radius.circular(24))
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           InkWell(
//             onTap: () {
//               setState(() {
//                 selectedTheme = "Light";
//               });
//               Navigator.pop(context);
//             },
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Icon(Icons.check_outlined,color: selectedTheme == "Light" ? Appcolors.primaryColor: Colors.white,size: 40,),
//                 Text("English"),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           InkWell(
//             onTap: () {
//               setState(() {
//                 selectedTheme = "dark";
//               });
//               Navigator.pop(context);
//             },
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Icon(Icons.check_outlined,color: selectedTheme=="dark" ? Appcolors.primaryColor : Colors.white,size: 40,),
//                 Text("Arabic"),
//               ],
//             ),
//           ),
//
//         ],
//       ),
//     ),
//   );
// }
}
/*
* Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(24),topRight: Radius.circular(24))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  selectedLanguage = "English";
                });
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.check_outlined,color: selectedLanguage=="English" ? Appcolors.primaryColor: Colors.white,size: 40,),
                  Text("English"),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  selectedLanguage = "Arabic";
                });
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.check_outlined,color: selectedLanguage=="Arabic" ? Appcolors.primaryColor : Colors.white,size: 40,),
                  Text("Arabic"),
                ],
              ),
            ),

          ],
        ),
      )*/
