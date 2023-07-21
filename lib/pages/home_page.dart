// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_game/common/custom_button.dart';
import 'package:math_game/pages/config_page.dart';
import 'package:math_game/pages/game_page.dart';
import 'package:math_game/pages/list_page.dart';
import 'package:math_game/pages/rankingalternative_page.dart';
import 'package:math_game/services/authentication/google_auth_service.dart';
import '../common/custom_icon_button.dart';
import '../common/custom_theme.dart';
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
                            height: 40, width: 40),
                      ),
                      onTap: () {
                        AuthService().signOut();
                      }),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                        color: CustomTheme.BLUE,
                        icon: Icon(Icons.settings_outlined),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ConfigPage()),);
                        }),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              SizedBox(height: 60),
              Text('Matthie.',
                  style: TextStyle(
                      fontSize: 73,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 3
                        ..color = Colors.white)),
              SizedBox(height: 60),
              CustomButton(
                color: CustomTheme.Button,
                label: 'JOGAR',
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
                label: 'LISTA',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ListPage()),
                  );
                },
              ),
              SizedBox(height: 16),
              CustomButton(
                color: CustomTheme.Button,
                label: 'APRENDER',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LearningPage()),
                  );
                  print('entrou');
                },
              ),
              SizedBox(height: 16),
              CustomButton(
                color: CustomTheme.Button,
                label: 'RANKING',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RankingAlternativePage()),
                  );
                  print('entrou');
                },
              ),
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
