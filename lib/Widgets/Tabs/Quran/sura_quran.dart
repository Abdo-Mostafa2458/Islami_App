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
                padding: const EdgeInsets.only(top: 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Divider(
                          color: Appcolors.primaryColor,
                          thickness: 3,
                          height: 20,
                          // Adjust the height as needed
                          indent: 70,
                          endIndent: 70,
                        ),
                        Container(
                          color: Colors.white,
                          // Background to cover divider behind text
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            quranData.ayaName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Appcolors.primaryColor,
                            ),
                          ),
                        ),
                      ],
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
