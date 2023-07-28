import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_game/common/custom_theme.dart';
import 'package:math_game/pages/states/game_header_state.dart';
import 'package:math_game/pages/states/game_state.dart';
import 'package:math_game/services/provider/stars_provider.dart';
import 'package:provider/provider.dart';

import '../services/provider/player_provider.dart';
import '../../services/provider/pause_provider.dart';




class GamePage extends StatelessWidget {
  const GamePage({super.key, this.gameLevel});

  final int? gameLevel;


  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    final playerProvider = Provider.of<PlayerProvider>(context);
    final level = gameLevel ?? playerProvider.getStars().length;
    return
      MultiProvider(providers:
   [
      ChangeNotifierProvider<StarsProvider>(
      create: (_) => StarsProvider(),
    ),
    ChangeNotifierProvider<GamePauseProvider>(
    create: (_) => GamePauseProvider(), // Adicione a inicialização do GamePauseProvider aqui
    ),
    ],
      child: Scaffold(
        backgroundColor: CustomTheme.Matthie,
        appBar: AppBar(
          toolbarHeight: 120,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: GameHeaderComponent(currentLevel: level),
          ),
        body: GameComponent(context: context, gameLevel: level),
      ),
    );
  }
}