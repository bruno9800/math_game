import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:math_game/data/models/player.dart';
import 'package:math_game/data/repositories/firebase_repository_impl.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential?> signInWithGoogle() async {
    print(FirebaseAuth);

    try {
      // Realiza o login com o Google
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        // Obtém as credenciais de autenticação do Google
        final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

        // Cria as credenciais do Firebase usando as credenciais do Google
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Realiza o login com o Firebase usando as credenciais
        final UserCredential userCredential =
        await _auth.signInWithCredential(credential);
        await FirebaseRepositoryImpl().createUser(PlayerEntity(
            email: userCredential.user!.email!,
            stars: {'1': 0},
        ));
        // Retorna o usuário autenticado
        return userCredential;
      }

      return null;
    } catch (e) {
      print('Erro durante a autenticação com o Google: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    // Desconecta o usuário autenticado do Google
    await _googleSignIn.disconnect();

    // Desloga o usuário autenticado no Firebase
    await _auth.signOut();

  }
}



