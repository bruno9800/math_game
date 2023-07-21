import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StarsComponent extends StatefulWidget {
  final double size;
  final int fillStars;

  StarsComponent({super.key,
    this.size = 24.0,
    required this.fillStars,
  });

  @override
  _StarIconState createState() => _StarIconState();
}

class _StarIconState extends State<StarsComponent> {


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,


      children: [
        Icon(
            1 <= widget.fillStars ? FontAwesomeIcons.solidStar : FontAwesomeIcons.star,
            color: 1 <= widget.fillStars ? Colors.amber: Colors.white,
            size: widget.size,
          ),
        const SizedBox(width: 4),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              3 <= widget.fillStars ? FontAwesomeIcons.solidStar : FontAwesomeIcons.star,
              color: 3 <= widget.fillStars ? Colors.amber: Colors.white,
              size: widget.size + 2,
            ),
            const SizedBox(height: 10,)
          ],
        ),
        const SizedBox(width: 4),
        Icon(
          2 <= widget.fillStars ? FontAwesomeIcons.solidStar : FontAwesomeIcons.star,
          color: 2 <= widget.fillStars ? Colors.amber: Colors.white,
          size: widget.size,
        ),

      ]


    );
  }
}
