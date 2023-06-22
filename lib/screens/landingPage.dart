import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.1, 0.9],
                  colors: <Color>[Color(0xff0000ff), Color(0xffafeeee)])),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60.h,
                ),

                Stack(
                  children: [
                    Container(
                      width: 260.w,
                      height: 110.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(23),
                              topRight: Radius.circular(23)),
                          border: Border.all(width: 2, color: Colors.white)),
                    ),
                    Positioned(
                      left: 20.w,
                      top: 8.h,
                      child: Image(
                        image: AssetImage(
                          'assets/images/logo.png',
                        ),
                        width: 70.w,
                        height: 90.h,
                      ),
                    ),
                    Positioned(
                      left: 105.w,
                      top: 34.h,
                      child: Text(
                        'G-QUIZ',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(35)),
                      ),
                    ),
                  ],
                ),

                Spacer(),
                Container(
                  width: 250.w,
                  height: 170.h,
                  decoration: BoxDecoration(),
                  child: Image(
                    fit: BoxFit.cover,
                    width: 300.w,
                    height: 100.h,
                    image: AssetImage('assets/images/coding.jpeg'),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
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
                SizedBox(
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Center(
                    child: Container(
                      width: 132.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border:
                              Border.all(color: Color(0xff1E90FF), width: 2)),
                      child: Center(
                        child: Text(
                          'Signup',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                            color: Color(0xff1E90FF),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer()

              ],
            ),
          ),
        ),
      ],
    )));
  }
}
