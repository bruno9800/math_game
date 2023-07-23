import 'package:flutter/material.dart';
import 'package:math_game/utils/random_piece_color.dart';
import 'custom_theme.dart';

class CustomPiece extends StatelessWidget {
  const CustomPiece(
      {Key? key,
        required this.onPressed,
        required this.expression,
        required this.isVisible,
        required this.color,
      })
      : super(key: key);
  final VoidCallback? onPressed;
  final String expression;
  final bool isVisible;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: isVisible,
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0), color: Color(0xffcec6c1),
                boxShadow: [
                  BoxShadow(
                    color: color,
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
        )
    );
  }
}