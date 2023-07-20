import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_game/common/custom_icon_button.dart';
import 'package:math_game/common/custom_piece.dart';
import 'package:math_game/common/custom_theme.dart';
import 'package:math_game/game_core/game.dart';
import 'package:math_game/game_core/piece.dart';
import 'package:math_game/pages/over_page.dart';

class GameComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GameState();
  }

}

class CreateList {
  List<int> list = [];
  CreateList({required size}) {
    for(int i = 0; i < size; i++, list.add(i)) {}
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
                                      , onMenu: (){},);
                                  },
                                );

                            }else {
                              handlePressedPiece(piece.result);
                            }
                            if(gameScore == 6) {
                              // Ganhou;
                            }
                          }
                          });
                        },
                      );
                    }
                )
            ),
          ),
        Container(
          height: 92,
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
        const SizedBox(height: 24,),
        CustomIconButton(
          icon: FontAwesomeIcons.solidLightbulb,
          onPressed: () {
            print('dica');
          },
        ),
        SizedBox(height: 42,),
      ],
    );
  }

}