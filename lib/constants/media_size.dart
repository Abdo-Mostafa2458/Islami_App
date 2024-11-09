import 'package:flutter/material.dart';

double getHeightSize(context, double size) {
  double height = MediaQuery.of(context).size.height * size;
  return height;
}

double getWidthSize(context, double size) {
  double width = MediaQuery.of(context).size.width * size;
  return width;
}
