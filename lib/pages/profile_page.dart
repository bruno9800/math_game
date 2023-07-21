import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_game/common/custom_icon_button.dart';
import 'package:math_game/common/custom_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_game/services/stream_widget.dart';
import '../common/custom_button.dart';
import '../services/authentication/google_auth_service.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var usuario = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      backgroundColor: CustomTheme.Matthie,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 10,
        elevation: 0,
      ),
      //Body List
      body: Container(
        child: Center(
          child: Column(
            children: [
              Container(
                width: 330,
                height: 100,
                child: Row(
                  children: [
                    CustomIconButton(
                      icon: FontAwesomeIcons.user,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Spacer(),
                    CustomIconButton(
                      icon: FontAwesomeIcons.house,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Center(
                  child: Container(
                    width: 330,
                    height: 550,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: CustomTheme.BackgroundColor,
                      boxShadow: [ // Add box shadow here
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 20,
                          offset: Offset(3, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        Row(
                          children: [
                            Spacer(),
                            GestureDetector(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Image.network(
                                  usuario.photoURL!,
                                  height: 60,
                                  width: 60,
                                ),
                              ),
                              onTap: () {},
                            ),
                            SizedBox(width: 10),
                            Text(
                              usuario.displayName.toString(),
                              style: GoogleFonts.nunitoSans(
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(width: 15),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.transparent,
                                  width: 5,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(20),
                                color: CustomTheme.BackgroundColor,
                              ),
                              child: Text(
                                "1° Lugar",
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                        Container(
                          child: Column(
                            children: [
                              SizedBox(height: 30),
                              Row(
                                children: [
                                  Text(
                                    "Detalhes da Conta",
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  Text(
                                    "E-mail:",
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    usuario.email!,
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Número:",
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    usuario.phoneNumber?.substring(2) ?? "Não Informado",
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        CustomButton(
                          color: CustomTheme.RED,
                          height: 50,
                          width: 100,
                          label: 'Sair',
                          onPressed: () async {
                            await AuthService().signOut();
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => StreamWidget()));
                          },
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
