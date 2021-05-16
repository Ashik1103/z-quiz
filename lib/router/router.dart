import 'package:flutter/material.dart';
import 'package:z_quiz/screens/about_page.dart';
import 'package:z_quiz/screens/bootstrap_material.dart';
import 'package:z_quiz/screens/commets_page.dart';
import 'package:z_quiz/screens/css_material.dart';
import 'package:z_quiz/screens/js_material.dart';
import 'package:z_quiz/screens/leaderboard.dart';
import 'package:z_quiz/screens/points_page.dart';
import 'package:z_quiz/screens/c_quiz.dart';
import 'package:z_quiz/screens/homePage.dart';
import 'package:z_quiz/screens/landingPage.dart';
import 'package:z_quiz/screens/login_page.dart';
import 'package:z_quiz/screens/python_material.dart';
import 'package:z_quiz/screens/react_material_page.dart';
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
      case '/c_quiz':
        return MaterialPageRoute(builder: (context) => CQuiz());
      case '/points':
        return MaterialPageRoute(builder: (context) => Points());
      case '/js_material':
        return MaterialPageRoute(builder: (context) => JsMaterial());
      case '/react_material':
        return MaterialPageRoute(builder: (context) => ReactMaterial());
      case '/bootstrap_material':
        return MaterialPageRoute(builder: (context) => BootStrapMaterial());
        
      case '/python_material':
        return MaterialPageRoute(builder: (context) => Python());


      case '/css_material':
        return MaterialPageRoute(builder: (context) => CssMaterial());
      case '/comments':
        return MaterialPageRoute(builder: (context) => Comments());
      case '/about':
        return MaterialPageRoute(builder: (context) => About());
      case '/leaderboard':
        return MaterialPageRoute(builder: (context) => LeaderBoard());
    }
  }
}
