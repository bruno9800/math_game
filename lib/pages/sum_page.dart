// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_game/common/custom_icon_button.dart';
import 'package:math_game/common/custom_piece.dart';
import 'package:math_game/common/custom_theme.dart';

class SumPage extends StatelessWidget {
  const SumPage({Key? key});

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
                          Text("Adição", style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          )),
                          Icon(FontAwesomeIcons.plus, color: CustomTheme.Button, size: 64)
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      SizedBox(height: 40),

                      // -- DESCRIÇÃO ----------------------------------------------
                      Text("Para resolver problemas de adição, precisamos dividir o problema em operações menores conhecidas.\n\nVamos utilizar a expressão abaixo como exemplo:\n", style: GoogleFonts.mcLaren(
                        color: Colors.black,
                        fontSize: 20,
                      )),

                      // -- EXPRESSÃO ----------------------------------------------
                      RichText(
                        text: TextSpan(
                          text: '4 + ',
                          style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: '7', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' = ?'),
                          ],
                        ),
                      ),

                      // -- DESCRIÇÃO ----------------------------------------------
                      Text("\nEsta conta é muito simples. Porém, observe ela de uma forma diferente. Isso te ajudará a resolver operações mais complicadas.\nSabemos que o 7 pode ser escrito da seguinte maneira:\n", style: GoogleFonts.mcLaren(
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
                            TextSpan(text: '7', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' = 6 + 1'),
                          ],
                        ),
                      ),

                      // -- DESCRIÇÃO ----------------------------------------------
                      Text("\nEntão, o problema inicial se resuma a esta outra expressão:\n", style: GoogleFonts.mcLaren(
                        color: Colors.black,
                        fontSize: 20,
                      )),

                      // -- EXPRESSÃO ----------------------------------------------
                      RichText(
                        text: TextSpan(
                          text: '4 + ',
                          style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: '6 + 1', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' = ?'),
                          ],
                        ),
                      ),

                      // -- DESCRIÇÃO ----------------------------------------------
                      Text("\nObserve que a conta está bem mais simples, porque o resultado da primeira adição é conhecido:\n", style: GoogleFonts.mcLaren(
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
                            TextSpan(text: '4 + 6', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' = 10'),
                          ],
                        ),
                      ),

                      // -- DESCRIÇÃO ----------------------------------------------
                      Text("\nAssim, retornando ao problema:\n", style: GoogleFonts.mcLaren(
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
                            TextSpan(text: '4 + 6', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' + 1 = ?'),
                          ],
                        ),
                      ),
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
                            TextSpan(text: ' + 1 = '),
                            TextSpan(text: '11', style: TextStyle(color: CustomTheme.Button)),
                          ],
                        ),
                      ),

                      // -- TÍTULO ----------------------------------------------
                      Text("\nResolva com Criatividade", style: GoogleFonts.mcLaren(
                        color: Colors.black,
                        fontSize: 32,
                      )),
                      
                      // -- DESCRIÇÃO ----------------------------------------------
                      Text("\nVocê percebeu que expressões diferentes podem ter os mesmos resultados. As chamamos de equivalentes! Diante disso, verifique se a igualde abaixo é verdadeira:\n", style: GoogleFonts.mcLaren(
                        color: Colors.black,
                        fontSize: 20,
                      )),

                      // -- TILES ----------------------------------------------
                      Row(
                        children: [
                          CustomPiece(onPressed: (){}, expression: "4 + 2 + 6", isVisible: true, color: CustomTheme.Button, height: 60, width: 90),
                          Text("=", style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          )),
                          CustomPiece(onPressed: (){}, expression: "5 + 1 + 6", isVisible: true, color: CustomTheme.RED, height: 60, width: 90)
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      )
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
