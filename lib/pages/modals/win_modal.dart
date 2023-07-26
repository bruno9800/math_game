// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_game/common/custom_icon_button.dart';
import 'package:math_game/common/custom_theme.dart';
import 'package:math_game/pages/states/stars_state.dart';

class GameWinModal extends StatelessWidget {
  final Function onRestart;
  final Function onMenu;
  final int stars;

  GameWinModal({required this.onRestart, required this.onMenu, required this.stars});

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      backgroundColor: CustomTheme.BOX_BACK,
      titlePadding: EdgeInsets.only(top: 32, bottom: 16),
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: EdgeInsets.only(bottom: 32),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      title: Container(
        height: 32,
        color: CustomTheme.BLUE,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('PARABENS!')
          ],
        ),
      ),
      content: StarsComponent(fillStars: stars, size: 32),
      actions: <Widget>[
        CustomIconButton(
          icon: FontAwesomeIcons.rotate,
          onPressed: () {
            onRestart();
            Navigator.of(context).pop(); // Fecha o modal
          },
          padding: 4,
        ),
        SizedBox(
          width: 32,
        ),
        CustomIconButton(
          icon: FontAwesomeIcons.arrowRight,
          padding: 4,
          onPressed: () {
            onMenu();
            Navigator.of(context).pop(); // Fecha o modal
          },
        ),
      ],
    );
  }
}