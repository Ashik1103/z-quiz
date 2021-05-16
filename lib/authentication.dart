






import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:z_quiz/screens/homePage.dart';

class Authentication{
FirebaseAuth auth =FirebaseAuth.instance;
final googlesignIn=GoogleSignIn();

Future<bool> googleSignIn()async{
  checkAuthentication() async {
    auth.onAuthStateChanged.listen((user) {
      if (user != null) {
        // Navigator.of(context).pop();

        MaterialPageRoute(builder: (context)=>Home());
      }
    });
  }
  print('inside the google');
  GoogleSignInAccount googleSignInAccount = await googlesignIn.signIn();

  if(googlesignIn != null){
    GoogleSignInAuthentication googleSignInAuthentication=await  googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.getCredential(idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);

    AuthResult result = await auth.signInWithCredential(credential);
    FirebaseUser googleUser = await auth.currentUser();
    print(googleUser.uid);

 

    return Future.value(true);

    
  

  }

}


  // signUp(String _email , String _password, String _confirmPassword, String _username) async {
  //   final FirebaseAuth _auth = FirebaseAuth.instance;
  //   final _formKey = GlobalKey<FormState>();
    
  //   if (_formKey.currentState.validate()) {
  //     _formKey.currentState.save();
  //     if (_password == _confirmPassword) {
  //       try {
  //         FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
  //                 email: _email, password: _password))
  //             .user;
  //         if (user != null) {
  //           UserDetails().updateUser('', _username, _email, user.uid, '', user);
  //           Firestore.instance.collection('users').document(user.uid).setData({
  //             'email': _email,
  //             'username':_username,
  //           });
  //         }
  //       } catch (e) {
  //         showError("assets/images/iconImg/sad_face.png", e.message,context);
  //       }
  //     } else {
  //       showError("assets/images/iconImg/sad_face.png",
  //           "passwords do not match", context);
  //     }
  //   }
  // }




}

