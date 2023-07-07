import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_game/common/custom_icon_button.dart';
import 'package:math_game/common/custom_theme.dart';
import 'package:math_game/pages/divide_page.dart';
import 'package:math_game/pages/multiply_page.dart';
import 'package:math_game/pages/subtract_page.dart';
import 'package:math_game/pages/sum_page.dart';

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
          child: Container(
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
            child: Column(children: [
              SizedBox(height: 30),
              CustomButton(
                color: CustomTheme.Button,
                label: 'Soma',
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SumPage()),
                  );
                },
              ),
              SizedBox(height: 16),
              CustomButton(
                color: CustomTheme.Button,
                label: 'Substração',
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SubtractPage()),
                  );
                },
              ),
              SizedBox(height: 16),
              CustomButton(
                color: CustomTheme.Button,
                label: 'Multiplicação',
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MultiplyPage()),
                  );
                },
              ),
              SizedBox(height: 16),
              CustomButton(
                color: CustomTheme.Button,
                label: 'Divisão',
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DividePage()),
                  );
                },
              ),
              SizedBox(height: 16),
              CustomButton(
                color: CustomTheme.Button,
                label: 'Jogo',
                onPressed: null,
              ),
              SizedBox(height: 60),
              CustomIconButton(
                  icon: FontAwesomeIcons.chevronLeft,
                  onPressed: (){
                    Navigator.pop(context);
                  }
              )
            ]),
          ),
        ),
      ),
    );
  }

}