import 'package:firebase_auth/firebase_auth.dart';

class UserDetails {
  static String _username;
  static String _email;
  static String _uid;
 
  static FirebaseUser _user;

  updateUser( String username, String email, String uid,FirebaseUser user) {
    _username = username;
    _email = email;
    _uid = uid;
  
    _user = user;
  
    print(_username);
    print(_email);
    print(_uid);
 
  }

  logout() {

    _username = null;
    _email = null;
    _uid = null;
 
    _user = null;
  }


  get username => _username;
  get email => _email;
  get uid => _uid;

  get user => _user;


  set username(String username) {
    _username = username;
  }

  set email(String email) {
    _email = email;
  }

  set uid(String uid) {
    _uid = uid;
  }

 

  set user(FirebaseUser user) {
    _user = user;
  }
}
