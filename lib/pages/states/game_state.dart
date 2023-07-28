import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_game/common/custom_icon_button.dart';
import 'package:math_game/common/custom_piece.dart';
import 'package:math_game/common/custom_theme.dart';
import 'package:math_game/data/repositories/firebase_repository_impl.dart';
import 'package:math_game/game_core/game.dart';
import 'package:math_game/game_core/piece.dart';
import 'package:math_game/pages/game_page.dart';
import 'package:math_game/pages/modals/over_modal.dart';
import 'package:math_game/pages/modals/pause_modal.dart';
import 'package:math_game/pages/modals/win_modal.dart';
import 'package:math_game/services/provider/audio_provider.dart';
import 'package:math_game/services/provider/player_provider.dart';
import 'package:math_game/services/provider/stars_provider.dart';
import 'package:math_game/utils/random_piece_color.dart';
import 'package:provider/provider.dart';

import '../../services/provider/pause_provider.dart';

class GameComponent extends StatefulWidget {
  GameComponent({super.key, required BuildContext context, required this.gameLevel});

  final int gameLevel;

  @override
  State<StatefulWidget> createState() {
    return GameState();
  }
}

class GameState extends State<GameComponent> {
  late Game game = Game(widget.gameLevel);
  final pieceColors = RandomPiecesColor(24);
  bool gameOver = false;
  int gameScore = 0;
  final List<Piece> gameOverList = [];

  bool handlePressedPiece(int actualResult, BuildContext context) {
    final audioProvider = Provider.of<AudioProvider>(context, listen: false);
    int quantity = 0;
    for (Piece piece in gameOverList) {
      if (piece.result == actualResult) {
        quantity++;
      }
    }
    print(quantity);
    if (quantity == 3) {
      audioProvider.playSuccess();
      setState(() {
        gameOverList.removeWhere((element) => element.result == actualResult);
        gameScore++;
      });
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final gamePauseProvider = Provider.of<GamePauseProvider>(context);
    final isGamePaused = gamePauseProvider.isPaused;
    final starsProvider = Provider.of<StarsProvider>(context);
    final playerProvider = Provider.of<PlayerProvider>(context);
    final colors = pieceColors.colors;

    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: AbsorbPointer(
                absorbing: isGamePaused,
                child: Opacity(
                  opacity: isGamePaused ? 0 : 1.0,
                  child: Container(
                    margin: const EdgeInsets.only(right: 8, left: 8, bottom: 8, top: 8),
                    decoration: BoxDecoration(
                      color: CustomTheme.BOX_BACK,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: GridView.builder(
                      padding: const EdgeInsets.all(8),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        mainAxisExtent: 72,
                      ),
                      itemCount: game.pieces.length,
                      itemBuilder: (context, index) {
                        final piece = game.pieces[index];

                        return CustomPiece(
                          expression: piece.expression,
                          isVisible: piece.isVisible,
                          color: colors[index],
                          onPressed: () {
                            setState(() {
                              pieceColors.update();
                            });
                            piece.setIsVisible(false);
                            setState(() {
                              gameOverList.add(piece);
                              if (gameOverList.length > 4) {
                                gameOver = handlePressedPiece(piece.result, context);
                                if (gameOver) {
                                  starsProvider.pause();
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false, // Impede que o modal seja fechado clicando fora dele
                                    builder: (BuildContext context) {
                                      return GameOverModal(
                                        onRestart: () {
                                          starsProvider.restart();
                                          setState(() {
                                            gameScore = 0;
                                            gameOver = false;
                                            game.restart();
                                            gameOverList.clear();
                                          });
                                        },
                                        onMenu: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  );
                                } else {
                                  handlePressedPiece(piece.result, context);
                                }
                              }
                              handlePressedPiece(piece.result, context);
                              if (gameScore == 8) {
                                playerProvider.updateStars(widget.gameLevel, starsProvider.stars);

                                starsProvider.pause();
                                showDialog(
                                  context: context,
                                  barrierDismissible: false, // Impede que o modal seja fechado clicando fora dele
                                  builder: (BuildContext context) {
                                    return GameWinModal(
                                      onRestart: () {
                                        starsProvider.restart();
                                        setState(() {
                                          gameScore = 0;
                                          gameOver = false;
                                          game.restart();
                                          gameOverList.clear();
                                        });
                                      },
                                      onMenu: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => GamePage(gameLevel: widget.gameLevel + 1))
                                        );
                                      },
                                      stars: starsProvider.stars,
                                    );
                                  },
                                );
                              }
                            });
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 100,
              margin: const EdgeInsets.only(right: 8, left: 8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: CustomTheme.BOX_BACK,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  width: 2,
                  color: const Color(0xff250902),
                  style: BorderStyle.solid,
                ),
              ),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 72,
                ),
                itemCount: gameOverList.length,
                itemBuilder: (context, index) {
                  final piece = gameOverList[index];
                  return CustomPiece(
                    isVisible: true,
                    color: colors[index],
                    expression: piece.expression,
                    onPressed: () {},
                  );
                },
              ),
            ),
            SizedBox(height: 85,),
          ],
        ),
        if (isGamePaused)
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black.withOpacity(0.7),
              child: PauseModal(
                  onRestart: () {
                    starsProvider.restart();
                    setState(() {
                      gameScore = 0;
                      gameOver = false;
                      game.restart();
                      gameOverList.clear();
                    });
                  }
              ),
            ),
          ),
      ],
    );
  }
}
