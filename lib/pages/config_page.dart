

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_game/common/custom_theme.dart';
import 'package:math_game/pages/states/game_volume_state.dart';
import 'package:math_game/pages/states/music_volume_state.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.BackColor,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: CustomTheme.BOX_BACK,
              borderRadius: BorderRadius.circular(8),

          ),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(left: 22, right: 22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32,),
              const Padding(
                padding: EdgeInsets.only(left: 22),
                child: Text('Música', style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                ),
                ),
              ),
              const MusicVolumeComponent(),
              const Padding(
                padding: EdgeInsets.only(left: 22),
                child: Text('Jogo', style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
                ),
              ),
              const GameVolumeComponent(),
              const SizedBox(height: 68),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: CustomTheme.ForeColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 2),
                          blurRadius: 2.0,
                          color: Colors.black.withOpacity(0.4),
                        )
                      ],
                    ),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(FontAwesomeIcons.chevronLeft)),
                  )
                ],
              ),
              const SizedBox(height: 60,),
            ],
          ),
        )
      ),
    );
  }
}