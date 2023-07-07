import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_game/common/custom_icon_button.dart';
import 'package:math_game/common/custom_theme.dart';

import '../common/custom_button.dart';
import 'config_page.dart';
import 'game_page.dart';
import 'list_page.dart';

class LearningPage extends StatelessWidget {
  const LearningPage({super.key});

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
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Column(children: [
            SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
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
            ),
            SizedBox(height: 60),
            CustomButton(
              color: CustomTheme.RED,
              label: 'APRENDER',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LearningPage()),
                );
                print('entrou');
              },
            ),
          ]),
        ),
      ),
    );
  }

}