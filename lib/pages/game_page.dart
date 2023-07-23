import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_game/common/custom_theme.dart';
import 'package:math_game/pages/states/game_header_state.dart';
import 'package:math_game/pages/states/game_state.dart';
import 'package:math_game/services/provider/stars_provider.dart';
import 'package:provider/provider.dart';




class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return ChangeNotifierProvider<StarsProvider>(
      create: (_) => StarsProvider(),
      child: Scaffold(
        backgroundColor: CustomTheme.Matthie,
        appBar: AppBar(
          toolbarHeight: 120,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: GameHeaderComponent(),
          ),
        body: GameComponent(context: context),
      ),
    );
  }
}