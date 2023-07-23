import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_game/common/custom_icon_button.dart';
import 'package:math_game/common/custom_piece.dart';
import 'package:math_game/common/custom_theme.dart';
import 'package:math_game/game_core/game.dart';
import 'package:math_game/game_core/piece.dart';
import 'package:math_game/pages/modals/over_modal.dart';
import 'package:math_game/pages/modals/win_modal.dart';
import 'package:math_game/services/provider/stars_provider.dart';
import 'package:provider/provider.dart';

class GameComponent extends StatefulWidget {
  const GameComponent({super.key, required BuildContext context});

  @override
  State<StatefulWidget> createState() {
    return GameState();
  }

}

class GameState extends State<GameComponent> {

  final Game game = Game(1);
  bool gameOver = false;
  int gameScore = 0;
  final List<Piece> gameOverList = [];

  bool handlePressedPiece(int actualResult) {
    int quantity = 0;
    for(Piece piece in gameOverList) {
      if(piece.result == actualResult) {
        quantity++;
      }
    }
    print(quantity);
    if(quantity == 3 ) {
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
    //final starsProvider = Provider.of<StarsProvider>(context);
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
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
                        mainAxisExtent: 72
                    ),
                    itemCount: game.pieces.length,
                    itemBuilder: (context, index) {
                      final piece = game.pieces[index];

                      return CustomPiece(
                        expression: piece.expression,
                        isVisible: piece.isVisible,
                        onPressed: () {
                          piece.setIsVisible(false);
                          setState(() {
                            gameOverList.add(piece);
                            if(gameOverList.length > 4) {
                                gameOver = handlePressedPiece(piece.result);
                                print("não foi game over");
                                if(gameOver) {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false, // Impede que o modal seja fechado clicando fora dele
                                    builder: (BuildContext context) {
                                      return GameOverModal(onRestart: () {
                                        setState(() {
                                          gameScore = 0;
                                          gameOver = false;
                                          game.restart();
                                          gameOverList.clear();
                                        });
                                      }
                                        , onMenu: (){
                                          Navigator.pop(context);
                                        },);
                                  },
                                );

                            } else {
                              handlePressedPiece(piece.result);
                            }
                            }
                            handlePressedPiece(piece.result);
                            if(gameScore == 8) {
                              showDialog(
                                context: context,
                                barrierDismissible: false, // Impede que o modal seja fechado clicando fora dele
                                builder: (BuildContext context) {
                                  return GameWinModal(onRestart: () {
                                    setState(() {
                                      gameScore = 0;
                                      gameOver = false;
                                      game.restart();
                                      gameOverList.clear();
                                    });
                                  }
                                    , onMenu: (){
                                      Navigator.pop(context);
                                    },
                                  stars: 2,
                                  );
                                },
                              );
                            }
                          });
                        },
                      );
                    }
                )
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
              )
          ),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 72
              ),
              itemCount: gameOverList.length,
              itemBuilder: (context, index) {
                final piece = gameOverList[index];
                return CustomPiece(
                  isVisible: true,
                  expression: piece.expression,
                  onPressed: () {},
                );
              }
          ),
        ),
        const SizedBox(height: 12,),
        CustomIconButton(
          icon: FontAwesomeIcons.solidLightbulb,
          onPressed: () {
            print('dica');
          },
        ),
        SizedBox(height: 20,),
      ],
    );
  }

}