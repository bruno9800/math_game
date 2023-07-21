import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_game/utils/random_piece_color.dart';
import 'custom_theme.dart';

class CustomLevelCard extends StatelessWidget {
  const CustomLevelCard(
      {Key? key,
        required this.level,
        required this.stars,
         this.backcolor=Colors.white,
      })
      : super(key: key);
  final Color backcolor;
  final int level;
  final int stars;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white, // Replace with desired color
      ),
      child:
      Center(
        child: Align(
          child:
          Text(level.toString(),
            style: GoogleFonts.mcLaren(
              fontSize: 32,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}