// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      this.color = CustomTheme.BLUE,
      this.height = 68,
      this.icon,
      required this.onPressed,
      required this.label,
      this.width = 250})
      : super(key: key);
  final Color? color;
  final double? height;
  final VoidCallback? onPressed;
  final String label;
  final IconData? icon;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          child: icon != null
              ? Row(
                  children: [
                    Icon(icon, color: Colors.white),
                    Text(label,
                          style: GoogleFonts.mcLaren(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                )
              : Center(
                  child: Text(label,
                    style: GoogleFonts.mcLaren(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),),
                ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0), color: color),
          height: height,
          width: width),
      onTap: onPressed,
    );
  }
}
