// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_game/common/custom_icon_button.dart';
import 'package:math_game/common/custom_piece.dart';
import 'package:math_game/common/custom_theme.dart';

class DividePage extends StatelessWidget {
  const DividePage({Key? key});

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
                          Text("Divisão", style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          )),
                          Icon(FontAwesomeIcons.divide, color: CustomTheme.Button, size: 64)
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      SizedBox(height: 40),

                      // -- DESCRIÇÃO ----------------------------------------------
                      RichText(
                        text: TextSpan(
                          text: 'Para resolver problemas de divisão, há duas formas: ',
                          style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: 'separar a divisão em somas de divisões menores', style: TextStyle(color: CustomTheme.Button)),
                            TextSpan(text: ' ou '),
                            TextSpan(text: 'simplificar', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: '.\n'),
                          ],
                        ),
                      ),

                      // -- EXPRESSÃO ----------------------------------------------
                      RichText(
                        text: TextSpan(
                          text: '120 / 6 = ?',
                          style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: '', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ''),
                          ],
                        ),
                      ),

                      // -- TÍTULO ----------------------------------------------
                      Text("\nSoma de divisões menores", style: GoogleFonts.mcLaren(
                        color: CustomTheme.Button,
                        fontSize: 32,
                      )),

                      // -- DESCRIÇÃO ----------------------------------------------
                      Text("\nConsiste em separar o número do dividendo (o número que está sendo dividido, ou seja, o 120 neste caso) pelo divisor (o número que está dividindo, ou seja, o 6 neste caso) em termos divisíveis do número do divisor:\n\nSabemos que 60 é divisível por 6. Isto é, se dividirmos 60 por 6, obteremos um resultado exato, que não terá resto. Sabemos também que 60 + 60 = 120. Assim:\n", style: GoogleFonts.mcLaren(
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
                            TextSpan(text: '120', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' / 6 = ?'),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: '',
                          style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 33,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: '(60 + 60)', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' / 6 = ?'),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: '(',
                          style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: '60', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' / 6)'),
                            TextSpan(text: ' + ', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: '('),
                            TextSpan(text: '60', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' / 6) = ?'),
                          ],
                        ),
                      ),

                      // -- DESCRIÇÃO ----------------------------------------------
                      Text("\nOu seja, basta separar o dividendo em termos mais simples e de se dividir:\n", style: GoogleFonts.mcLaren(
                        color: Colors.black,
                        fontSize: 20,
                      )),

                      // -- EXPRESSÃO ----------------------------------------------
                      RichText(
                        text: TextSpan(
                          text: '',
                          style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: '60 / 6', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' + '),
                            TextSpan(text: '60 / 6', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' = ?'),
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
                            TextSpan(text: ' + '),
                            TextSpan(text: '10', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' = '),
                            TextSpan(text: '20', style: TextStyle(color: CustomTheme.Button)),
                          ],
                        ),
                      ),

                      // -- TÍTULO ----------------------------------------------
                      Text("\nSimplicação", style: GoogleFonts.mcLaren(
                        color: CustomTheme.RED,
                        fontSize: 32,
                      )),

                      // -- DESCRIÇÃO ----------------------------------------------
                      Text("\nConsiste em separar o dividendo e o divisor em fatores comuns, de forma a simplificar a divisão.\n\nPara isto, basta representar os números através de multiplicação de números menores.\n\nPor exemplo, vejamos alguns fatores de 120:\n", style: GoogleFonts.mcLaren(
                        color: Colors.black,
                        fontSize: 20,
                      )),

                      // -- EXPRESSÃO ----------------------------------------------
                      RichText(
                        text: TextSpan(
                          text: '120 = ',
                          style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: '60 X 2', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ''),
                          ],
                        ),
                      ),

                      // -- DESCRIÇÃO ----------------------------------------------
                      Text("\nAssim, o dividendo 120 pode ser representado pelos fatores 60 e 2.\n", style: GoogleFonts.mcLaren(
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
                            TextSpan(text: '120', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' / 6 = ?'),
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
                            TextSpan(text: '(60 X 2)', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' / 6 = ?'),
                          ],
                        ),
                      ),

                      // -- DESCRIÇÃO ----------------------------------------------
                      Text("\nAgora vejamos alguns fatores de 6:\n", style: GoogleFonts.mcLaren(
                        color: Colors.black,
                        fontSize: 20,
                      )),

                      // -- EXPRESSÃO ----------------------------------------------
                      RichText(
                        text: TextSpan(
                          text: '6 = ',
                          style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: '2 X 3', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ''),
                          ],
                        ),
                      ),

                      // -- DESCRIÇÃO ----------------------------------------------
                      Text("\nAssim, o divisor 6 pode ser representado pelos fatores 2 e 3.\n", style: GoogleFonts.mcLaren(
                        color: Colors.black,
                        fontSize: 20,
                      )),

                      // -- EXPRESSÃO ----------------------------------------------
                      RichText(
                        text: TextSpan(
                          text: '(60 X 2) / ',
                          style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: '6', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' = ?'),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: '(60 X 2) / ',
                          style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: '(2 X 3)', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' = ?'),
                          ],
                        ),
                      ),

                      // -- DESCRIÇÃO ----------------------------------------------
                      Text("\nAgora é possível realizar a divisão de qualquer fator do dividendo pelo divisor.\n\nComo o número 2 é um fator que está presente tanto no dividendo quanto no divisor, podemos retirá-lo da expressão, tanto no dividendo quanto no divisor. Isto facilitará a operação.\n", style: GoogleFonts.mcLaren(
                        color: Colors.black,
                        fontSize: 20,
                      )),

                      // -- EXPRESSÃO ----------------------------------------------
                      RichText(
                        text: TextSpan(
                          text: '(',
                          style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: '60', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' X 2) / (2 X '),
                            TextSpan(text: '3', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ') = ?'),
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
                            TextSpan(text: '60', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' / '),
                            TextSpan(text: '3', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' = ?'),
                          ],
                        ),
                      ),

                      // -- DESCRIÇÃO ----------------------------------------------
                      Text("\nPodemos continuar simplificando ainda mais ou separar em somas de divisões, como já foi apresentado, até encontrarmos o resultado.\n", style: GoogleFonts.mcLaren(
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
                            TextSpan(text: '60', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' / 3 = ?'),
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
                            TextSpan(text: '20 X 3', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' / 3 = ?'),
                          ],
                        ),
                      ),

                      // -- DESCRIÇÃO ----------------------------------------------
                      Text("\nObserve que tem-se na expressão: 3 / 3. Todo número dividido por ele mesmo é igual a 1. Portanto, só restará o 20. Este é o resultado final.\n", style: GoogleFonts.mcLaren(
                        color: Colors.black,
                        fontSize: 20,
                      )),

                      // -- EXPRESSÃO ----------------------------------------------
                      RichText(
                        text: TextSpan(
                          text: '20 X ',
                          style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: '3 / 3', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' = ?'),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: '20 X ',
                          style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: '1', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' = '),
                            TextSpan(text: '20', style: TextStyle(color: CustomTheme.Button)),
                          ],
                        ),
                      ),

                      // -- TÍTULO ----------------------------------------------
                      Text("\nResolva com Criatividade", style: GoogleFonts.mcLaren(
                        color: Colors.black,
                        fontSize: 32,
                      )),
                      
                      // -- DESCRIÇÃO ----------------------------------------------
                      Text("\nVocê percebeu que pode substituir divisões entre dois números por somas de divisões entre números menores ou ainda, que por multiplicações entre números menores! Diante disso, considere as expressões abaixo:\n", style: GoogleFonts.mcLaren(
                        color: Colors.black,
                        fontSize: 20,
                      )),

                      // -- TILES ----------------------------------------------
                      Row(
                        children: [
                          CustomPiece(onPressed: (){}, expression: "60 / 15", isVisible: true, color: CustomTheme.Button, height: 60, width: 90),
                          Text("=", style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          )),
                          CustomPiece(onPressed: (){}, expression: "?", isVisible: true, color: CustomTheme.RED, height: 60, width: 90)
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          CustomPiece(onPressed: (){}, expression: "60 / 15", isVisible: true, color: CustomTheme.Button, height: 60, width: 90),
                          Text("=", style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          )),
                          CustomPiece(onPressed: (){}, expression: "?", isVisible: true, color: CustomTheme.RED, height: 60, width: 90)
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      ),
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
