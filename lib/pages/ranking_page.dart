// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_game/common/custom_icon_button.dart';
import 'package:math_game/common/custom_theme.dart';

import 'package:google_fonts/google_fonts.dart';

import '../common/custom_ranking_item.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var usuario = FirebaseAuth.instance.currentUser!;
    var firstName = usuario.displayName!.split(" ").first; // Split and get the first name

    return Scaffold(
      backgroundColor: CustomTheme.Matthie,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 10,
        elevation: 0,
      ),
      //Body List
      body: Center(
        child: Column(
          children: [
            Container(
              width: 330,
              height: 100,
              child: Row(
                children: [
                  CustomIconButton(
                    icon: FontAwesomeIcons.user,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Spacer(),
                  CustomIconButton(
                    icon: FontAwesomeIcons.house,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: 350,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.transparent,
                  width: 5,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(20),
                color: CustomTheme.BackgroundColor,
              ),
              child: Row(
                children: [
                  Spacer(),
                  GestureDetector(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image.network(usuario.photoURL!, height: 60, width: 60),
                    ),
                    onTap: () {},
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        firstName, // Use the first name here
                        style: GoogleFonts.nunitoSans(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 5,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black,
                        ),
                        child: Center(
                          child: Text(
                            'Ouro',
                            style: GoogleFonts.nunitoSans(
                              fontSize: 18,
                              color: Colors.yellowAccent,
                              fontWeight: FontWeight.bold,
                            ),
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
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: CustomTheme.BackgroundColor,
                    ),
                    child: Text(
                      "1° Lugar",
                      style: GoogleFonts.nunitoSans(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
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
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(20),
                color: CustomTheme.BackgroundColor,
              ),
              child: Column(children: [
                Text(
                  'Ranking',
                  style: GoogleFonts.mcLaren(
                    fontSize: 32,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(children: [
                  SizedBox(height: 5),
                  CustomRankingItem(position: '1°', name: 'Thiago', points: '10'),
                  SizedBox(height: 5),
                  CustomRankingItem(position: '2°', name: 'Bruno', points: '8'),
                  SizedBox(height: 5),
                  CustomRankingItem(position: '3°', name: 'Alan', points: '5'),
                  SizedBox(height: 15),
                ])
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
