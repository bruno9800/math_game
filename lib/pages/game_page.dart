import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_game/common/custom_icon_button.dart';
import 'package:math_game/common/custom_theme.dart';
import 'package:math_game/pages/states/game_state.dart';
import 'package:math_game/pages/states/stars_state.dart';
import 'package:math_game/services/provider/player_provider.dart';
import 'package:provider/provider.dart';

// Criar evento de pausar o timer;
Widget buildTitle({required String title, required BuildContext context}) {
  final playerProvider = Provider.of<PlayerProvider>(context);
  final currentLevel = playerProvider.getStars().last + 1; // o primeiro indice da Lista é 0 e o de níveis é 1;

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CustomIconButton(
        icon: FontAwesomeIcons.pause,
        onPressed: () {
          print('click');
        },
      ),
      SizedBox(width: 48,),
      Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 22, right: 22, top: 4, bottom: 4),
            decoration: BoxDecoration(
                color: CustomTheme.ForeColor,
                borderRadius: BorderRadius.circular(16)
            ),
            child: Text(
                'nível $currentLevel',
                  style:
                  GoogleFonts.mcLaren(
                    fontSize: 18,
                    color: CustomTheme.Black,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
          ),
          const SizedBox(height: 12,),
          StarsComponent(fillStars: 3),
        ],
      ),
      const SizedBox(width: 48,),
      CustomIconButton(
        icon: FontAwesomeIcons.house,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ],
  );

}


class GamePage extends StatelessWidget {
  const GamePage({super.key,required this.currentLevel});
  final int currentLevel;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    // TODO: implement build
    return Scaffold(
      backgroundColor: CustomTheme.Matthie,
      appBar: AppBar(
        toolbarHeight: 120,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: buildTitle(title: 'Level 5', context: context),
        ),
      body: GameComponent(context: context),
    );
  }

}
