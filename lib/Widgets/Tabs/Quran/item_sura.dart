import 'package:flutter/material.dart';
import 'package:islami_app/Provider/AppConfigration.dart';
import 'package:islami_app/constants/get_path_image.dart';
import 'package:provider/provider.dart';

import '../../../Style/AppColors.dart';
import '../../../Style/AppTheme.dart';

class ItemSura extends StatelessWidget {
  final String verses;
  final String ayaTitle;
  final int indexOfAya;

  const ItemSura(
      {required this.verses,
      required this.indexOfAya,
      required this.ayaTitle,
      super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppLanguageNotifier>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            textDirection: provider.selectedLanguage == 'en'
                ? TextDirection.ltr
                : TextDirection.ltr,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    getPathImage("sperator_mark.png"),
                    width: 50,
                    height: 50,
                    color: provider.selectedTheme == AppTheme.lightTheme
                        ? Colors.black
                        : Colors.white,
                  ),
                  Text(
                    "${indexOfAya + 1}",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 16,
                        color: provider.selectedTheme == AppTheme.lightTheme
                            ? Colors.black
                            : Colors.white),
                  ),
                ],
              ),
              Expanded(
                  child: Text(
                verses,
                textDirection: provider.selectedLanguage == 'en'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                style: provider.selectedTheme == AppTheme.lightTheme
                    ? Theme.of(context).textTheme.bodySmall
                    : Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Appcolors.goldenColor),
                textAlign: TextAlign.center,
              )),
            ],
          ),
        ),
        Divider(
          color: provider.selectedTheme == AppTheme.lightTheme
              ? Appcolors.primaryColor
              : Colors.white,
          thickness: 3,
          height: 3,
        )
      ],
    );
  }
}
// return Expanded(child: Text("${versesAya}($indexOfSura)",textDirection: TextDirection.rtl,style: Theme.of(context).textTheme.bodySmall,));
