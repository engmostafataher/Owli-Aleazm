import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:owli_aleazm/core/helpers/share_pref_helper_token.dart';
import 'package:owli_aleazm/core/helpers/shared_pref_keys.dart';

class FirebasaServices {
  final auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();
  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;


              final idToken = googleSignInAuthentication.idToken;
        final accessToken = googleSignInAuthentication.accessToken;
          if (accessToken!.isNotEmpty) {
              await SharedPref.setData(
          key: SharedPrefKeys.token,
          value: accessToken,
        );
          }


        final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        await auth.signInWithCredential(authCredential);
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      // تسجيل الخروج من Google Sign-In
      await googleSignIn.signOut();

      // تسجيل الخروج من Firebase
      await auth.signOut();

      print('Successfully signed out');
    } catch (e) {
      print('SignOut Error: $e');
    }
  }
}
