import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_game/common/custom_icon_button.dart';
import 'package:math_game/common/custom_theme.dart';
import 'package:math_game/pages/states/game_state.dart';
import 'package:math_game/pages/states/stars_state.dart';
import 'package:math_game/services/provider/player_provider.dart';
import 'package:math_game/services/provider/stars_provider.dart';
import 'package:provider/provider.dart';
import 'dart:async'; //Biblioteca Assincrona


// Criar evento de pausar o timer;
Widget buildTitle({
  required String title,
  required BuildContext context,
  required int elapsedSeconds,
  required bool isPaused,
  required VoidCallback togglePause,
})

{
  final starsProvider = Provider.of<StarsProvider>(context);

  final playerProvider = Provider.of<PlayerProvider>(context);
  final currentLevel = playerProvider.getStars().last + 1; // o primeiro indice da Lista é 0 e o de níveis é 1;

  starsProvider.setStars(_getStarRating(elapsedSeconds));

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CustomIconButton(
        icon: isPaused?FontAwesomeIcons.play : FontAwesomeIcons.pause,
        onPressed: () {
          togglePause();
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
          const SizedBox(height: 10,),
          StarsComponent(fillStars: starsProvider.getStars()),
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
}

//Contador De Estrelas Por Tempo
int _getStarRating(int elapsedSeconds) {
  const int rapido = 90; // Replace with the desired time for 3 stars
  const int medio = 120; // Replace with the desired time for 2 stars

  if (elapsedSeconds <= rapido) {
    return 3;
  } else if (elapsedSeconds <= medio) {
    return 2;
  } else {
    return 1;
  }
}


class GamePage extends StatefulWidget {
  const GamePage({super.key,required this.currentLevel});
  final int currentLevel;

//Implementação de Código Para Função Timer e Pause ----
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int _elapsedSeconds = 0;
  late Timer _timer;
  bool _isPaused = false;
  int _lastElapsedSeconds = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer if it exists
    super.dispose();
  }

  void _startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      if (!_isPaused) {
        setState(() {
          _elapsedSeconds =
              _lastElapsedSeconds + timer.tick; // Modify this line
        });
      }
    });
  }

  void _togglePause() {
    setState(() {
      _isPaused = !_isPaused;
      if (_isPaused) {
        _timer?.cancel(); // Pause the timer by canceling it
      } else {
        _lastElapsedSeconds =
            _elapsedSeconds; // Add this line to store the previous elapsed time
        _startTimer(); // Resume the timer by starting it again
      }
    });
  }

//Implementação de Código Acima Para Função Timer e Pause ----

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
          title: buildTitle(
            title: 'Level 5',
            context: context,
            elapsedSeconds: _elapsedSeconds,
            isPaused: _isPaused,
            togglePause: _togglePause,
          ),
        ),
        body: GameComponent(context: context),
      ),
    );
  }
}