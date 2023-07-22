import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_game/common/custom_levelcard.dart';
import 'package:math_game/data/models/player.dart';
import 'package:provider/provider.dart';

import '../common/custom_button.dart';
import '../common/custom_icon_button.dart';
import '../common/custom_theme.dart';
import '../services/authentication/google_auth_service.dart';
import '../services/provider/player_provider.dart';

class LevelsPage extends StatelessWidget {
  const LevelsPage({super.key});



  @override
  Widget build(BuildContext context) {
    var usuario = FirebaseAuth.instance.currentUser!;
    var firstName = usuario.displayName!.split(" ").first; // Split and get the first name

    final playerProvider = Provider.of<PlayerProvider>(context);
    final stars= playerProvider.getStars();
    print(stars);
    //Lista de inteiros [0,1,2,3,4,5]
    //Index = Nível && Valor = Conteúdo;

    return Scaffold(
      backgroundColor: CustomTheme.Matthie,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 10,
        elevation: 0,
      ),
      // Body List
      body: Container(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Center(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.transparent,
                              width: 5,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Spacer(),
                              GestureDetector(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: Image.network(
                                    usuario.photoURL!,
                                    height: 60,
                                    width: 60,
                                  ),
                                ),
                                onTap: () {},
                              ),
                              SizedBox(width: 10),
                              Text(
                                firstName, // Use the first name here
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
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
                                  color: Colors.transparent,
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                        SizedBox(height: 50),
                        Container(
                          height: 470,
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: 20,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: CustomLevelCard(
                                    level: index+1,
                                    stars: index<stars.length?stars[index]:4,
                                    backcolor: index<stars.length?CustomTheme.PIECE:CustomTheme.levelOff,
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 15),
                        CustomIconButton(
                          icon: FontAwesomeIcons.arrowLeftLong,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
