import 'package:flutter/material.dart';
import 'package:tunexa/decorations/colors.dart';

BorderRadius defaultRadius = BorderRadius.circular(15);
BoxShadow shadow = BoxShadow(
  color: whiteColor,
  blurRadius: 30,
  spreadRadius: 10,
);
EdgeInsets defaultPadding = const EdgeInsets.all(10);

BoxDecoration giveDecoration(Color color, Color shadow) {
  return BoxDecoration(color: color, borderRadius: defaultRadius, boxShadow: [
    BoxShadow(
      color: shadow,
      blurRadius: 20,
      spreadRadius: 15,
    ),
  ]);
}

double kPadding = 25;
