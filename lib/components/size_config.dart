import 'package:flutter/material.dart';

//call  at homeScreen with build
late double screenWidth;
late double screenHeight;
late double hPlanck;
late double vPlanck;
late double radius;
late double statusBarHeight;

sizeConfigInit({required context}) {
  Size size = MediaQuery.of(context).size;
  screenHeight = size.height;
  screenWidth = size.width;
  hPlanck = (screenWidth / 70).roundToDouble();
  vPlanck = (screenHeight / 70).roundToDouble();
  radius = (screenWidth / 30).roundToDouble();
  statusBarHeight = MediaQuery.of(context).viewPadding.top;
}
