import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Provider/AppConfigration.dart';
import 'package:provider/provider.dart';

import '../../../Style/AppColors.dart';

class LocalizationThemeWidget extends StatefulWidget {
  const LocalizationThemeWidget({super.key});

  @override
  State<LocalizationThemeWidget> createState() =>
      _LocalizationLanguageWidgetState();
}

class _LocalizationLanguageWidgetState extends State<LocalizationThemeWidget> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppLanguageNotifier>(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: provider.selectedTheme == ThemeMode.light
              ? Colors.white
              : Appcolors.darkPrimaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              provider.changeAppTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: provider.selectedTheme == ThemeMode.light
                ? selectedItem(AppLocalizations.of(context)!.light)
                : unSelectedItem(AppLocalizations.of(context)!.light),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              provider.changeAppTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: provider.selectedTheme == ThemeMode.dark
                ? selectedItem(AppLocalizations.of(context)!.dark)
                : unSelectedItem(AppLocalizations.of(context)!.dark),
          ),
        ],
      ),
    );
  }

  Widget selectedItem(String Theme) {
    var provider = Provider.of<AppLanguageNotifier>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(Theme),
        Icon(
          Icons.check_outlined,
          color: provider.selectedTheme == ThemeMode.light
              ? Appcolors.primaryColor
              : Appcolors.goldenColor,
          size: 40,
        ),
      ],
    );
  }

  Widget unSelectedItem(String Theme) {
    var provider = Provider.of<AppLanguageNotifier>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(Theme),
        Icon(
          Icons.check_outlined,
          color: provider.selectedTheme == ThemeMode.light
              ? Colors.white
              : Appcolors.darkPrimaryColor,
          size: 40,
        ),
      ],
    );
  }
}
