import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:z_quiz/controller/question_controller.dart';
import 'package:z_quiz/userModel.dart';

class Points extends StatelessWidget {
  final int finalPoints;
  Points({@required this.finalPoints});
  @override
  Widget build(BuildContext context) {
    
     Firestore.instance.collection('points').document().setData({
             'points':Get.arguments*10,
            // 'points':val,
             'username':UserDetails().username,
             'uid':UserDetails().uid,
             'type':'Mobile'
            });
    // print('points page printing uid'+UserDetails().username);
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: SafeArea(
          child: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft, end: Alignment.bottomRight,
                      // stops: [0.1, 0.9],
                      colors: <Color>[Color(0xff0000ff), Color(0xffafeeee)])),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200.h,
                  ),
                  Text(
                    'Score',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: ScreenUtil().setSp(40)),
                  ),
                  // Spacer(),
                  SizedBox(height: 100.h),
                  Text(
                    // "${_qnController.correctAns *10}/${_qnController.questions.length*10}",
                                        "${Get.arguments*10}/${_qnController.questions.length*10}",

                    // '60/100',

                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: ScreenUtil().setSp(35)),
                  ),
                  SizedBox(
                    height: 160.h,
                  ),
                  GestureDetector(
                    onTap: () {
                        // resetQuestionNumber();
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    child: Container(
                      width: 132.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black),
                          color: Color(0xff1E90FF),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          'Okay',
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }
}
