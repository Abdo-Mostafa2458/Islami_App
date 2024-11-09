import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/Provider/AppConfigration.dart';
import 'package:islami_app/Style/AppColors.dart';
import 'package:islami_app/Style/AppTheme.dart';
import 'package:islami_app/Widgets/Tabs/Quran/item_sura.dart';
import 'package:islami_app/Widgets/defualt_screen.dart';
import 'package:islami_app/constants/media_size.dart';
import 'package:provider/provider.dart';

class SuraQuran extends StatefulWidget {
  const SuraQuran({super.key});

  @override
  State<SuraQuran> createState() => _SuraQuranState();
}

class _SuraQuranState extends State<SuraQuran> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppLanguageNotifier>(context);
    // QuranData quranData =
    //     ModalRoute.of(context)?.settings.arguments as QuranData;
    Map<String, dynamic> quranData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    // if (verses.isEmpty) {
    //   loadFile(quranData.indexOfSura);
    // }
    if (verses.isEmpty) {
      loadFile(quranData["indexOfSura"]);
    }
    return DefaultScreen(
      // appTitle: quranData.ayaName,
      // appTitle: quranData["ayaName"],
      appTitle: "Islami",
      body: verses.isEmpty
          ? const Center(
        heightFactor: 15,
        child: CircularProgressIndicator(
          color: Appcolors.primaryColor,
        ),
      )
          : Card(
        margin: EdgeInsets.symmetric(
                vertical: getHeightSize(context, 0.04),
                horizontal: getWidthSize(context, 0.04),
              ),
              elevation: 5,
              color: provider.selectedTheme == AppTheme.lightTheme
                  ? Colors.white
                  : Appcolors.darkPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: getWidthSize(context, 0.100),
                    vertical: getWidthSize(context, 0.0001)),
                child: Column(
                  children: [
                    Text(
                            quranData["ayaName"],
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize: getWidthSize(context, 0.08),
                                    color: provider.selectedTheme ==
                                            AppTheme.lightTheme
                                        ? Colors.black
                                        : Colors.white),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Divider(
                            color: provider.selectedTheme == AppTheme.lightTheme
                                ? Appcolors.primaryColor
                                : Colors.white,
                            thickness: 3,
                            height: 1, // Minimize divider height
                          )
                        ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ItemSura(
                      verses: verses[index],
                      indexOfAya: index,
                      ayaTitle: quranData["ayaName"],
                    );
                  },
                  itemCount: verses.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.trim().split("\n");
    verses = lines;
    setState(() {});
  }
}
