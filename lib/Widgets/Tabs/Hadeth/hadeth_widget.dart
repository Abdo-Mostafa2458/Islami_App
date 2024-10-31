import 'package:flutter/material.dart';
import 'package:islami_app/Widgets/Tabs/Hadeth/hadeth_tab.dart';

import '../../../Style/AppColors.dart';
import '../../defualt_screen.dart';

class HadethWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HadethData hadeth =
        ModalRoute.of(context)?.settings.arguments as HadethData;
    return DefaultScreen(
      appTitle: "Islami",
      body:
          // verses.isEmpty
          //     ? Center(
          //   heightFactor: 15,
          //   child: const CircularProgressIndicator(
          //     color: Appcolors.primaryColor,
          //   ),
          // )
          //     :
          Card(
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
              Column(
                children: [
                  Text(
                    hadeth.title,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: MediaQuery.of(context).size.width * 0.07),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Divider(
                    color: Appcolors.primaryColor,
                    thickness: 3,
                    height: 1,
                    indent: MediaQuery.of(context).size.width * 0.07,
                    endIndent: MediaQuery.of(context).size.width * 0.07,
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(5),
                  itemBuilder: (context, index) => Text(
                    hadeth.content[index],
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 22),
                    textDirection: TextDirection.rtl,
                  ),
                  itemCount: hadeth.content.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
