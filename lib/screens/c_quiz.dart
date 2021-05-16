import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:z_quiz/Questions.dart';
import 'package:z_quiz/constants.dart';
import 'package:z_quiz/controller/question_controller.dart';
import 'package:z_quiz/components/progress_bar.dart';
import 'package:z_quiz/components/question_card.dart';


class CQuiz extends StatelessWidget {
  const CQuiz({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());

    return Scaffold(
      body: SafeArea(
          child: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [
                    0.4,
                    0.9
                  ],
                      colors: <Color>[
                    Colors.black,
                    Color(0xff7f00ff),
                  ])),
              child: Column(
                children: [
                  SizedBox(height: 60.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ProgressBar(),
                  ),
                  SizedBox(height: 30.h),
                  Obx(()=>
                    Text.rich(TextSpan(
                        text: 'Question ${_questionController.questionNumber.value}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(24),
                        ),
                        children: [
                          TextSpan(
                            text: '/10',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(24),
                            ),
                          )
                        ])),
                  ),
                  SizedBox(height: 20.h),
                  Expanded(
                      
                      child: PageView.builder(
                    
                        
                        // physics: NeverScrollableScrollPhysics(),
                        controller: _questionController.pageController,
                        itemCount: _questionController.questions.length,
                        onPageChanged: _questionController.updateTheQnNum,
                          itemBuilder: (context, index) => QuestionCard(
                            question:_questionController.questions[index]
                          )))
                ],
              ))),
    );
  }
}
