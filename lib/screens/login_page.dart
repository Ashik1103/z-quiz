import 'dart:ui';

import 'package:auth_buttons/auth_buttons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_quiz/authentication.dart';
import 'package:z_quiz/localWidgets/showError.dart';
import 'package:z_quiz/userModel.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  login(String email, String password) async {
    try {
      FirebaseUser user = (await _auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      Firestore.instance
          .collection('users')
          .document(user.uid)
          .get()
          .then((document) {
        print('User details');
        // UserDetails().updateUser(
        //     document.data['name'],
        //     document.data['username'],
        //     document.data['email'],
        //     user);
      });
    } catch (e) {
      showError("images/sad_face.png", e.message, context);
    }
  }

  @override
  void initState() {
    super.initState();
    checkAuthentication();
    super.initState();
  }

  checkAuthentication() {
    _auth.onAuthStateChanged.listen((user) async {
      if (user != null) {
        // Navigator.of(context).pop();
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft, end: Alignment.bottomRight,
                  // stops: [0.1, 0.9],
                  colors: <Color>[Color(0xff0000ff), Color(0xffafeeee)])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Spacer(flex: 2), //2/6
              SizedBox(
                height: 40.h,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: ScreenUtil().setSp(30),
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  Padding(
                    padding: EdgeInsets.only(left: 105.w),
                    child: Text(
                      "Login",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Center(
                child: Container(
                  width: 250.w,
                  height: 160.h,
                  child: Image(
                    fit: BoxFit.cover,
                    width: 100.w,
                    height: 100.h,
                    image: AssetImage('assets/images/login.jpeg'),
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              // Spacer(), // 1/6
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 40.w, right: 40.w),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        filled: true,
                        // fillColor: Color(0xFF1C2341),
                        fillColor: Colors.white,
                        hintText: "email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40.w, right: 40.w),
                    child: TextFormField(
                      obscureText: true,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        filled: true,
                        // fillColor: Color(0xFF1C2341),
                        fillColor: Colors.white,
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 100.h,
              ), 
              GestureDetector(
                onTap: () =>
                    login(_emailController.text, _passwordController.text),
                child: Container(
                  width: 132.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.white),
                      color: Color(0xff1E90FF),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(14),
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 30.h,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
