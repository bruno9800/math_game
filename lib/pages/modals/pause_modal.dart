import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_game/common/custom_icon_button.dart';
import 'package:math_game/common/custom_theme.dart';
import 'package:math_game/services/provider/pause_provider.dart';
import 'package:math_game/services/provider/stars_provider.dart';
import 'package:provider/provider.dart';

class PauseModal extends StatelessWidget {
  final Function onRestart;

  PauseModal({required this.onRestart});

  @override
  Widget build(BuildContext context) {

    final pauseProvider = Provider.of<GamePauseProvider>(context);
    final starsProvider = Provider.of<StarsProvider>(context);

    return AlertDialog(
      actionsPadding: EdgeInsets.only(bottom: 32),
      titlePadding: EdgeInsets.only(top: 32),
      backgroundColor: CustomTheme.PIECE,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),
      title: Container(
        height: 32,
        color: CustomTheme.Matthie,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Jogo Pausado',style: GoogleFonts.mcLaren(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ))
          ],
        ),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
              child: Text("Deseja reiniciar?",style: GoogleFonts.mcLaren(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),textAlign: TextAlign.center,))
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
                pauseProvider.unpause();
                starsProvider.restart();
                //Navigator.of(context).pop(); // Fecha o modal
              },
              padding: 4,
            ),
          ],
        )
      ],
    );
  }
}