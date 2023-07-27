import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_game/common/custom_icon_button.dart';
import 'package:math_game/common/custom_theme.dart';

class GameOverModal extends StatelessWidget {
  final Function onRestart;
  final Function onMenu;

  GameOverModal({required this.onRestart, required this.onMenu});

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      actionsPadding: EdgeInsets.only(bottom: 32),
      titlePadding: EdgeInsets.only(top: 32),
      backgroundColor: CustomTheme.PIECE,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),
      title: Container(
        height: 32,
        color: CustomTheme.BLUE,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Você perdeu')
          ],
        ),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Quer tentar mais uma vez?'),
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              icon: FontAwesomeIcons.house,
              onPressed: () {
                onMenu();
                Navigator.of(context).pop(); // Fecha o modal
              },
              padding: 4,
            ),
          ],
        )
      ],
    );
  }
}