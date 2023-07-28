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
      backgroundColor: CustomTheme.Matthie,
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 190),
              Stack(
                alignment: Alignment.center,
                children: [
                  // Uncomment the following line to add the background image
                  Image.asset('matthie_logo.png', fit: BoxFit.cover),
                ],
              ),
              SizedBox(height: 100),
              CustomButton(
                color: CustomTheme.RED,
                icon: FontAwesomeIcons.google,
                label: 'ENTRAR',
                onPressed: () {
                  AuthService().signInWithGoogle();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
