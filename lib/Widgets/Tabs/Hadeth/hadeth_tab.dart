import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Provider/AppConfigration.dart';
import 'package:islami_app/constants/app_routes.dart';
import 'package:provider/provider.dart';

import '../../../Style/AppColors.dart';
import '../../../constants/get_path_image.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  // final List<HadethData> alHadeth = [];
  final List<Map<String, dynamic>> alHadeth = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppLanguageNotifier>(context);
    if (alHadeth.isEmpty) {
      loadHadethFile();
    }
    return Column(
      children: [
        Image.asset(
          getPathImage("hadith_header_image.png"),
        ),
        Divider(
          color: provider.selectedTheme == ThemeMode.light
              ? Appcolors.primaryColor
              : Appcolors.goldenColor,
          thickness: 3,
          height: 4,
        ),
        Text(
          AppLocalizations.of(context)!.alHadeth,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        Divider(
          color: provider.selectedTheme == ThemeMode.light
              ? Appcolors.primaryColor
              : Appcolors.goldenColor,
          thickness: 3,
          height: 4,
        ),
        Expanded(
          child: alHadeth.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Appcolors.primaryColor,
                  ),
                )
              : ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.hadethWidget,
                          // arguments: alHadeth[index]
                          arguments: {
                            // "alHadeth" : alHadeth[index]
                            "title": alHadeth[index]["title"],
                                "content": alHadeth[index]["content"]
                              });
                        },
                        child: Text(
                          // alHadeth[index].title,
                          alHadeth[index]["title"] ?? "",
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ));
                  },
                  separatorBuilder: (context, index) => Divider(
                    color: provider.selectedTheme == ThemeMode.light
                            ? Appcolors.primaryColor
                            : Appcolors.goldenColor,
                        thickness: 3,
                        height: 3,
                        indent: 50,
                        endIndent: 50,
                      ),
                  itemCount: alHadeth.length),
        )
      ],
    );
  }

  void loadHadethFile() async {
    String fileContent =
        await rootBundle.loadString("assets/files/ahadeth.txt", cache: true);
    List<String> allHadeth = fileContent.trim().split('#');
    for (int i = 0; i < allHadeth.length; i++) {
      List<String> hadethLines = allHadeth[i].trim().split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      hadethLines.join("\n");
      // alHadeth hadeth =HadethData(title: title, content: hadethLines);
      // allHadeth.add(hadeth);
      // alHadeth.add(HadethData(title: title, content: hadethLines));
      alHadeth.add({"title": title, "content": hadethLines});
      setState(() {});
    }
  }
}

// class HadethData {
//   String title;
//   List<String> content;
//
//   HadethData({required this.title, required this.content});
// }
