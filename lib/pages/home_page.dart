// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_game/common/custom_button.dart';
import 'package:math_game/data/models/player.dart';
import 'package:math_game/data/repositories/firebase_repository_impl.dart';
import 'package:math_game/pages/config_page.dart';
import 'package:math_game/pages/game_page.dart';
import 'package:math_game/pages/list_page.dart';
import 'package:math_game/services/authentication/google_auth_service.dart';
import '../common/custom_theme.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final usuario = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.BackColor,
      body: Padding(
        child: Center(
          child: Column(children: [
            SizedBox(height: 22),
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
              color: CustomTheme.RED,
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
              color: CustomTheme.RED,
              label: 'LISTA',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListPage()),
                );
              },
            )
          ]),
        ),
        padding: EdgeInsets.all(15.0),
      ),
    );
  }
}
