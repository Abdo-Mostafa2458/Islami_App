import 'package:flutter/material.dart';
import 'package:islami_app/constants/media_size.dart';

import '../../../Style/AppColors.dart';
import '../../defualt_screen.dart';

class HadethWidget extends StatelessWidget {
  const HadethWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // HadethData hadeth =
    //     ModalRoute.of(context)?.settings.arguments as HadethData;
    Map<String, dynamic> hadeth =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return DefaultScreen(
      appTitle: "Islami",
      body: Card(
        margin: EdgeInsets.symmetric(
          vertical: getHeightSize(context, 0.04),
          horizontal: getWidthSize(context, 0.04),
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
              Column(
                children: [
                  Text(
                    // hadeth.title,
                    hadeth["title"],
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: MediaQuery.of(context).size.width * 0.07),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Divider(
                    color: Appcolors.primaryColor,
                    thickness: 3,
                    height: 1,
                    indent: 35,
                    endIndent: 35,
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemBuilder: (context, index) => Text(
                    // hadeth.content[index],
                    hadeth["content"][index],
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: getWidthSize(context, 0.05)),
                    textDirection: TextDirection.rtl,
                  ),
                  itemCount: hadeth["content"].length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
