import 'dart:math';

import 'package:flutter/material.dart';

class RandomPiecesColor {
  List<Color> shadowColor = [
    const Color(0xff00c2ff), // blue
    const Color(0xffe53935), // red
    const Color(0xffffca43), // yellow
    const Color(0xff3abc6e), // green
  ];

  List<Color>? _colors;
  final int _size;

  List<Color> get colors => _colors!;

  RandomPiecesColor(this._size) {
    _colors = List.generate(_size, (index) => _get());
  }


  update() {
    _colors = List.generate(_size, (index) => _get());
  }

  Color _get() {
    final random = Random();
    final randomIndex = random.nextInt(shadowColor.length);
    return shadowColor[randomIndex];
  }

}
