import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:video_player/video_player.dart';
import 'package:z_quiz/localWidgets/chewie.dart';
import 'package:url_launcher/url_launcher.dart';


class ReactMaterial extends StatefulWidget {
  @override
  _ReactMaterialState createState() => _ReactMaterialState();
}

class _ReactMaterialState extends State<ReactMaterial> {
    bool big = true;

  @override

  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft, end: Alignment.bottomRight,
                    colors: <Color>[Color(0xff0000ff), Color(0xffafeeee)])),
            child: SingleChildScrollView(
              child: Column(
                children: [
                
                   Padding(
                     padding:  EdgeInsets.only(left:278.w),
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
                        Icons.aspect_ratio_outlined,size: ScreenUtil().setSp(22),
                        color: Colors.black,
                      ),
                  ),
                   ),
                  Container(
                    height: big ? 270.h : 500.h,
                    child: SfPdfViewer.asset(
                      'assets/PDF/ReactJSNotes.pdf',
                    ),
                  ),
                  SizedBox(height: 60.h,),
                  Text('React beginner course',style: TextStyle(
                    fontSize: ScreenUtil().setSp(20),
                    fontWeight: FontWeight.w900
                  ),),
                  SizedBox(height: 10.h,),
                 InkWell(
  child: Text("https://youtu.be/Ke90Tje7VS0",style: TextStyle(    decoration: TextDecoration.underline,
 decorationStyle: TextDecorationStyle.double,
                    fontSize: ScreenUtil().setSp(12),
                    fontWeight: FontWeight.w500
                  ),),
  onTap: () async {
    if (await canLaunch("https://youtu.be/Ke90Tje7VS0")) {
      await launch("https://youtu.be/Ke90Tje7VS0");
    }
  },
),  SizedBox(height: 60.h,),
                  Text('React full course',style: TextStyle(
                    fontSize: ScreenUtil().setSp(20),
                    fontWeight: FontWeight.w900
                  ),),
                  SizedBox(height: 10.h,),
                 InkWell(
  child: Text("https://youtu.be/CI2kX2EFhWc",style: TextStyle(    decoration: TextDecoration.underline,
 decorationStyle: TextDecorationStyle.double,
                    fontSize: ScreenUtil().setSp(12),
                    fontWeight: FontWeight.w500
                  ),),
  onTap: () async {
    if (await canLaunch("https://youtu.be/CI2kX2EFhWc")) {
      await launch("https://youtu.be/CI2kX2EFhWc");
    }
  },
),  SizedBox(height: 60.h,),
                  Text('React crash course',style: TextStyle(
                    fontSize: ScreenUtil().setSp(20),
                    fontWeight: FontWeight.w900
                  ),),
                  SizedBox(height: 10.h,),
                 InkWell(
  child: Text("https://youtu.be/w7ejDZ8SWv8",style: TextStyle(    decoration: TextDecoration.underline,
 decorationStyle: TextDecorationStyle.double,
                    fontSize: ScreenUtil().setSp(12),
                    fontWeight: FontWeight.w500
                  ),),
  onTap: () async {
    if (await canLaunch("https://youtu.be/w7ejDZ8SWv8")) {
      await launch("https://youtu.be/w7ejDZ8SWv8");
    }
  },
),                  SizedBox(height: 20.h,),
      GestureDetector(
                 onTap: () {
                   Navigator.pushNamed(context, '/c_quiz');
                 },
                    
                  child: Container(
                    width: 132.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2
,color: Colors.white                      ),
                      color: Color(0xff1E90FF),
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Center(
                      child: Text(
                        'Start quiz',
                        
                        
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(14),
                          color: Colors.white
                        ),
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
