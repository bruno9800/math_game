import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_game/common/custom_icon_button.dart';
import 'package:math_game/common/custom_theme.dart';
import 'package:math_game/pages/divide_page.dart';
import 'package:math_game/pages/multiply_page.dart';
import 'package:math_game/pages/subtract_page.dart';
import 'package:math_game/pages/sum_page.dart';

import 'package:google_fonts/google_fonts.dart';

import '../common/custom_button.dart';
import '../common/custom_ranking_item.dart';
import 'config_page.dart';
import 'game_page.dart';
import 'list_page.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: CustomTheme.Matthie,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 90,
        elevation: 0,
      ),
      //Body List
      body: Center(
        child:Column(
          children: [
              Container(
                width: 300,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.transparent,
                    width: 5,
                    style:BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: CustomTheme.BackgroundColor,
                ),
                child:
                Row(
                  children:[
                    CustomIconButton(
                      icon: FontAwesomeIcons.person,
                      onPressed: (null),
                    ),
                    SizedBox(width: 10),
                    Column(
                        children: [
                          SizedBox(height: 10),
                          Text("Ricardo",
                              style:
                              GoogleFonts.robotoMono(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                              )),
                          SizedBox(height: 20),
                          Container(
                            width: 60,
                            height: 30,
                            decoration: BoxDecoration(

                              border: Border.all(
                              color: Colors.black,
                              width: 5,
                              style:BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black,
                          ),
                            child:
                            Center(
                              child:
                              Text('Ouro',
                                  style:
                                  GoogleFonts.robotoMono(
                                  fontSize: 16,
                                  color: Colors.yellowAccent,
                                    fontWeight: FontWeight.bold,
                                   )
                                  ),
                              ),
                            ),
                        ],
                    ),
                    SizedBox(width: 15),
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.transparent,
                            width: 5,
                            style:BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: CustomTheme.BackgroundColor,
                        ),
                      child: Text("1° Lugar",
                        style:
                        GoogleFonts.lilitaOne(
                          fontSize: 25,
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: 300,
                decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.transparent,
                  width: 5,
                  style:BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(20),
                color: CustomTheme.BackgroundColor,
              ),
                child: Column(
                  children:[
                    Text("Rank Geral",
                      style: TextStyle(fontSize: 16)),
                    Column(
                      children:[
                        SizedBox(height: 5),
                        CustomRankingItem(position: '1°', name: 'Thiago',points: '10'),
                        SizedBox(height: 5),
                        CustomRankingItem(position: '2°', name: 'Bruno',points: '8'),
                        SizedBox(height: 5),
                        CustomRankingItem(position: '3°', name: 'Alan',points: '5')
                      ]
                    )
                  ]
                )
              ),

          ],
        ),
        ),
    );
  }

}