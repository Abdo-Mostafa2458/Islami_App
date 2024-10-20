import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/constants/AppColors.dart';
import 'package:islami_app/constants/get_path_image.dart';

import '../data/quran_data.dart';

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
    return Stack(
      children: [
        Image.asset(
          getPathImage("main_background.png"),
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              quranData.ayaName,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          body: verses.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Appcolors.primaryColor,
                ))
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return Text(verses[index]);
                  },
                  itemCount: verses.length,
                ),
        )
      ],
    );
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split("\n");
    verses = lines;
    setState(() {});
  }
}
