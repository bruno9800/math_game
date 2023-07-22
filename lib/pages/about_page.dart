import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_game/common/custom_theme.dart';

import '../common/custom_icon_button.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key); // Correção na declaração do construtor

  @override
  Widget build(BuildContext context) {
    List<String> lines = _getLoremIpsum().split('\n');

    return Scaffold(
      backgroundColor: CustomTheme.Matthie,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Container(
              width: 400,
              height: 600,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.35),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(3, 8),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: lines.map((line) =>
                        Text(
                          line,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mcLaren(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                    ).toList(),
                  ),
                ),
              ),
            ),
            Spacer(),
            CustomIconButton(
              icon: FontAwesomeIcons.arrowLeftLong,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  String _getLoremIpsum() {
    return """
      Sobre

Matthie.™ é um jogo produzido pelos alunos da UNIVASF em parceria com os professores do colégio Rui Barbosa.
O jogo tem como objetivo trazer ensinamentos e práticas com as 4 operações básicas, visando o aprendizado através do estilo de jogo mahjong.

Jogo distribuído gratuitamente pelos alunos de Engenharia De Software 3 ministrada pelo professor Ricardo Argenton Ramos. 

---EQUIPE---

Alan Vitor de Souza Pinho - Desenvolvedor
Bruno Matheus Perera Silva - Desenvolvedor, Designer e PO
Gabriel de Oliveira Silva - Desenvolvedor
Thiago José Souza Neto -  Designer, Scrum Master e Desenvolvedor 
Vithor Freitas Rodrigues - Designer de áudio e PO
    """;
  }
}

void main() {
  runApp(MaterialApp(
    home: AboutPage(),
  ));
}
