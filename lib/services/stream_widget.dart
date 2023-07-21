import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:math_game/pages/home_page.dart';
import 'package:math_game/pages/login_page.dart';
import 'package:math_game/services/provider/player_provider.dart';
import 'package:provider/provider.dart';
//import '../models/error_pop_up.dart';

class StreamWidget extends StatelessWidget {
  const StreamWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<PlayerProvider>(context, listen: false);
    return Scaffold(
      body: StreamBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
              final user = snapshot.data!;
                userProvider.setUserByEmail(user.email!);
            return HomePage();
          } else if (snapshot.hasError) {
            print("**==> DEU ERRADO :(\n");
          }
          //return ErrorPopUp();
          return const LoginPage();
        },
        stream: FirebaseAuth.instance.authStateChanges(),
      ),
    );
  }
}
