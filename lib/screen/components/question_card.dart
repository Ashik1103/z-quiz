import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:z_quiz/Questions.dart';
import 'package:z_quiz/components/option.dart';
import 'package:z_quiz/constants.dart';
import 'package:z_quiz/controller/question_controller.dart';


class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key key,
    @required this.question,
  }) : super(key: key);
  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());

    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          Text(
            question.question,
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: ScreenUtil().setSp(16)),
          ),
          ...List.generate(
            question.options.length,
            (index) => Option(
                index: index,
                text: question.options[index],
                press: () => _controller.checkAns(question, index)),
          ),
        ],
      ),
    );
  }
}
