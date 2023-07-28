// ignore_for_file: sort_child_properties_last, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_game/common/custom_button.dart';
import 'package:math_game/services/authentication/google_auth_service.dart';
import '../common/custom_theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomTheme.BackColor,
        body: Padding(
          child: Center(
            child: Column(children: [
              SizedBox(height: 190),
              //Image.asset('images/bleff_title.png', fit: BoxFit.cover),
              Text('Matthie.',
                  style: TextStyle(
                      fontSize: 73,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 3
                        ..color = Colors.white)),
              //Text('Developed by Major_Dino', style: TextStyle(color: CustomTheme.ForeColor, fontSize: 18)),
              SizedBox(height: 100),
              CustomButton(
                color: CustomTheme.RED,
                icon: FontAwesomeIcons.google,
                label: 'ENTRAR',
                onPressed: () {
                  AuthService().signInWithGoogle();
                },
              )
            ]),
          ),
          padding: EdgeInsets.all(15.0),
        ));
  }
}
