import 'package:flutter/material.dart';
import 'package:math_game/pages/states/stars_state.dart';

class GameWinModal extends StatelessWidget {
  final Function onRestart;
  final Function onMenu;
  final int stars;

  GameWinModal({required this.onRestart, required this.onMenu, required this.stars});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Parabéns!'),
      content: StarsComponent(fillStars: stars),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            onRestart();
            Navigator.of(context).pop(); // Fecha o modal
          },
          child: Text('Recomeçar'),
        ),
        TextButton(
          onPressed: () {
            onMenu();
            Navigator.of(context).pop(); // Fecha o modal
          },
          child: Text('Menu'),
        ),
      ],
    );
  }
}