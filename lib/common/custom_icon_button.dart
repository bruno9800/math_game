import 'package:flutter/material.dart';
import 'package:math_game/common/custom_theme.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {Key? key,
        this.color = CustomTheme.ForeColor,
        this.padding = 8,
        required this.icon,
        required this.onPressed,
      })
      : super(key: key);
  final Color? color;
  final double padding;
  final VoidCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 2.0,
            color: Colors.black.withOpacity(0.4),
          )
        ],
      ),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: CustomTheme.Black,)),
    );
  }
}
