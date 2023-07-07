import 'dart:math';

import 'package:flutter/material.dart';

class RandomPieceColor {
  List<Color> shadowColor = [
    const Color(0xff00c2ff), // blue
    const Color(0xffe53935), // red
    const Color(0xffffca43), // yellow
    const Color(0xff3abc6e), // green
  ];

  Color get() {
    final random = Random();
    final randomIndex = random.nextInt(shadowColor.length);
    return shadowColor[randomIndex];
  }

}
