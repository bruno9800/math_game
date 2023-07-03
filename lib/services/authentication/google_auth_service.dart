import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  late final GoogleSignIn googleSignIn;
  late final GoogleSignInAccount? googleUser;

  signInWithGoogle() async {
    final GoogleSignInAuthentication googleAuth;
    late final OAuthCredential credential;

    googleSignIn = GoogleSignIn();
    googleUser = await googleSignIn.signIn();

    googleAuth = await googleUser!.authentication;
    credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  logout() async {
    FirebaseAuth.instance.signOut();
    return await googleSignIn.disconnect();
  }
}
