// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_game/pages/states/stars_state.dart';
import 'package:math_game/services/provider/stars_provider.dart';
import 'package:provider/provider.dart';

import '../../common/custom_icon_button.dart';
import '../../common/custom_theme.dart';
import '../../services/provider/player_provider.dart';
import '../../services/provider/pause_provider.dart';

class GameHeaderComponent extends StatelessWidget {
  const GameHeaderComponent({super.key,required this.currentLevel});
  final int currentLevel;
  @override
  Widget build(BuildContext context) {
    return Consumer<StarsProvider>(
      builder: (context, starsProvider, _) {
        final elapsedSeconds = starsProvider.elapsedSeconds;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomIconButton(
              icon: starsProvider.isRunning
                  ? FontAwesomeIcons.pause
                  : FontAwesomeIcons.play,
              onPressed: () {
                if (starsProvider.isRunning) {
                  starsProvider.pause();
                  Provider.of<GamePauseProvider>(context, listen: false)
                      .setPaused(true); // Notifique o GamePauseProvider sobre a alteração do estado de pausa
                } else {
                  starsProvider.unpause();
                  Provider.of<GamePauseProvider>(context, listen: false)
                      .setPaused(false); // Notifique o GamePauseProvider sobre a alteração do estado de pausa
                }
                print('pause/play');
              },
            ),
            Spacer(),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 22, right: 22, top: 4, bottom: 4),
                  decoration: BoxDecoration(
                    color: CustomTheme.ForeColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'nível $currentLevel',
                    style: GoogleFonts.mcLaren(
                      fontSize: 18,
                      color: CustomTheme.Black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                StarsComponent(fillStars: starsProvider.stars),
                //Mostrar Tempo
                Text(
                  '$elapsedSeconds seg.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Spacer(),
            CustomIconButton(
              icon: FontAwesomeIcons.house,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
