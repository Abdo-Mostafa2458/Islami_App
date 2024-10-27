import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/Style/AppColors.dart';
import 'package:islami_app/Widgets/Tabs/Quran/item_sura.dart';
import 'package:islami_app/Widgets/defualt_screen.dart';

import '../../../data/quran_data.dart';

class SuraQuran extends StatefulWidget {
  const SuraQuran({super.key});

  @override
  State<SuraQuran> createState() => _SuraQuranState();
}

class _SuraQuranState extends State<SuraQuran> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    QuranData quranData =
        ModalRoute.of(context)?.settings.arguments as QuranData;
    if (verses.isEmpty) {
      loadFile(quranData.indexOfSura);
    }
    return DefaultScreen(
      appTitle: quranData.ayaName,
      body: verses.isEmpty
          ? Center(
              heightFactor: 15,
              child: const CircularProgressIndicator(
                color: Appcolors.primaryColor,
              ),
            )
          : Card(
              margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.04,
                horizontal: MediaQuery.of(context).size.width * 0.04,
              ),
              elevation: 5,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 2),
                      child: Column(
                        children: [
                          Text(
                            quranData.ayaName,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.08),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Divider(
                            color: Appcolors.primaryColor,
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
                            ayaTitle: quranData.ayaName,
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
