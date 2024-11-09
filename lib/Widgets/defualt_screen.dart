import 'package:flutter/material.dart';
import 'package:islami_app/Provider/AppConfigration.dart';
import 'package:islami_app/Style/AppTheme.dart';
import 'package:provider/provider.dart';

import '../constants/get_path_image.dart';

class DefaultScreen extends StatelessWidget {
  String appTitle;
  Widget? body;
  Widget? customBottomNavigationBar;

  DefaultScreen(
      {this.body, this.customBottomNavigationBar, this.appTitle = ""});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppLanguageNotifier>(context);
    return Stack(
      children: [
        Image.asset(
          provider.selectedTheme == AppTheme.lightTheme
              ? getPathImage("main_background.png")
              : getPathImage("main_background_dark.png"),
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              appTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          body: body,
          bottomNavigationBar: customBottomNavigationBar,
        )
      ],
    );
  }
}
