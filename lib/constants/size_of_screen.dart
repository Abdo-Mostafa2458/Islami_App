import 'package:flutter/material.dart';

double getHeightSize(BuildContext context, double size) {
  return MediaQuery.sizeOf(context).height * size;
}

double getWidthSize(BuildContext context, double size) {
  return MediaQuery.sizeOf(context).width * size;
}
