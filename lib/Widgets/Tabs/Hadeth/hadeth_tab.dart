import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/constants/app_routes.dart';

import '../../../Style/AppColors.dart';
import '../../../constants/get_path_image.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  final List<HadethData> alHadeth = [];

  @override
  Widget build(BuildContext context) {
    if (alHadeth.isEmpty) {
      loadHadethFile();
    }
    return Column(
      children: [
        Image.asset(
          getPathImage("hadith_header_image.png"),
        ),
        const Divider(
          color: Appcolors.primaryColor,
          thickness: 3,
          height: 4,
        ),
        Text(
          "Hadeth",
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const Divider(
          color: Appcolors.primaryColor,
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
                              arguments: alHadeth[index]);
                        },
                        child: Text(
                          alHadeth[index].title,
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ));
                  },
                  separatorBuilder: (context, index) => const Divider(
                        color: Appcolors.primaryColor,
                        thickness: 3,
                        height: 3,
                        indent: 50,
                        endIndent: 50,
                      ),
                  itemCount: 10),
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
      alHadeth.add(HadethData(title: title, content: hadethLines));
      setState(() {});
    }
  }
}

class HadethData {
  String title;
  List<String> content;

  HadethData({required this.title, required this.content});
}
