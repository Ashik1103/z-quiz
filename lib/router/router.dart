import 'package:flutter/material.dart';
import 'package:z_quiz/screens/homePage.dart';
import 'package:z_quiz/screens/landingPage.dart';
import 'package:z_quiz/screens/login_page.dart';
import 'package:z_quiz/screens/signUpPage.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => LandingPage());
      case '/signup':
        return MaterialPageRoute(builder: (context) => SignUp());
      case '/login':
        return MaterialPageRoute(builder: (context) => Login());
      case '/home':
        return MaterialPageRoute(builder: (context) => Home());


    }
  }
}
