import 'package:flutter/material.dart';
import 'package:islami_app/constants/AppColors.dart';
import 'package:islami_app/constants/app_routes.dart';
import 'package:islami_app/constants/get_path_image.dart';

import '../data/quran_data.dart';

class Quran extends StatelessWidget {
  final List<String> argumentsQuran = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  Quran({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Image.asset(
            getPathImage("quran_header_icn.png"),
          ),
        ),
        const Divider(
          color: Appcolors.primaryColor,
          thickness: 3,
          height: 3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Aya Name",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        const Divider(
          color: Appcolors.primaryColor,
          thickness: 3,
          height: 3,
        ),
        Expanded(
          flex: 2,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.suraQuran,
                          arguments: QuranData(
                              ayaName: argumentsQuran[index],
                              indexOfSura: index));
                    },
                    child: Text(
                      argumentsQuran[index],
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ));
              },
              separatorBuilder: (context, index) => const Divider(
                    color: Appcolors.primaryColor,
                    thickness: 3,
                    height: 3,
                    indent: 25,
                    endIndent: 25,
                  ),
              itemCount: argumentsQuran.length),
        )
      ],
    );
  }
}
