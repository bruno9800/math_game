import 'package:flutter/material.dart';
import 'package:math_game/utils/random_piece_color.dart';
import 'custom_theme.dart';

class CustomPiece extends StatelessWidget {
  const CustomPiece(
      {Key? key,
        required this.onPressed,
        required this.expression,
      })
      : super(key: key);
  final VoidCallback? onPressed;
  final String expression;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0), color: Color(0xffcec6c1),
            boxShadow: [
              BoxShadow(
                color: RandomPieceColor().get(),
                offset: Offset(3, 3),
              )
          ]
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0), color: CustomTheme.PIECE),
              margin: const EdgeInsets.only(right: 4, bottom: 4),
          child: Center(
            child: Text( expression,
                style: const TextStyle(
                    color: CustomTheme.Black, fontSize: 16)),
          ),
        ),
      ),
    );
  }
}