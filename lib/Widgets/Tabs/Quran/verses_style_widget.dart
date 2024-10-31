import 'package:flutter/material.dart';

import '../../../Style/AppColors.dart';
import '../../../constants/numbers_list.dart';
import '../../../constants/quran_list.dart';

class VersesStyleWidget extends StatelessWidget {
  String text1;
  String text2;
  int index;

  VersesStyleWidget(
      {required this.text1,
      required this.text2,
      required this.index,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Text(
            argumentsQuran[index],
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 50,
          child: VerticalDivider(
            color: Appcolors.primaryColor,
            thickness: 3,
            width: 20, // Increase width to make the divider visible
          ),
        ),
        Expanded(
          child: Text(
            versesNumber[index].toString(),
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}