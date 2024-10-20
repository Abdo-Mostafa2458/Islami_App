import 'package:flutter/material.dart';

import '../constants/get_path_image.dart';

class DefaultScreen extends StatelessWidget {
  String appTitle;
  Widget? body;

  DefaultScreen({this.body, this.appTitle = ""});

  @override
  Widget build(BuildContext context) {
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
              appTitle,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          body: body,
        )
      ],
    );
  }
}
