import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_game/common/custom_icon_button.dart';
import 'package:math_game/common/custom_theme.dart';

class SumPage extends StatelessWidget {

  const SumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.Matthie,
      body:Center(
        child: Column(
          children: [
            SizedBox(height: 28),
            CustomIconButton(
            icon: FontAwesomeIcons.check,
            onPressed: (){
            Navigator.pop(context);}
            ),
          ],
        ),
      ),
    );
  }
}
/*
*Padding(
        padding: EdgeInsets.all(15.0),
         child: Center(
            child: Container(
                child: CustomIconButton(
                    icon: FontAwesomeIcons.check,
                    onPressed: (){
                      Navigator.pop(context);
                    }
                ),
              ),
            ) ,
      ),*/
