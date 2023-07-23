import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_game/pages/states/stars_state.dart';
import 'package:math_game/services/provider/stars_provider.dart';
import 'package:provider/provider.dart';

import '../../common/custom_icon_button.dart';
import '../../common/custom_theme.dart';
import '../../services/provider/player_provider.dart';
import '../../utils/timer_control.dart';

class GameHeaderComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<StarsProvider>(
      builder: (context, starsProvider, _) {
        final elapsedSeconds = starsProvider.elapsedSeconds;
        final currentLevel = Provider.of<PlayerProvider>(context).getStars().last + 1;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomIconButton(
              icon: starsProvider.isRunning ? FontAwesomeIcons.pause : FontAwesomeIcons.play,
              onPressed: () {
                if (starsProvider.isRunning) {
                  starsProvider.pause();
                } else {
                  starsProvider.unpause();
                }
                print('pause/play');
              },
            ),
            SizedBox(width: 48,),
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
                  'Tempo: $elapsedSeconds segundos',
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
