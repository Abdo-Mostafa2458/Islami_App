import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Provider/AppConfigration.dart';
import 'package:islami_app/Style/AppTheme.dart';
import 'package:provider/provider.dart';

import '../../../Style/AppColors.dart';

class LocalizationLanguageWidget extends StatefulWidget {
  const LocalizationLanguageWidget({super.key});

  @override
  State<LocalizationLanguageWidget> createState() =>
      _LocalizationLanguageWidgetState();
}

class _LocalizationLanguageWidgetState
    extends State<LocalizationLanguageWidget> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppLanguageNotifier>(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: provider.selectedTheme == AppTheme.lightTheme
              ? Colors.white
              : Appcolors.darkPrimaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage('en');
              Navigator.pop(context);
            },
            child: provider.selectedLanguage == 'en'
                ? selectedItem(AppLocalizations.of(context)!.english)
                : unSelectedItem(AppLocalizations.of(context)!.english),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage('ar');
              Navigator.pop(context);
            },
            child: provider.selectedLanguage == 'ar'
                ? selectedItem(AppLocalizations.of(context)!.arabic)
                : unSelectedItem(AppLocalizations.of(context)!.arabic),
          ),
        ],
      ),
    );
  }

  Widget selectedItem(String language) {
    var provider = Provider.of<AppLanguageNotifier>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(language),
        Icon(
          Icons.check_outlined,
          color: provider.selectedTheme == AppTheme.lightTheme
              ? Appcolors.primaryColor
              : Appcolors.goldenColor,
          size: 40,
        ),
      ],
    );
  }

  Widget unSelectedItem(String language) {
    var provider = Provider.of<AppLanguageNotifier>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(language),
        Icon(
          Icons.check_outlined,
          color: provider.selectedTheme == AppTheme.lightTheme
              ? Colors.white
              : Appcolors.darkPrimaryColor,
          size: 40,
        ),
      ],
    );
  }
}
