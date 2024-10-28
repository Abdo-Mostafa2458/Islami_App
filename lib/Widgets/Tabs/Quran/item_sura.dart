import 'package:flutter/material.dart';
import 'package:islami_app/constants/get_path_image.dart';

import '../../../Style/AppColors.dart';

class ItemSura extends StatelessWidget {
  String verses;
  String ayaTitle;
  int indexOfAya;
   ItemSura(
      {required this.verses,
      required this.indexOfAya,
      required this.ayaTitle,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    getPathImage("sperator_mark.png"),
                    width: 50,
                    height: 50,
                  ),
                  Text(
                    "${indexOfAya + 1}",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 16),
                  ),
                ],
              ),
              Expanded(
                  child: Text(
                "${verses}",
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              )),
            ],
          ),
        ),
        Divider(
          color: Appcolors.primaryColor,
          thickness: 3,
          height: 3,
        )
      ],
    );
  }
}
// return Expanded(child: Text("${versesAya}($indexOfSura)",textDirection: TextDirection.rtl,style: Theme.of(context).textTheme.bodySmall,));
