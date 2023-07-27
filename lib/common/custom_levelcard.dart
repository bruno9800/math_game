import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/game_page.dart';
import '../pages/states/stars_state.dart';

class CustomLevelCard extends StatelessWidget {
  const CustomLevelCard({
    Key? key,
    required this.level,
    required this.stars,
    this.backcolor = Colors.white,
  }) : super(key: key);

  final Color backcolor;
  final int level;
  final int stars;

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        child:Container(
        height: 290,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backcolor, // Replace with desired color
      ),
          child: Center(
            child: Align(
              child: Column(
              children: [
                Text(
                level.toString(),
                style: GoogleFonts.mcLaren(
                  fontSize: 32,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
                stars < 4 ? StarsComponent(fillStars: stars)
                  : SizedBox(),
            ],
          ),
        ),
      ),
    ),
        onTap: (){
          //index=level
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const GamePage()),
          );
        },
    );
  }
}
