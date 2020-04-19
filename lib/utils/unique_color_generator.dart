import 'dart:math';
import 'package:flutter/material.dart';

Color uniqueColorGenerator() {
  final List<Color> colors = [
    Color(0xFF5e97f6),
    Color(0xFFaed581),
    Color(0xFF90a4ae),
    Color(0xFF4db6ac),
    Color(0xFFff8a65),
    Color(0xFF7986cb)
  ];

  Random random = new Random();
  int randomNumber = random.nextInt(colors.length);
  return colors[randomNumber];
}
