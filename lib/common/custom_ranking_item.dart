import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_theme.dart';

class CustomRankingItem extends StatelessWidget {
  const CustomRankingItem(
  //nome e posição(numero) e pontuação(número)
          {Key? key,
        this.color = CustomTheme.ForeColor,
        required this.position,
        required this.name,
        required this.points,
      })
      : super(key: key);
  final Color? color;
  final String position;
  final String name;
  final String points;



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      padding: EdgeInsets.all(15),
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.transparent,
          width: 5,
          style:BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(20),
        color: CustomTheme.Button,
      ),
      child: Row(
        children:[
          Text(position,
              style:
              GoogleFonts.lilitaOne(
                fontSize: 30,
                color: CustomTheme.Matthie,
                fontWeight: FontWeight.bold,
              )
          ),
          SizedBox(width: 10),
          Text(name,
              style:
              GoogleFonts.robotoMono(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              )
          ),
          SizedBox(width: 100),
          Text(points,
              style:
              GoogleFonts.lilitaOne(
                fontSize: 40,
                color: Colors.white70,
                fontWeight: FontWeight.bold,
              )
          ),
        ],
      ),
    );
  }
}