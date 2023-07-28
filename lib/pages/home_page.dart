// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_game/common/custom_button.dart';
import 'package:math_game/pages/config_page.dart';
import 'package:math_game/pages/game_page.dart';
import 'package:math_game/pages/list_page.dart';
import 'package:math_game/pages/profile_page.dart';
import 'package:math_game/pages/ranking_page.dart';
import '../common/custom_icon_button.dart';
import '../common/custom_theme.dart';
import 'about_page.dart';
import 'learning_page.dart';
import 'levels_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final usuario = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: CustomTheme.Matthie,
      body: Container(
        width: double.infinity,
        height: 1000,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('BackgroundMatthie.png'),
              fit: BoxFit.cover),
        ),
        child: Padding(
          child: Center(
            child: Column(children: [
              SizedBox(height: 30),
              Row(
                children: [
                  GestureDetector(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image.network(usuario.photoURL!,
                            height: 60, width: 60),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()),);
                      }),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      iconSize: 45,
                        color: CustomTheme.Black,
                        icon: Icon(Icons.settings_outlined),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ConfigPage()),);
                        }),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              SizedBox(height: 10),
              Image.asset('matthie_home.png', fit: BoxFit.cover),
              SizedBox(height: 30),
              CustomButton(
                color: CustomTheme.Button,
                label: 'Jogar',
                onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GamePage()),
                  );
                  print('entrou');
                },
              ),
              SizedBox(height: 16),
              CustomButton(
                color: CustomTheme.Button,
                label: 'Sobre',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutPage()),
                  );
                },
              ),
              SizedBox(height: 16),
              CustomButton(
                color: CustomTheme.Button,
                label: 'Aprender',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LearningPage()),
                  );
                  print('entrou');
                },
              ),
              SizedBox(height: 16),
              SizedBox(height: 100),
              CustomIconButton(
                  icon: FontAwesomeIcons.listOl,
                  onPressed: (){
                    Navigator.push(
                        context,
                    MaterialPageRoute(builder: (context) => const LevelsPage()),
                    );
                  }
              )

            ]),
          ),
          padding: EdgeInsets.all(15.0),
        ),
      ),
    );
  }
}
