import 'package:flutter/material.dart';

class GameOverModal extends StatelessWidget {
  final Function onRestart;
  final Function onMenu;

  GameOverModal({required this.onRestart, required this.onMenu});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Você perdeu!'),
      content: Text('Deseja recomeçar ou voltar para o menu?'),
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