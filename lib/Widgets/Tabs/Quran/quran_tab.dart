import 'package:flutter/material.dart';
import 'package:islami_app/Style/AppColors.dart';
import 'package:islami_app/Widgets/Tabs/Quran/verses_style_widget.dart';
import 'package:islami_app/constants/app_routes.dart';
import 'package:islami_app/constants/get_path_image.dart';

import '../../../constants/numbers_list.dart';
import '../../../constants/quran_list.dart';
import '../../../data/quran_data.dart';

class QuranTab extends StatelessWidget {
  QuranTab({super.key});

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
            Expanded(
              child: Text(
                "Verses Name",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 50, // Set the desired height for the divider
              child: VerticalDivider(
                color: Appcolors.primaryColor,
                thickness: 3,
                width: 20, // Increase width to make the divider visible
              ),
            ),
            Expanded(
              child: Text(
                "Verses Number",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 25),
                textAlign: TextAlign.center,
              ),
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
            shrinkWrap: true,
            physics: const RangeMaintainingScrollPhysics(),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.suraQuran,
                    arguments: QuranData(
                        ayaName: argumentsQuran[index], indexOfSura: index));
              },
              child: VersesStyleWidget(
                  text1: argumentsQuran[index],
                  text2: versesNumber[index].toString(),
                  index: index),
                ),
            separatorBuilder: (context, index) => const Divider(
              color: Appcolors.primaryColor,
              thickness: 3,
              height: 3,
              indent: 25,
              endIndent: 25,
            ),
            itemCount: argumentsQuran.length,
          ),
        )
      ],
    );
  }
}
