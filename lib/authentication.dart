import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:z_quiz/screens/homePage.dart';

class Authentication {
  FirebaseAuth auth = FirebaseAuth.instance;
  final googlesignIn = GoogleSignIn();

  Future<bool> googleSignIn() async {
    checkAuthentication() async {
      auth.onAuthStateChanged.listen((user) {
        if (user != null) {
          // Navigator.of(context).pop();

          MaterialPageRoute(builder: (context) => Home());
        }
      });
    }

    print('inside the google');
    GoogleSignInAccount googleSignInAccount = await googlesignIn.signIn();

    if (googlesignIn != null) {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      AuthResult result = await auth.signInWithCredential(credential);
      FirebaseUser googleUser = await auth.currentUser();
      print(googleUser.uid);

      return Future.value(true);
    }
  }
}
