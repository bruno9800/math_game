import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_game/common/custom_icon_button.dart';
import 'package:math_game/common/custom_piece.dart';
import 'package:math_game/common/custom_theme.dart';

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
  final List<int> list = List.generate(24, (index) => index + 1);
  final List<int> GameOverList = [];
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
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final item = list[index];
                      return CustomPiece(
                        expression: item.toString(),
                        onPressed: () {
                          setState(() {
                            if(GameOverList.length > 3) {
                              print('game over');
                              GameOverList.clear();
                            }else {
                              GameOverList.add(item);
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
              itemCount: GameOverList.length,
              itemBuilder: (context, index) {
                final GameOverItem = GameOverList[index];
                return CustomPiece(
                  expression: GameOverItem.toString(),
                  onPressed: () {
                    print('clicou');
                  },
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