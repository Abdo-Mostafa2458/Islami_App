import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Provider/AppConfigration.dart';
import 'package:islami_app/Style/AppColors.dart';
import 'package:islami_app/Widgets/Tabs/Quran/verses_style_widget.dart';
import 'package:islami_app/constants/app_routes.dart';
import 'package:islami_app/constants/get_path_image.dart';
import 'package:provider/provider.dart';

import '../../../constants/numbers_list.dart';
import '../../../constants/quran_list.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppLanguageNotifier>(context);
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Image.asset(
            getPathImage("quran_header_icn.png"),
          ),
        ),
        Divider(
          color: provider.selectedTheme == ThemeMode.light
              ? Appcolors.primaryColor
              : Appcolors.goldenColor,
          thickness: 3,
          height: 3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Text(
                AppLocalizations.of(context)!.verses_Name,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 50, // Set the desired height for the divider
              child: VerticalDivider(
                color: provider.selectedTheme == ThemeMode.light
                    ? Appcolors.primaryColor
                    : Appcolors.goldenColor,
                thickness: 3,
                width: 20, // Increase width to make the divider visible
              ),
            ),
            Expanded(
              child: Text(
                AppLocalizations.of(context)!.verses_Number,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Divider(
          color: provider.selectedTheme == ThemeMode.light
              ? Appcolors.primaryColor
              : Appcolors.goldenColor,
          thickness: 3,
          height: 3,
        ),
        Expanded(
          flex: 2,
          child: ListView.separated(
            key: const PageStorageKey<String>("page"),
            shrinkWrap: true,
            physics: const RangeMaintainingScrollPhysics(),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.suraQuran, arguments:
                    // QuranData(
                    //     ayaName: argumentsQuran[index], indexOfSura: index)
                    {"ayaName": argumentsQuran[index], "indexOfSura": index});
              },
              child: VersesStyleWidget(
                  text1: argumentsQuran[index],
                  text2: versesNumber[index].toString(),
                  index: index),
            ),
            separatorBuilder: (context, index) => Divider(
              color: provider.selectedTheme == ThemeMode.light
                  ? Appcolors.primaryColor
                  : Appcolors.goldenColor,
              thickness: 3,
              height: 3,
              indent: 25,
              endIndent: 25,
            ),
            itemCount: argumentsQuran.length,
          ),
        )
      ],
    );
  }
}
// Quran Data class