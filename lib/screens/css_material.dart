import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:video_player/video_player.dart';
import 'package:z_quiz/localWidgets/chewie.dart';
import 'package:url_launcher/url_launcher.dart';

class CssMaterial extends StatefulWidget {
  @override
  _CssMaterialState createState() => _CssMaterialState();
}

class _CssMaterialState extends State<CssMaterial> {
  bool big = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Color(0xff0000ff), Color(0xffafeeee)])),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 278.w),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (big == true) {
                            big = false;
                          } else {
                            big = true;
                          }
                        });
                      },
                      icon: Icon(
                        Icons.aspect_ratio_outlined,
                        size: ScreenUtil().setSp(22),
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    height: big ? 270.h : 500.h,
                    child: SfPdfViewer.asset(
                      'assets/PDF/CSS .pdf',
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Text(
                    'CSS beginner course',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(20),
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InkWell(
                    child: Text(
                      "https://youtu.be/3_9znKVNe5g",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.double,
                          fontSize: ScreenUtil().setSp(12),
                          fontWeight: FontWeight.w500),
                    ),
                    onTap: () async {
                      if (await canLaunch("https://youtu.be/3_9znKVNe5g")) {
                        await launch("https://youtu.be/3_9znKVNe5g");
                      }
                    },
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Text(
                    'CSS full course',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(20),
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InkWell(
                    child: Text(
                      "https://youtu.be/1Rs2ND1ryYc",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.double,
                          fontSize: ScreenUtil().setSp(12),
                          fontWeight: FontWeight.w500),
                    ),
                    onTap: () async {
                      if (await canLaunch("https://youtu.be/1Rs2ND1ryYc")) {
                        await launch("https://youtu.be/1Rs2ND1ryYc");
                      }
                    },
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Text(
                    'CSS crash course',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(20),
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InkWell(
                    child: Text(
                      "https://youtu.be/yfoY53QXEnI",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.double,
                          fontSize: ScreenUtil().setSp(12),
                          fontWeight: FontWeight.w500),
                    ),
                    onTap: () async {
                      if (await canLaunch("https://youtu.be/yfoY53QXEnI")) {
                        await launch("https://youtu.be/yfoY53QXEnI");
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/c_quiz');
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
                          'Start quiz',
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
