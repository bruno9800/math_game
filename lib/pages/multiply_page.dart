// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_game/common/custom_icon_button.dart';
import 'package:math_game/common/custom_piece.dart';
import 'package:math_game/common/custom_theme.dart';

class MultiplyPage extends StatelessWidget {
  const MultiplyPage({Key? key});

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
                          Text("Multiplicação", style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          )),
                          Icon(Icons.close_rounded, color: CustomTheme.Button, size: 64)
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      SizedBox(height: 40),

                      // -- DESCRIÇÃO ----------------------------------------------
                      RichText(
                        text: TextSpan(
                          text: 'Para resolver problemas de multiplicação, há duas formas: ',
                          style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: 'realizar uma série de somas', style: TextStyle(color: CustomTheme.Button)),
                            TextSpan(text: ' ou '),
                            TextSpan(text: 'dividir em fatores mais simples', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: '.\n'),
                          ],
                        ),
                      ),

                      // -- EXPRESSÃO ----------------------------------------------
                      RichText(
                        text: TextSpan(
                          text: '4 X 5 = ?',
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
                      Text("\nRealizar uma série de somas", style: GoogleFonts.mcLaren(
                        color: CustomTheme.Button,
                        fontSize: 32,
                      )),

                      // -- DESCRIÇÃO ----------------------------------------------
                      Text("\nA expressão 4 X 5 significa que o número 4 deve ser somado 5 vezes ou ainda, que o 5 deve ser somado 4 vezes. Vamos utilizar esta segunda opção:\n", style: GoogleFonts.mcLaren(
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
                            TextSpan(text: '5 + 5', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' + '),
                            TextSpan(text: '5 + 5', style: TextStyle(color: CustomTheme.RED)),
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

                      // -- DESCRIÇÃO ----------------------------------------------
                      Text("\nEntretanto, como na multiplicação a ordem dos fatores não altera o resultado, podemos usar também a primeira opção e somar cinco vezes o número 4. O resultado será o mesmo.\n", style: GoogleFonts.mcLaren(
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
                            TextSpan(text: '4 + 4', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' + '),
                            TextSpan(text: '4 + 4', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' + 4 = ?'),
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
                            TextSpan(text: '8', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' + '),
                            TextSpan(text: '8', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' + 4 = ?'),
                          ],
                        ),
                      ),

                      // -- DESCRIÇÃO ----------------------------------------------
                      Text("\nUtilizando o que já foi aprendido na aba sobre 'Adição' (caso ainda haja alguma dúvida, você pode consultá-la de novo), podemos simplificar ainda mais a operação acima para obter o resultado esperado:\n", style: GoogleFonts.mcLaren(
                        color: Colors.black,
                        fontSize: 20,
                      )),

                      // -- EXPRESSÃO ----------------------------------------------
                      RichText(
                        text: TextSpan(
                          text: '8 + 8 + ',
                          style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: '4', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' = ?'),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: '8 + 8 + ',
                          style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: '2 + 2', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' = ?'),
                          ],
                        ),
                      ),

                      // -- DESCRIÇÃO ----------------------------------------------
                      Text("\nAlterando a ordem das parcelas (os números que estão sendo somados), podemos obter o mesmo resultado:\n", style: GoogleFonts.mcLaren(
                        color: Colors.black,
                        fontSize: 20,
                      )),

                      // -- EXPRESSÃO ----------------------------------------------
                      RichText(
                        text: TextSpan(
                          text: '8 + ',
                          style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: '2', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' + 8 + '),
                            TextSpan(text: '2', style: TextStyle(color: CustomTheme.RED)),
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
                      Text("\nDividir em fatores", style: GoogleFonts.mcLaren(
                        color: CustomTheme.RED,
                        fontSize: 32,
                      )),

                      // -- DESCRIÇÃO ----------------------------------------------
                      Text("\nSabemos que 4 é o dobro de 2. Ou seja, o número 2, quando multiplicado por 2, é igual a 4.\n", style: GoogleFonts.mcLaren(
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
                            TextSpan(text: '2', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' X 2 = '),
                            TextSpan(text: '4', style: TextStyle(color: CustomTheme.Button)),
                          ],
                        ),
                      ),

                      // -- DESCRIÇÃO ----------------------------------------------
                      Text("\nAssim, a expressão 4 X 5 pode ser escrita da seguinte forma:\n", style: GoogleFonts.mcLaren(
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
                            TextSpan(text: '4', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' X 5 = ?'),
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
                            TextSpan(text: '2 X 2', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' X 5 = ?'),
                          ],
                        ),
                      ),

                      // -- DESCRIÇÃO ----------------------------------------------
                      Text("\nSabemos também que o dobro de 5 é 10. Ou seja:\n", style: GoogleFonts.mcLaren(
                        color: Colors.black,
                        fontSize: 20,
                      )),

                      // -- EXPRESSÃO ----------------------------------------------
                      RichText(
                        text: TextSpan(
                          text: '2 X ',
                          style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: '2 X 5', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' = ?'),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: '2 X ',
                          style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: '10', style: TextStyle(color: CustomTheme.RED)),
                            TextSpan(text: ' = ?'),
                          ],
                        ),
                      ),

                      Text("\nPortanto,\n", style: GoogleFonts.mcLaren(
                        color: Colors.black,
                        fontSize: 20,
                      )),

                      // -- EXPRESSÃO ----------------------------------------------
                      RichText(
                        text: TextSpan(
                          text: '2 X ',
                          style: GoogleFonts.mcLaren(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: '10', style: TextStyle(color: CustomTheme.RED)),
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
                      Text("\nVocê percebeu que pode substituir multiplicações entre dois números por multiplicações entre números menores ou ainda, que pode substituir multiplicação por uma série de adições! Diante disso, considere a expressão abaixo:\n", style: GoogleFonts.mcLaren(
                        color: Colors.black,
                        fontSize: 20,
                      )),

                      // -- TILES ----------------------------------------------
                      Row(
                        children: [
                          CustomPiece(onPressed: (){}, expression: "5 X 6", isVisible: true, color: CustomTheme.Button, height: 60, width: 90),
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
