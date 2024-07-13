import 'package:flutter/material.dart';

class ColorsClass {
  Color reddishColor = const Color(0xffFF7F7D);
  Color darkColor = const Color(0xff2A2A2A);
  Color ratingColor = const Color(0xffFFC657);
  Color lightGreyColor = const Color(0XFF2a2a2a);

  List<Color> loadingGradient = [
    Colors.grey.withOpacity(1),
    Colors.grey,
  ];
}

ColorsClass get colorsClass => ColorsClass();
