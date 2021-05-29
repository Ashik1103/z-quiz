import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_quiz/screens/commets_page.dart';

class LeaderBoard extends StatefulWidget {
  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  Firestore db = Firestore.instance;
  //  var numm;
  Num()async{
    print("hii::::::::::::::");
  final numm= await  Firestore.instance.collection('points').snapshots().length;
    print("number::::::::"+numm.toString());

  }

 

  @override
  Widget build(BuildContext context) {
    // print("number::::::::"+numm.toString());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: ScreenUtil().setSp(25),
                color: Color(0xff0000ff),
              ),
            ),
          ),
          title: Padding(
            padding:  EdgeInsets.only(top:17.h),
            child: Text('LeaderBoard', style: TextStyle(
                                fontSize: ScreenUtil().setSp(24),
                                color: Color(0xff0000ff)),),
          ),
          centerTitle: true,
        ),
      ),
      body: SafeArea(
          child: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft, end: Alignment.bottomRight,
                      // stops: [0.1, 0.9],
                      colors: <Color>[Color(0xff0000ff), Color(0xffafeeee)])),
              child: Padding(
                padding:  EdgeInsets.only(top:38.h,left:10.w,right:10.w),
                child: Table(
                  defaultColumnWidth: FixedColumnWidth(120.0),
                  border: TableBorder.all(
                      color: Colors.black, style: BorderStyle.solid, width: 2),
                  children: [
                    TableRow(children: [
                        
                      Container(
                        height: 40.h,
                        width: 50.w,
                        color: Color(0xffafeeee),
                        child: Center(
                          child: Text(
                            'Username',
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(20),
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                      Container(
                        height: 40.h,
                        width: 50.w,
                        color: Color(0xffafeeee),
                        child: Center(
                          child: Text(
                            'Points',
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(20),
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                   
                    ]),
                    TableRow(children: [
                     
                       Container(
                        height: 30.h,
                        width: 50.w,
                        // color: Colors.pink,
                        child: StreamBuilder(
                          stream: db
                              .collection('points')
                              .orderBy('points', descending: true)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                  child: Text(
                                'Add the comments',
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(40),
                                    color: Colors.white),
                              ));
                            }
                            return ListView.builder(
                                itemCount: 1,
                                itemBuilder: (context, index) => Center(
                                      child: Text(
                                        snapshot.data.documents[0]['username'],
                                        style: TextStyle(
                                          fontSize: ScreenUtil().setSp(20),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ));
                          },
                        ),
                      ),
                      Container(
                        height: 30.h,
                        width: 50.w,
                        // color: Colors.pink,
                        child: StreamBuilder(
                          stream: db
                              .collection('points')
                              .orderBy('points', descending: true)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                  child: Text(
                                'Add the comments',
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(40),
                                    color: Colors.white),
                              ));
                            }
                            return ListView.builder(
                                itemCount: 1,
                                itemBuilder: (context, index) => Center(
                                      child: Text(
                                        snapshot.data.documents[0]['points']
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: ScreenUtil().setSp(20),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ));
                          },
                        ),
                      ),
                    ]),
                    TableRow(children: [
                   
                      Container(
                        height: 30.h,
                        width: 50.w,
                        // color: Colors.pink,
                        child: StreamBuilder(
                          stream: db
                              .collection('points')
                              .orderBy('points', descending: true)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                  child: Text(
                                'Add the comments',
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(40),
                                    color: Colors.white),
                              ));
                            }
                            return ListView.builder(
                                itemCount: 1,
                                itemBuilder: (context, index) => Center(
                                      child: Text(
                                        snapshot.data.documents[1]['username'],
                                        style: TextStyle(
                                          fontSize: ScreenUtil().setSp(20),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ));
                          },
                        ),
                      ),
                      Container(
                        height: 30.h,
                        width: 50.w,
                        // color: Colors.pink,
                        child: StreamBuilder(
                          stream: db
                              .collection('points')
                              .orderBy('points', descending: true)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                  child: Text(
                                'Add the comments',
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(40),
                                    color: Colors.white),
                              ));
                            }
                            return ListView.builder(
                                itemCount: 1,
                                itemBuilder: (context, index) => Center(
                                      child: Text(
                                        snapshot.data.documents[1]['points']
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: ScreenUtil().setSp(20),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ));
                          },
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      
                      Container(
                        height: 30.h,
                        width: 50.w,
                        // color: Colors.pink,
                        child: StreamBuilder(
                          stream: db
                              .collection('points')
                              .orderBy('points', descending: true)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                  child: Text(
                                'Add the comments',
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(40),
                                    color: Colors.white),
                              ));
                            }
                            return ListView.builder(
                                itemCount: 1,
                                itemBuilder: (context, index) => Center(
                                      child: Text(
                                        snapshot.data.documents[2]['username'],
                                        style: TextStyle(
                                          fontSize: ScreenUtil().setSp(20),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ));
                          },
                        ),
                      ),
                      Container(
                        height: 30.h,
                        width: 50.w,
                        // color: Colors.pink,
                        child: StreamBuilder(
                          stream: db
                              .collection('points')
                              .orderBy('points', descending: true)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                  child: Text(
                                'Add the comments',
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(40),
                                    color: Colors.white),
                              ));
                            }
                            return ListView.builder(
                                itemCount: 1,
                                itemBuilder: (context, index) => Center(
                                      child: Text(
                                        snapshot.data.documents[2]['points']
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: ScreenUtil().setSp(20),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ));
                          },
                        ),
                      ),
                    ]),
                    TableRow(children: [
                     
                      Container(
                        height: 30.h,
                        width: 50.w,
                        // color: Colors.pink,
                        child: StreamBuilder(
                          stream: db
                              .collection('points')
                              .orderBy('points', descending: true)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                  child: Text(
                                'Add the comments',
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(40),
                                    color: Colors.white),
                              ));
                            }
                            return ListView.builder(
                                itemCount: 1,
                                itemBuilder: (context, index) => Center(
                                      child: Text(
                                        snapshot.data.documents[3]['username'],
                                        style: TextStyle(
                                          fontSize: ScreenUtil().setSp(20),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ));
                          },
                        ),
                      ),
                      Container(
                        height: 30.h,
                        width: 50.w,
                        // color: Colors.pink,e
                        child: StreamBuilder(
                          stream: db
                              .collection('points')
                              .orderBy('points', descending: true)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                  child: Text(
                                'Add the comments',
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(40),
                                    color: Colors.white),
                              ));
                            }
                            return ListView.builder(
                                itemCount: 1,
                                itemBuilder: (context, index) => Center(
                                      child: Text(
                                        snapshot.data.documents[3]['points']
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: ScreenUtil().setSp(20),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ));
                          },
                        ),
                      ),
                    ])
                  ],
                ),
              ))),
    );
  }
}
