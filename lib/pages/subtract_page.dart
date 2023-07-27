// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_game/common/custom_icon_button.dart';
import 'package:math_game/common/custom_piece.dart';
import 'package:math_game/common/custom_theme.dart';

class SubtractPage extends StatelessWidget {
  const SubtractPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.Matthie,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 28),
            CustomIconButton(
              icon: FontAwesomeIcons.check,
              onPressed: () {
                Navigator.pop(context);
              }),
            Expanded( // Wrap the content inside an Expanded widget
              child: SingleChildScrollView( // Use SingleChildScrollView to make the content scrollable
                child: Container(
                  child: Column(
                    children: [
                      // -- TÍTULO -------------------------------------------------
                      Row(
                        children: [
                          Text("Subtração", style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          )),
                          Icon(Icons.minimize_rounded, color: CustomTheme.Button, size: 64)
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      SizedBox(height: 40),

                      // -- DESCRIÇÃO ----------------------------------------------
                      Text("Para resolver problemas de subtração, basta dividir a operação em termos mais simples, assim como na adição.\nVamos resolver o problema abaixo:\n", style: GoogleFonts.mcLaren(
                        color: Colors.black,
                        fontSize: 20,
                      )),

                      // -- EXPRESSÃO ----------------------------------------------
                      RichText(
                        text: TextSpan(
                          text: '',
                          style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: '10', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' - 4 = ?'),
                          ],
                        ),
                      ),

                      // -- DESCRIÇÃO ----------------------------------------------
                      Text("\nJá sabemos que o 10 pode ser reescrito da seguinte forma:\n", style: GoogleFonts.mcLaren(
                        color: Colors.black,
                        fontSize: 20,
                      )),

                      // -- EXPRESSÃO ----------------------------------------------
                      RichText(
                        text: TextSpan(
                          text: '',
                          style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: '10', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' = 6 + 4'),
                          ],
                        ),
                      ),

                      // -- DESCRIÇÃO ----------------------------------------------
                      Text("\nEntão, substituindo o 10, o problema se resume à expressão abaixo:\n", style: GoogleFonts.mcLaren(
                        color: Colors.black,
                        fontSize: 20,
                      )),

                      // -- EXPRESSÃO ----------------------------------------------
                      RichText(
                        text: TextSpan(
                          text: '',
                          style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: '6 + 4', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' - 4 = ?'),
                          ],
                        ),
                      ),

                      // -- DESCRIÇÃO ----------------------------------------------
                      Text("\nObserve que tem-se na expressão: 4 - 4. Todo número subtraído dele mesmo é igual a 0. Portanto, só restará o 6.\n", style: GoogleFonts.mcLaren(
                        color: Colors.black,
                        fontSize: 20,
                      )),

                      // -- EXPRESSÃO ----------------------------------------------
                      RichText(
                        text: TextSpan(
                          text: '6 + ',
                          style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: '4 - 4', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' = ?'),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: '6 + ',
                          style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: '0', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' = '),
                            TextSpan(text: '6', style: TextStyle(color: CustomTheme.Button)),
                          ],
                        ),
                      ),

                      // -- DESCRIÇÃO ----------------------------------------------
                      Text("\nAssim, o problema inicial está resolvido!\n", style: GoogleFonts.mcLaren(
                        color: Colors.black,
                        fontSize: 20,
                      )),

                      // -- EXPRESSÃO ----------------------------------------------
                      RichText(
                        text: TextSpan(
                          text: '10 - 4 = ',
                          style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: '6', style: TextStyle(color: CustomTheme.Button)),
                            TextSpan(text: ''),
                          ],
                        ),
                      ),

                      // -- TÍTULO ----------------------------------------------
                      Text("\nResolva com Criatividade", style: GoogleFonts.mcLaren(
                        color: Colors.black,
                        fontSize: 32,
                      )),
                      
                      // -- DESCRIÇÃO ----------------------------------------------
                      Text("\nVocê percebeu que pode substituir números maiores, em uma subtração, por somas de números menores! Diante disso, considere a expressão abaixo:\n", style: GoogleFonts.mcLaren(
                        color: Colors.black,
                        fontSize: 20,
                      )),

                      // -- TILES ----------------------------------------------
                      Row(
                        children: [
                          CustomPiece(onPressed: (){}, expression: "14 - 6", isVisible: true, color: CustomTheme.Button, height: 60, width: 90),
                          Text("=", style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          )),
                          CustomPiece(onPressed: (){}, expression: "?", isVisible: true, color: CustomTheme.RED, height: 60, width: 90)
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      ),
                      
                      // -- TÍTULO ----------------------------------------------
                      Text("\nDica", style: GoogleFonts.mcLaren(
                        color: Colors.black,
                        fontSize: 32,
                      )),
                      
                      // -- DESCRIÇÃO ----------------------------------------------
                      Text("\n14 = 10 + 4\n", style: GoogleFonts.mcLaren(
                        color: Colors.black,
                        fontSize: 26,
                      )),
                    ],
                  ),
                  color: CustomTheme.BOX_BACK,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.all(Radius.circular(20))
                  // ),
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 80),
                  padding: EdgeInsets.fromLTRB(20, 50, 20, 40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
